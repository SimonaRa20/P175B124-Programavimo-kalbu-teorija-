-- 729 užduotis
-- Simona Ragauskaitė IFF-0/3
countOnes ::String -> Integer
countOnes str = toInteger . length $ filter (\x -> x == '1') str
-- sudarau visus įmanomus derinius
perms ::Integer -> [String]
perms sk
  | sk == 0 = [""]
  | otherwise = concat $ map (\x -> [x++"0", x++"1"]) $ perms $ sk-1
-- atrenku kurie atitinka sąlygą ir susidedu į list'ą
filteredPerms ::  Integer -> Integer -> [String]
filteredPerms sk cnt = filter (\x -> countOnes(x) == cnt) $ perms sk
-- main class'e, joje nusiskaitau duomenis, o apskaičiuotus rezultatus išrašau į failą
main = do
  s <- readFile "duom.txt"
  writeFile "res.txt" $ concat 
    $ map (\x -> unlines [unlines $ filteredPerms (x!!0) (x!!1)] ) 
    $ map (\x -> map (\y -> read y :: Integer) $ words x) $ tail $ lines s