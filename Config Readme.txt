









-- Your rig ID

-- Preferred currency you want to receive. Only used for anonymous pools with auto exchange such as Zpool, HR, ...
-- You must set your wallet for this currency within the Wallets Section found in the Advanced Options section.

-- Local currency shown within the profits screen (DOLLAR, EURO, GBP)

-- Location of your rig: EUROPE/US/ASIA (by default "US" will be used for pools that don't require or support this setting)

-- Pool user name for non-anonymous pools such as SprNova, BlocksFactory, or MiningPoolHub
-- You can ingore this settig if you're not using these types of pools

-- WALLETS for auto exchange pools. You only need set a wallet for your preferred currency (@@currency).
-- Other pools without an auto exchange, like Yiimp, will need a wallet defined for the same coin you are mining.
-- You can add wallets using pattern  @@WALLET_XXX=YYYYY (where XXX=currency symbol; YYYYY=your wallet).
-- For Nicehash if a @@WALLET_BTC_NICE=XXXXXXX is found it will be used, if not @@WALLET_BTC will be used.
-- For some coins, such as Electroneum, you will need a Payment ID. Add it after your address separated by a dot.

-- Number of minutes to mine as a donation each day (NOT PERCENT)

-- Use your cpu to mine: ENABLED = yes, DISABLED = no (you can start cpu alone mining also using -groupnames parameter in batch file)


-- **********************************************************************************************************
-- ********************                                                                  ********************
-- ********************   ADVANCED OPTIONS (don't change unless you know what they do)   ********************
-- ********************                                                                  ********************
-- **********************************************************************************************************


-- Profit recheck interval time (in seconds - less than 600 not recommended)
-- This interval recalculates and selects the most profitable algorithm 

-- Benchmarks interval time (less than 200 not recommended for GPU, 300 for CPU)
-- Screen to be shown at script start-up (WALLETS/CURRENT/HISTORY/PROFITS)



-- Percent to switch miner/algo, new miner/algo only will be launched if new profit is greater than actual profit in specified percent (example: 10 means that new miner/algo must be 10% more profitable than actual to be launched)

-- seconds to delay closing of old miners when new miner is selected as more profitable, this minimizes inactive time while switch. For benchmarking interval this value is automatically zero.



-- [OPTIONAL] API Keys
-- Some non-anonymous pools, such as Suprnova and MPH, require API keys to obtain wallet details.
-- For example @@APIKEY_MINING_POOL_HUB=a04e6sx30b38f73878ae40775f70efseff6582e8ec37600215755487ccbd36b4510b4
-- FORMAT: @@APIKEY_NAMEOFPOOL=XXXXXXXXXX) [optional] 


-- [OPTIONAL] GPU Groups
-- You can group your cards as you want. It's recommended to create a group for each card model in your rig, each group will be benchmarked and run separately (you can identify your GPU id's by launching GpuList.bat)
-- If you change any of your group names you must delete the stats folder contents and re-run benchmarks.
-- Type must be NVIDIA or AMD, if you dont set groups MM automatically makes 2 groups, one for all NVIDIA gpus and other for all AMD gpus
-- Example for rig with 3 NVIDIA gpu, each gpu alone @@GPUGROUPS=[{"GroupName" : "Card1","Type":"NVIDIA","Gpus":"0"},{"GroupName" : "Card2","Type":"NVIDIA","Gpus":"0"},{"GroupName" : "Card3","Type":"NVIDIA","Gpus":"0"}]
-- Example for rig with 5 NVIDIA and 2 AMD @@GPUGROUPS=[{"GroupName" : "1080","Type":"NVIDIA","Gpus":"0,1,2,3,4"} , {"GroupName" : "RX580","Type":"AMD","Gpus":"0,1"} ]