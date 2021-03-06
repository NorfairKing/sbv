{-# LANGUAGE CPP #-}

-- | Compatibility shim for GHC 7.8 support. Remove once 7.8 is no
-- longer supported.

#if MIN_VERSION_base(4,8,0)
module GHC.SrcLoc.Compat (module X) where

#if MIN_VERSION_base(4,9,0)
import SrcLoc as X hiding (srcLocFile)
#else
import GHC.SrcLoc as X
#endif

#else

module GHC.SrcLoc.Compat {-# WARNING "This version of GHC does not support SrcLoc; using a stub interface for compatibility" #-} (module GHC.SrcLoc.Compat) where

data SrcLoc

srcLocFile :: SrcLoc -> String
srcLocFile _ = ""

srcLocStartLine :: SrcLoc -> Int
srcLocStartLine _ = 0

srcLocStartCol :: SrcLoc -> Int
srcLocStartCol _ = 0

#endif
