
/*
    Copyright 2009 Michael Ogawa

    This file is part of Wordookie.

    Wordookie is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Wordookie is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Wordookie.  If not, see <http://www.gnu.org/licenses/>.
*/

import wordookie.Word;

class ColoredWord extends Word
{
  public color col;
  public int life;
  
  public ColoredWord( String t, float w )
  {
    super( t, w );
  }
}


