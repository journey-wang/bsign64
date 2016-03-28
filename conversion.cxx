/* conversion.cxx
     $Id: conversion.cxx,v 1.2 1998/12/12 06:53:02 elf Exp $

   written by Oscar Levi
   21 November 1998

   This file is part of the project BSIGN.  See the file README for
   more information.

   Copyright (c) 1998 The Buici Company.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA

   -----------
   DESCRIPTION
   -----------

   Inlines for converting between little endian-ness and big endian-ness.

*/

  /* ----- Includes */

#include "standard.h"


  /* ----- Class Globals/Statics */

bool g_fOppositeSex;		// Host and current input file use
				// other byte ordering.

  /* ----- Methods */
unsigned64 _v (unsigned64 m)
{
  if (!g_fOppositeSex)
    return m;

  /* TODO not implemented */
  return m;
}  /* _v */

unsigned32 _v (unsigned32 l)
{
  if (!g_fOppositeSex)
    return l;
  return (  ((l & 0xff)     << 24)
	  | ((l >> 24) & 0xff)
	  | ((l & 0xff00)   << 8)
	  | ((l & 0xff0000) >> 8));
}  /* _v */

unsigned16 _v (unsigned16 s)
{
  if (!g_fOppositeSex)
    return s;
  return ((s & 0xff) << 8) | ((s >> 8) & 0xff);
}  /* _v */

int64 _v (int64 m)
{
  if (!g_fOppositeSex)
    return m;
  /* TODO not implemented */
  return m;
}  /* _v */

int32 _v (int32 l)
{
  if (!g_fOppositeSex)
    return l;
  return (  ((l & 0xff)     << 24)
	  | ((l >> 24) & 0xff)
	  | ((l & 0xff00)   << 8)
	  | ((l & 0xff0000) >> 8));
}  /* _v */

int16 _v (int16 s)
{
  if (!g_fOppositeSex)
    return s;
  return ((s & 0xff) << 8) | ((s >> 8) & 0xff);
}  /* _v */

