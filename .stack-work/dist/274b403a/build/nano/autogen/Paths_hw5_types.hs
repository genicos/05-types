{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hw5_types (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\nicoa\\dev\\05-types\\.stack-work\\install\\d19353b6\\bin"
libdir     = "C:\\Users\\nicoa\\dev\\05-types\\.stack-work\\install\\d19353b6\\lib\\x86_64-windows-ghc-8.10.4\\hw5-types-0.1.0.0-HN94zkXcp2FLZXJ4JIMlc9-nano"
dynlibdir  = "C:\\Users\\nicoa\\dev\\05-types\\.stack-work\\install\\d19353b6\\lib\\x86_64-windows-ghc-8.10.4"
datadir    = "C:\\Users\\nicoa\\dev\\05-types\\.stack-work\\install\\d19353b6\\share\\x86_64-windows-ghc-8.10.4\\hw5-types-0.1.0.0"
libexecdir = "C:\\Users\\nicoa\\dev\\05-types\\.stack-work\\install\\d19353b6\\libexec\\x86_64-windows-ghc-8.10.4\\hw5-types-0.1.0.0"
sysconfdir = "C:\\Users\\nicoa\\dev\\05-types\\.stack-work\\install\\d19353b6\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hw5_types_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hw5_types_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hw5_types_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hw5_types_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hw5_types_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hw5_types_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
