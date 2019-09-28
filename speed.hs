import Numeric.LinearAlgebra
import Text.Printf

haversine :: Matrix Double  -> Matrix Double
haversine dat  = 
    radius * ( 2.0 * arctan2 (sqrt intermediate) (sqrt (1-intermediate)))
    where 
        rlat1 = dat ? [0] * pi/180
        rlat2 = dat ? [2] * pi/180
        rdeltalat = ((dat ? [2]) - (dat ? [0])) * pi/180
        rdeltalon = ((dat ? [3]) - (dat ? [1])) * pi/180
        intermediate = (sin (rdeltalat/2) * sin (rdeltalat/2.0)) + (cos rlat1 * cos rlat2 * (sin (rdeltalon/2.0) * sin (rdeltalon/2.0)))
        radius = 6371.0

test_haversine :: Int ->  Double
test_haversine c =
    let geos r c = (c><r) (take (r*c) (cycle [64.1265, -21.8174, 40.7128, -74.0060])) :: Matrix Double
        dat = tr (geos 4 c)
        result = sumElements (haversine dat)
    in result

main :: IO ()
main = print ( show ( test_haversine 100000000))

