param(
    [Parameter(Mandatory = $false)]
    [String]$Querymode = $null,
    [Parameter(Mandatory = $false)]
    [pscustomobject]$Info
    )

#. .\Include.ps1

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName
$ActiveOnManualMode    = $false
$ActiveOnAutomaticMode = $false
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

        $Pools +=[pscustomobject]@{"coin" = "Bulwark"; "algo"="nist5"; "symbol"= "BWK"; "server"="mining-dutch.nl";"port"="3758";"location"="EU";"WalletSymbol"="BWK "};
        $Pools +=[pscustomobject]@{"coin" = "Coimatic2"; "algo"="nist5"; "symbol"= "CTIC2"; "server"="mining-dutch.nl";"port"="3712";"location"="EU";"WalletSymbol"="CTIC2"};
        $Pools +=[pscustomobject]@{"coin" = "Ectam"; "algo"="nist5"; "symbol"= "ECT"; "server"="mining-dutch.nl";"port"="3759";"location"="EU";"WalletSymbol"="ECT"};
          $Pools +=[pscustomobject]@{"coin" = "Virtauniquecoin"; "algo"="nist5"; "symbol"= "VUC"; "server"="mining-dutch.nl";"port"="3408";"location"="EU";"WalletSymbol"="VUC"};
          $Pools +=[pscustomobject]@{"coin" = "Wyvern"; "algo"="nist5"; "symbol"= "WYV"; "server"="mining-dutch.nl";"port"="3497";"location"="EU";"WalletSymbol"="WYV"};     

        $Pools +=[pscustomobject]@{"coin" = "Bitquark"; "algo"="quark"; "symbol"= "BTQ"; "server"="mining-dutch.nl";"port"="3746";"location"="EU";"WalletSymbol"="BTQ"};
        $Pools +=[pscustomobject]@{"coin" = "Dimecoin"; "algo"="quark"; "symbol"= "DIME"; "server"="mining-dutch.nl";"port"="3486";"location"="EU";"WalletSymbol"="DIME"};
        $Pools +=[pscustomobject]@{"coin" = "Giro"; "algo"="quark"; "symbol"= "GIRO"; "server"="mining-dutch.nl";"port"="3434";"location"="EU";"WalletSymbol"="GIRO"};
        $Pools +=[pscustomobject]@{"coin" = "Joincoin"; "algo"="quark"; "symbol"= "J"; "server"="mining-dutch.nl";"port"="3736";"location"="EU";"WalletSymbol"="J"};
        $Pools +=[pscustomobject]@{"coin" = "Metacoin"; "algo"="quark"; "symbol"= "MET"; "server"="mining-dutch.nl";"port"="3461";"location"="EU";"WalletSymbol"="MET"};
        $Pools +=[pscustomobject]@{"coin" = "Quarkcoin"; "algo"="quark"; "symbol"= "QRK"; "server"="mining-dutch.nl";"port"="3474";"location"="EU";"WalletSymbol"="QRK"};
        $Pools +=[pscustomobject]@{"coin" = "Securecoin"; "algo"="quark"; "symbol"= "SRC"; "server"="mining-dutch.nl";"port"="3485";"location"="EU";"WalletSymbol"="SRC"};
        $Pools +=[pscustomobject]@{"coin" = "Sharkcoin"; "algo"="quark"; "symbol"= "SAK"; "server"="mining-dutch.nl";"port"="3713";"location"="EU";"WalletSymbol"="SAK"};








        $Pools |ForEach-Object {

 

                            $Result+=[PSCustomObject]@{
                                    Algorithm     = $_.Algo
                                    Info          = $_.Coin
                                    Price         = $null
                                    Price24h      = $null
                                    Protocol      = "stratum+tcp"
                                    Host          = $_Server
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
