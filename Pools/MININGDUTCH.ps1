param(
    [Parameter(Mandatory = $false)]
    [String]$Querymode = $null,
    [Parameter(Mandatory = $false)]
    [pscustomobject]$Info
    )

#. .\Include.ps1

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName
$ActiveOnManualMode    = $true
$ActiveOnAutomaticMode = $true
$ActiveOnAutomatic24hMode=$true
$AbbName='DMN'
$WalletMode="APIKEY"
$Result=@()

if ($Querymode -eq "info"){
    $Result = [PSCustomObject]@{
                    Disclaimer = "Must register and set wallet for each coin on web"
                    ActiveOnManualMode=$ActiveOnManualMode  
                    ActiveOnAutomaticMode=$ActiveOnAutomaticMode
                    ActiveOnAutomatic24hMode=$ActiveOnAutomaticMode
                    ApiData = $true
                    AbbName=$AbbName
                    WalletMode=$WalletMode
                          }
    }




#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************


                        


#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************
#****************************************************************************************************************************************************************************************

if (($Querymode -eq "core" ) -or ($Querymode -eq "Menu")){

    
        $Pools=@()
        $Pools +=[pscustomobject]@{"coin" = "Anarchistprime"; "algo"="myriad-groestl"; "symbol"= "ACP "; "server"="mining-dutch.nl";"port"="3415";"location"="EU";"WalletSymbol"="ACP"};
        $Pools +=[pscustomobject]@{"coin" = "Auroracoin"; "algo"="myriad-groestl"; "symbol"= "AUR "; "server"="mining-dutch.nl";"port"="3761";"location"="EU";"WalletSymbol"="AUR"};
        $Pools +=[pscustomobject]@{"coin" = "Digibyte"; "algo"="myriad-groestl"; "symbol"= "DGB "; "server"="mining-dutch.nl";"port"="3472";"location"="EU";"WalletSymbol"="DGB"};
        $Pools +=[pscustomobject]@{"coin" = "Myriadcoin"; "algo"="myriad-groestl"; "symbol"= "XMY "; "server"="mining-dutch.nl";"port"="3708";"location"="EU";"WalletSymbol"="XMY"};
        $Pools +=[pscustomobject]@{"coin" = "Shield"; "algo"="myriad-groestl"; "symbol"= "XSH "; "server"="mining-dutch.nl";"port"="3762";"location"="EU";"WalletSymbol"="XSH"};
        $Pools +=[pscustomobject]@{"coin" = "Verge"; "algo"="myriad-groestl"; "symbol"= "XVG "; "server"="mining-dutch.nl";"port"="3426";"location"="EU";"WalletSymbol"="XVG"};


        
      
        

        $Pools |ForEach-Object {

 

                            $Result+=[PSCustomObject]@{
                                    Algorithm     = $_.Algo
                                    Info          = $_.Coin
                                    Price         = $null
                                    Price24h      = $null
                                    Protocol      = "stratum+tcp"
                                    Host          = "mining-dutch.nl"
                                    Port          = $_.Port
                                    User          = "$Username.$WorkerName"
                                    Pass          = "x"
                                    Location      = $_.Location
                                    SSL           = $false
                                    Symbol        = $_.symbol
                                    AbbName       = $AbbName
                                    ActiveOnManualMode    = $ActiveOnManualMode
                                    ActiveOnAutomaticMode = $ActiveOnAutomaticMode
                                    PoolWorkers     = $Null
                                    PoolHashRate    = [double]$ApiResponse.hashrate
                                    PoolName        = $Name
                                    WalletMode      = $WalletMode
                                    WalletSymbol    = $_.WalletSymbol
                                    OriginalAlgorithm =  $_.Algo
                                    OriginalCoin = $_.Coin
                                    Fee = 0.01
                                    EthStMode = 3


                                }

                        }
              
                Remove-Variable Pools
        }
                  
$Result |ConvertTo-Json | Set-Content $info.SharedFile
Remove-Variable Result