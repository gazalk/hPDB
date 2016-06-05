{-# LANGUAGE OverloadedStrings #-}
-- | Basic properties of chemical 'Element's as suggested by Cambridge Structural Database.
--
-- NOTE: This module contains functions that could use hash tables for the lookup instead.
-- See https://ghc.haskell.org/trac/ghc/ticket/10565
module Bio.PDB.Structure.Elements(Element(..),
                                  -- Finding element for a given atom
                                  assignElement,
                                  -- Guessing element name from atom name (for standard residues only.)
                                  guessElement,
                                  -- properties of elements
                                  atomicNumber, atomicMass,
                                  covalentRadius,    maxCovalentRadius,
                                  vanDerWaalsRadius, maxVanDerWaalsRadius) where

import Prelude hiding (error, String)
import Data.ByteString.Char8 as BS
import System.IO.Unsafe(unsafePerformIO)
import System.IO(stderr)
import Bio.PDB.Structure(Atom(..))

-- | Type alias for 'Element' names.
type Element = BS.ByteString
-- TODO: May be better as a newtype, and make sure that other modules use this declaration

-- | Internal method that reports error to stderr, and return given default value.
defaulting e defaultValue = unsafePerformIO $ do BS.hPutStrLn stderr $ BS.concat e
                                                 return defaultValue

{-# INLINE atomicNumber      #-}
-- | Atomic number of a given element
atomicNumber :: Element -> Int
atomicNumber       "C" =   6
atomicNumber       "N" =   7
atomicNumber       "O" =   8
atomicNumber       "P" =  15
atomicNumber       "S" =  16
atomicNumber       "H" =   1
atomicNumber      "AC" =  89
atomicNumber      "AG" =  47
atomicNumber      "AL" =  13
atomicNumber      "AM" =  95
atomicNumber      "AR" =  18
atomicNumber      "AS" =  33
atomicNumber      "AT" =  85
atomicNumber      "AU" =  79
atomicNumber       "B" =   5
atomicNumber      "BA" =  56
atomicNumber      "BE" =   4
atomicNumber      "BH" = 107
atomicNumber      "BI" =  83
atomicNumber      "BK" =  97
atomicNumber      "BR" =  35
atomicNumber      "CA" =  20
atomicNumber      "CD" =  48
atomicNumber      "CE" =  58
atomicNumber      "CF" =  98
atomicNumber      "CL" =  17
atomicNumber      "CM" =  96
atomicNumber      "CO" =  27
atomicNumber      "CR" =  24
atomicNumber      "CS" =  55
atomicNumber      "CU" =  29
atomicNumber      "DB" = 105
atomicNumber      "DS" = 110
atomicNumber      "DY" =  66
atomicNumber      "ER" =  68
atomicNumber      "ES" =  99
atomicNumber      "EU" =  63
atomicNumber       "F" =   9
atomicNumber      "FE" =  26
atomicNumber      "FM" = 100
atomicNumber      "FR" =  87
atomicNumber      "GA" =  31
atomicNumber      "GD" =  64
atomicNumber      "GE" =  32
atomicNumber      "HE" =   2
atomicNumber      "HF" =  72
atomicNumber      "HG" =  80
atomicNumber      "HO" =  67
atomicNumber      "HS" = 108
atomicNumber       "I" =  53
atomicNumber      "IN" =  49
atomicNumber      "IR" =  77
atomicNumber       "K" =  19
atomicNumber      "KR" =  36
atomicNumber      "LA" =  57
atomicNumber      "LI" =   3
atomicNumber      "LR" = 103
atomicNumber      "LU" =  71
atomicNumber      "MD" = 101
atomicNumber      "MG" =  12
atomicNumber      "MN" =  25
atomicNumber      "MO" =  42
atomicNumber      "MT" = 109
atomicNumber      "NA" =  11
atomicNumber      "NB" =  41
atomicNumber      "ND" =  60
atomicNumber      "NE" =  10
atomicNumber      "NI" =  28
atomicNumber      "NO" = 102
atomicNumber      "NP" =  93
atomicNumber      "OS" =  76
atomicNumber      "PA" =  91
atomicNumber      "PB" =  82
atomicNumber      "PD" =  46
atomicNumber      "PM" =  61
atomicNumber      "PO" =  84
atomicNumber      "PR" =  59
atomicNumber      "PT" =  78
atomicNumber      "PU" =  94
atomicNumber      "RA" =  88
atomicNumber      "RB" =  37
atomicNumber      "RE" =  75
atomicNumber      "RF" = 104
atomicNumber      "RH" =  45
atomicNumber      "RN" =  86
atomicNumber      "RU" =  44
atomicNumber      "SB" =  51
atomicNumber      "SC" =  21
atomicNumber      "SE" =  34
atomicNumber      "SG" = 106
atomicNumber      "SI" =  14
atomicNumber      "SM" =  62
atomicNumber      "SN" =  50
atomicNumber      "SR" =  38
atomicNumber      "TA" =  73
atomicNumber      "TB" =  65
atomicNumber      "TC" =  43
atomicNumber      "TE" =  52
atomicNumber      "TH" =  90
atomicNumber      "TI" =  22
atomicNumber      "TL" =  81
atomicNumber      "TM" =  69
atomicNumber       "U" =  92
atomicNumber       "V" =  23
atomicNumber       "W" =  74
atomicNumber      "XE" =  54
atomicNumber       "Y" =  39
atomicNumber      "YB" =  70
atomicNumber      "ZN" =  30
atomicNumber      "ZR" =  40
atomicNumber      x    = defaulting ["Unknown atomic number for element:", BS.pack $ show x] 0

{-# INLINE covalentRadius    #-}
-- | Covalent radius of an element with a given name.
covalentRadius    "AC" = 2.15
covalentRadius    "AG" = 1.45
covalentRadius    "AL" = 1.21
covalentRadius    "AM" = 1.80
covalentRadius    "AR" = 1.51
covalentRadius    "AS" = 1.21
covalentRadius    "AT" = 1.21
covalentRadius    "AU" = 1.36
covalentRadius     "B" = 0.83
covalentRadius    "BA" = 2.15
covalentRadius    "BE" = 0.96
covalentRadius    "BH" = 1.50
covalentRadius    "BI" = 1.48
covalentRadius    "BK" = 1.54
covalentRadius    "BR" = 1.21
covalentRadius     "C" = 0.68
covalentRadius    "CA" = 1.76
covalentRadius    "CD" = 1.44
covalentRadius    "CE" = 2.04
covalentRadius    "CF" = 1.83
covalentRadius    "CL" = 0.99
covalentRadius    "CM" = 1.69
covalentRadius    "CO" = 1.26
covalentRadius    "CR" = 1.39
covalentRadius    "CS" = 2.44
covalentRadius    "CU" = 1.32
covalentRadius    "DB" = 1.50
covalentRadius    "DS" = 1.50
covalentRadius    "DY" = 1.92
covalentRadius    "ER" = 1.89
covalentRadius    "ES" = 1.50
covalentRadius    "EU" = 1.98
covalentRadius     "F" = 0.64
covalentRadius    "FE" = 1.52
covalentRadius    "FM" = 1.50
covalentRadius    "FR" = 2.60
covalentRadius    "GA" = 1.22
covalentRadius    "GD" = 1.96
covalentRadius    "GE" = 1.17
covalentRadius     "H" = 0.23
covalentRadius    "HE" = 1.50
covalentRadius    "HF" = 1.75
covalentRadius    "HG" = 1.32
covalentRadius    "HO" = 1.92
covalentRadius    "HS" = 1.50
covalentRadius     "I" = 1.40
covalentRadius    "IN" = 1.42
covalentRadius    "IR" = 1.41
covalentRadius     "K" = 2.03
covalentRadius    "KR" = 1.50
covalentRadius    "LA" = 2.07
covalentRadius    "LI" = 1.28
covalentRadius    "LR" = 1.50
covalentRadius    "LU" = 1.87
covalentRadius    "MD" = 1.50
covalentRadius    "MG" = 1.41
covalentRadius    "MN" = 1.61
covalentRadius    "MO" = 1.54
covalentRadius    "MT" = 1.50
covalentRadius     "N" = 0.68
covalentRadius    "NA" = 1.66
covalentRadius    "NB" = 1.64
covalentRadius    "ND" = 2.01
covalentRadius    "NE" = 1.50
covalentRadius    "NI" = 1.24
covalentRadius    "NO" = 1.50
covalentRadius    "NP" = 1.90
covalentRadius     "O" = 0.68
covalentRadius    "OS" = 1.44
covalentRadius     "P" = 1.05
covalentRadius    "PA" = 2.00
covalentRadius    "PB" = 1.46
covalentRadius    "PD" = 1.39
covalentRadius    "PM" = 1.99
covalentRadius    "PO" = 1.40
covalentRadius    "PR" = 2.03
covalentRadius    "PT" = 1.36
covalentRadius    "PU" = 1.87
covalentRadius    "RA" = 2.21
covalentRadius    "RB" = 2.20
covalentRadius    "RE" = 1.51
covalentRadius    "RF" = 1.50
covalentRadius    "RH" = 1.42
covalentRadius    "RN" = 1.50
covalentRadius    "RU" = 1.46
covalentRadius     "S" = 1.02
covalentRadius    "SB" = 1.39
covalentRadius    "SC" = 1.70
covalentRadius    "SE" = 1.22
covalentRadius    "SG" = 1.50
covalentRadius    "SI" = 1.20
covalentRadius    "SM" = 1.98
covalentRadius    "SN" = 1.39
covalentRadius    "SR" = 1.95
covalentRadius    "TA" = 1.70
covalentRadius    "TB" = 1.94
covalentRadius    "TC" = 1.47
covalentRadius    "TE" = 1.47
covalentRadius    "TH" = 2.06
covalentRadius    "TI" = 1.60
covalentRadius    "TL" = 1.45
covalentRadius    "TM" = 1.90
covalentRadius     "U" = 1.96
covalentRadius     "V" = 1.53
covalentRadius     "W" = 1.62
covalentRadius    "XE" = 1.50
covalentRadius     "Y" = 1.90
covalentRadius    "YB" = 1.87
covalentRadius    "ZN" = 1.22
covalentRadius    "ZR" = 1.75
covalentRadius    x    = defaulting ["Unknown covalent radius for element:", BS.pack $ show x] 0.0

{-# INLINE maxCovalentRadius #-}
-- | Upper bound of @covalentRadius@.
maxCovalentRadius :: Double
maxCovalentRadius  = covalentRadius "FR"

{-# INLINE atomicMass        #-}
-- | Atomic mass of a given element in g/mol
atomicMass :: Element -> Double
atomicMass         "C" =  12.011
atomicMass         "N" =  14.007
atomicMass         "O" =  15.999
atomicMass         "P" =  30.974
atomicMass         "S" =  32.066
atomicMass         "H" =   1.008
atomicMass        "AC" = 227.000
atomicMass        "AG" = 107.868
atomicMass        "AL" =  26.982
atomicMass        "AM" = 243.000
atomicMass        "AR" =  39.948
atomicMass        "AS" =  74.922
atomicMass        "AT" = 210.000
atomicMass        "AU" = 196.967
atomicMass         "B" =  10.811
atomicMass        "BA" = 137.327
atomicMass        "BE" =   9.012
atomicMass        "BH" = 264.000
atomicMass        "BI" = 208.980
atomicMass        "BK" = 247.000
atomicMass        "BR" =  79.904
atomicMass        "CA" =  40.078
atomicMass        "CD" = 112.411
atomicMass        "CE" = 140.116
atomicMass        "CF" = 251.000
atomicMass        "CL" =  35.453
atomicMass        "CM" = 247.000
atomicMass        "CO" =  58.933
atomicMass        "CR" =  51.996
atomicMass        "CS" = 132.905
atomicMass        "CU" =  63.546
atomicMass        "DB" = 262.000
atomicMass        "DS" = 271.000
atomicMass        "DY" = 162.500
atomicMass        "ER" = 167.260
atomicMass        "ES" = 252.000
atomicMass        "EU" = 151.964
atomicMass         "F" =  18.998
atomicMass        "FE" =  55.845
atomicMass        "FM" = 257.000
atomicMass        "FR" = 223.000
atomicMass        "GA" =  69.723
atomicMass        "GD" = 157.250
atomicMass        "GE" =  72.610
atomicMass        "HE" =   4.003
atomicMass        "HF" = 178.490
atomicMass        "HG" = 200.590
atomicMass        "HO" = 164.930
atomicMass        "HS" = 269.000
atomicMass         "I" = 126.904
atomicMass        "IN" = 114.818
atomicMass        "IR" = 192.217
atomicMass         "K" =  39.098
atomicMass        "KR" =  83.800
atomicMass        "LA" = 138.906
atomicMass        "LI" =   6.941
atomicMass        "LR" = 262.000
atomicMass        "LU" = 174.967
atomicMass        "MD" = 258.000
atomicMass        "MG" =  24.305
atomicMass        "MN" =  54.938
atomicMass        "MO" =  95.940
atomicMass        "MT" = 268.000
atomicMass        "NA" =  22.991
atomicMass        "NB" =  92.906
atomicMass        "ND" = 144.240
atomicMass        "NE" =  20.180
atomicMass        "NI" =  58.693
atomicMass        "NO" = 259.000
atomicMass        "NP" = 237.000
atomicMass        "OS" = 190.230
atomicMass        "PA" = 231.036
atomicMass        "PB" = 207.200
atomicMass        "PD" = 106.420
atomicMass        "PM" = 145.000
atomicMass        "PO" = 210.000
atomicMass        "PR" = 140.908
atomicMass        "PT" = 195.078
atomicMass        "PU" = 244.000
atomicMass        "RA" = 226.000
atomicMass        "RB" =  85.468
atomicMass        "RE" = 186.207
atomicMass        "RF" = 261.000
atomicMass        "RH" = 102.906
atomicMass        "RN" = 222.000
atomicMass        "RU" = 101.070
atomicMass        "SB" = 121.760
atomicMass        "SC" =  44.956
atomicMass        "SE" =  78.960
atomicMass        "SG" = 266.000
atomicMass        "SI" =  28.086
atomicMass        "SM" = 150.360
atomicMass        "SN" = 118.710
atomicMass        "SR" =  87.620
atomicMass        "TA" = 180.948
atomicMass        "TB" = 158.925
atomicMass        "TC" =  98.000
atomicMass        "TE" = 127.600
atomicMass        "TH" = 232.038
atomicMass        "TI" =  47.867
atomicMass        "TL" = 204.383
atomicMass        "TM" = 168.934
atomicMass         "U" = 238.029
atomicMass         "V" =  50.942
atomicMass         "W" = 183.840
atomicMass        "XE" = 131.290
atomicMass         "Y" =  88.906
atomicMass        "YB" = 173.040
atomicMass        "ZN" =  65.390
atomicMass        "ZR" =  91.224
atomicMass        x    = defaulting ["Unknown atomic mass for element:", BS.pack $ show x] 0.0

{-# INLINE vanDerWaalsRadius #-}
-- | Van der Waals radius of the given element
vanDerWaalsRadius :: Element -> Double
vanDerWaalsRadius  "C" = 1.70
vanDerWaalsRadius  "N" = 1.55
vanDerWaalsRadius  "O" = 1.52
vanDerWaalsRadius  "P" = 1.80
vanDerWaalsRadius  "S" = 1.80
vanDerWaalsRadius "AC" = 2.00
vanDerWaalsRadius "AG" = 1.72
vanDerWaalsRadius "AL" = 2.00
vanDerWaalsRadius "AM" = 2.00
vanDerWaalsRadius "AR" = 1.88
vanDerWaalsRadius "AS" = 1.85
vanDerWaalsRadius "AT" = 2.00
vanDerWaalsRadius "AU" = 1.66
vanDerWaalsRadius  "B" = 2.00
vanDerWaalsRadius "BA" = 2.00
vanDerWaalsRadius "BE" = 2.00
vanDerWaalsRadius "BH" = 2.00
vanDerWaalsRadius "BI" = 2.00
vanDerWaalsRadius "BK" = 2.00
vanDerWaalsRadius "BR" = 1.85
vanDerWaalsRadius "CA" = 2.00
vanDerWaalsRadius "CD" = 1.58
vanDerWaalsRadius "CE" = 2.00
vanDerWaalsRadius "CF" = 2.00
vanDerWaalsRadius "CL" = 1.75
vanDerWaalsRadius "CM" = 2.00
vanDerWaalsRadius "CO" = 2.00
vanDerWaalsRadius "CR" = 2.00
vanDerWaalsRadius "CS" = 2.00
vanDerWaalsRadius "CU" = 1.40
vanDerWaalsRadius "DB" = 2.00
vanDerWaalsRadius "DS" = 2.00
vanDerWaalsRadius "DY" = 2.00
vanDerWaalsRadius "ER" = 2.00
vanDerWaalsRadius "ES" = 2.00
vanDerWaalsRadius "EU" = 2.00
vanDerWaalsRadius  "F" = 1.47
vanDerWaalsRadius "FE" = 2.00
vanDerWaalsRadius "FM" = 2.00
vanDerWaalsRadius "FR" = 2.00
vanDerWaalsRadius "GA" = 1.87
vanDerWaalsRadius "GD" = 2.00
vanDerWaalsRadius "GE" = 2.00
vanDerWaalsRadius  "H" = 1.09
vanDerWaalsRadius "HE" = 1.40
vanDerWaalsRadius "HF" = 2.00
vanDerWaalsRadius "HG" = 1.55
vanDerWaalsRadius "HO" = 2.00
vanDerWaalsRadius "HS" = 2.00
vanDerWaalsRadius  "I" = 1.98
vanDerWaalsRadius "IN" = 1.93
vanDerWaalsRadius "IR" = 2.00
vanDerWaalsRadius  "K" = 2.75
vanDerWaalsRadius "KR" = 2.02
vanDerWaalsRadius "LA" = 2.00
vanDerWaalsRadius "LI" = 1.82
vanDerWaalsRadius "LR" = 2.00
vanDerWaalsRadius "LU" = 2.00
vanDerWaalsRadius "MD" = 2.00
vanDerWaalsRadius "MG" = 1.73
vanDerWaalsRadius "MN" = 2.00
vanDerWaalsRadius "MO" = 2.00
vanDerWaalsRadius "MT" = 2.00
vanDerWaalsRadius "NA" = 2.27
vanDerWaalsRadius "NB" = 2.00
vanDerWaalsRadius "ND" = 2.00
vanDerWaalsRadius "NE" = 1.54
vanDerWaalsRadius "NI" = 1.63
vanDerWaalsRadius "NO" = 2.00
vanDerWaalsRadius "NP" = 2.00
vanDerWaalsRadius "OS" = 2.00
vanDerWaalsRadius "PA" = 2.00
vanDerWaalsRadius "PB" = 2.02
vanDerWaalsRadius "PD" = 1.63
vanDerWaalsRadius "PM" = 2.00
vanDerWaalsRadius "PO" = 2.00
vanDerWaalsRadius "PR" = 2.00
vanDerWaalsRadius "PT" = 1.72
vanDerWaalsRadius "PU" = 2.00
vanDerWaalsRadius "RA" = 2.00
vanDerWaalsRadius "RB" = 2.00
vanDerWaalsRadius "RE" = 2.00
vanDerWaalsRadius "RF" = 2.00
vanDerWaalsRadius "RH" = 2.00
vanDerWaalsRadius "RN" = 2.00
vanDerWaalsRadius "RU" = 2.00
vanDerWaalsRadius "SB" = 2.00
vanDerWaalsRadius "SC" = 2.00
vanDerWaalsRadius "SE" = 1.90
vanDerWaalsRadius "SG" = 2.00
vanDerWaalsRadius "SI" = 2.10
vanDerWaalsRadius "SM" = 2.00
vanDerWaalsRadius "SN" = 2.17
vanDerWaalsRadius "SR" = 2.00
vanDerWaalsRadius "TA" = 2.00
vanDerWaalsRadius "TB" = 2.00
vanDerWaalsRadius "TC" = 2.00
vanDerWaalsRadius "TE" = 2.06
vanDerWaalsRadius "TH" = 2.00
vanDerWaalsRadius "TI" = 2.00
vanDerWaalsRadius "TL" = 1.96
vanDerWaalsRadius "TM" = 2.00
vanDerWaalsRadius  "U" = 1.86
vanDerWaalsRadius  "V" = 2.00
vanDerWaalsRadius  "W" = 2.00
vanDerWaalsRadius "XE" = 2.16
vanDerWaalsRadius  "Y" = 2.00
vanDerWaalsRadius "YB" = 2.00
vanDerWaalsRadius "ZN" = 1.39
vanDerWaalsRadius "ZR" = 2.00
vanDerWaalsRadius e    = defaulting ["Do not know van der Waals radius of", BS.pack $ show e] 0.0

{-# INLINE maxVanDerWaalsRadius #-}
-- | Upper bound of @vanDerWaalsRadius@.
maxVanDerWaalsRadius :: Double
maxVanDerWaalsRadius  = vanDerWaalsRadius "K"

{-# INLINE assignElement #-}
-- | Given a PDB 'Atom' extract or guess its 'Element' name.
assignElement :: Atom -> Element
assignElement at = case element at of
                     ""   -> guessElement . atName $ at
                     code -> code

{-# INLINE guessElement #-}
-- | Guessing an 'Element' name from PDB 'Atom' name. 
-- Returns empty string, if 'Element' can't be guessed.
guessElement :: BS.ByteString -> Element
guessElement "C"   = "C"
guessElement "C1'" = "C"
guessElement "C2"  = "C"
guessElement "C2'" = "C"
guessElement "C3'" = "C"
guessElement "C4"  = "C"
guessElement "C4'" = "C"
guessElement "C5"  = "C"
guessElement "C5'" = "C"
guessElement "C6"  = "C"
guessElement "C8"  = "C"
guessElement "CA"  = "C"
guessElement "CB"  = "C"
guessElement "CD"  = "C"
guessElement "CD1" = "C"
guessElement "CD2" = "C"
guessElement "CE"  = "C"
guessElement "CE1" = "C"
guessElement "CE2" = "C"
guessElement "CE3" = "C"
guessElement "CG"  = "C"
guessElement "CG1" = "C"
guessElement "CG2" = "C"
guessElement "CH2" = "C"
guessElement "CZ"  = "C"
guessElement "CZ2" = "C"
guessElement "CZ3" = "C"
guessElement "N"   = "N"
guessElement "N1"  = "N"
guessElement "N2"  = "N"
guessElement "N3"  = "N"
guessElement "N4"  = "N"
guessElement "N6"  = "N"
guessElement "N7"  = "N"
guessElement "N9"  = "N"
guessElement "ND1" = "N"
guessElement "ND2" = "N"
guessElement "NE"  = "N"
guessElement "NE1" = "N"
guessElement "NE2" = "N"
guessElement "NH1" = "N"
guessElement "NH2" = "N"
guessElement "NZ"  = "N"
guessElement "O"   = "O"
guessElement "O2"  = "O"
guessElement "O2'" = "O"
guessElement "O3'" = "O"
guessElement "O4"  = "O"
guessElement "O4'" = "O"
guessElement "O5'" = "O"
guessElement "O6"  = "O"
guessElement "OD1" = "O"
guessElement "OD2" = "O"
guessElement "OE1" = "O"
guessElement "OE2" = "O"
guessElement "OG"  = "O"
guessElement "OG1" = "O"
guessElement "OH"  = "O"
guessElement "OP1" = "O"
guessElement "OP2" = "O"
guessElement "OXT" = "O"
guessElement "P"   = "P"
guessElement "SD"  = "S"
guessElement "SG"  = "S"
guessElement _     = "" -- not a standard residue of protein or nucleic acid
