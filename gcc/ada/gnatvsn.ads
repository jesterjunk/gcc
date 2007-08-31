------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                              G N A T V S N                               --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 1992-2007 Free Software Foundation, Inc.          --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNAT;  see file COPYING.  If not, write --
-- to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, --
-- Boston, MA 02110-1301, USA.                                              --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  This package spec exports version information for GNAT, GNATBIND and
--  GNATMAKE.

package Gnatvsn is

   function Gnat_Version_String return String;
   --  Version output when GNAT (compiler), or its related tools, including
   --  GNATBIND, GNATCHOP, GNATFIND, GNATLINK, GNATMAKE, GNATXREF, are run
   --  (with appropriate verbose option switch set).

   Gnat_Static_Version_String : constant String := "GNU Ada";
   --  Static string identifying this version, that can be used as an argument
   --  to e.g. pragma Ident.

   type Gnat_Build_Type is (FSF, GPL);
   --  See Build_Type below for the meaning of these values.

   Build_Type : constant Gnat_Build_Type := FSF;
   --  Kind of GNAT build:
   --
   --    FSF
   --       GNAT FSF version. This version of GNAT is part of a Free Software
   --       Foundation release of the GNU Compiler Collection (GCC). The bug
   --       box generated by Comperr gives information on how to report bugs
   --       and list the "no warranty" information.
   --
   --    GPL
   --       GNAT GPL Edition. This is a special version of GNAT, released by
   --       Ada Core Technologies and intended for academic users, and free
   --       software developers. The bug box generated by the package Comperr
   --       gives appropriate bug submission instructions that do not reference
   --       customer number etc.

   function Gnat_Free_Software return String;
   --  Text to be displayed by the different GNAT tools when switch --version
   --  is used. This text depends on the GNAT build type.

   function Copyright_Holder return String;
   --  Return the name of the Copyright holder to be displayed by the different
   --  GNAT tools when switch --version is used.

   Ver_Len_Max : constant := 64;
   --  Longest possible length for Gnat_Version_String in this or any
   --  other version of GNAT. This is used by the binder to establish
   --  space to store any possible version string value for checks. This
   --  value should never be decreased in the future, but it would be
   --  OK to increase it if absolutely necessary.

   Library_Version : constant String := "4.3";
   --  Library version. This value must be updated whenever any change to the
   --  compiler affects the library formats in such a way as to obsolete
   --  previously compiled library modules.
   --
   --  Note: Makefile.in relies on the precise format of the library version
   --  string in order to correctly construct the soname value.

   Verbose_Library_Version : constant String := "GNAT Lib v" & Library_Version;
   --  Version string stored in e.g. ALI files.

   ASIS_Version_Number : constant := 6;
   --  ASIS Version. This is used to check for consistency between the compiler
   --  used to generate trees, and an ASIS application that is reading the
   --  trees. It must be updated (incremented) whenever a change is made to
   --  the tree format that would result in a compiler being incompatible with
   --  an older version of ASIS, or vice versa.

   PCS_Version_Number : constant := 1;
   --  PCS interface version. This is used to check for consistency between the
   --  compiler used to generate distribution stubs and the PCS implementation.
   --  It must be incremented whenever a change is made to the generated code
   --  for distribution stubs that would result in the compiler being
   --  incompatible with an older version of the PCS, or vice versa.

   Current_Year : constant String := "2007";
   --  Used in printing copyright messages

end Gnatvsn;
