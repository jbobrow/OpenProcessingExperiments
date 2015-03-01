
/**
 *  Luhn CA
 *  Ale, 2014
 *  Luhn s is one of the little algorithms most present in our everyday life.
 *  It s used to calculate the control digits of credit cards.
 *  This script explores some aesthetical properties of Luhn s algorithm
 *  using it in a process where each cell adquires a new state
 *  based on Luhn s checksum of the neighbour states. 
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation, version 2.1.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA
 */


int W, H, S;
int[] v, t;

void setup()
{
  size(900, 900, P2D);
  W = width;
  H = height;
  S = W*H;
  v = new int[S];
  t = new int[S];
  for(int i = 0; i < S; i++)  v[i] = i%2;
  frameRate(15);  
}

void draw()
{
    int i = 0;
    for(int y = 1; y < H-1; y++) for(int x = 1; x < W-1; x++)
    {
        i = y*W+x;
        t[i] = luhn(new int[] {v[i-W-1], v[i-W], v[i-W+1],
                               v[i-1],   v[i],   v[i+1],
                               v[i+W-1], v[i+W], v[i+W+1]});
    }
    arrayCopy(t, v);
    loadPixels();
    for(int y = 1; y < H-1; y++) for(int x = 1; x < W-1; x++)  
        pixels[i=(y*W)+x] = (v[i]<<5) * 0xFF010101;
    updatePixels();                  
}


// Calculates Luhns checksum
int luhn(int[] n)
{
    int s = 0;
    for(int i = 0, l = n.length; i < l; i++) s += n[i] << (i & 1);
    return  (s %= 10) == 0 ? 0 : 10 - s;
}

