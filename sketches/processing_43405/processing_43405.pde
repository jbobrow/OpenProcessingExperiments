
/*
I tried a clever frequency approach, but failed:
http://www.andrew.cmu.edu/user/mwkaufma/content/applets/frequency/
 
So here's my dirty anisotropic "hole-filling" approach...
--Max
*/


size(600,357, P2D);
PImage I = loadImage("problematic_sunset.jpg");
I.loadPixels();
int pitch=I.width,r,g,b;
//clear the alpha mask
loadPixels();
for (int x=0; x<I.width; x++)
  for (int y=0; y<I.height; y++)
    I.pixels[x+y*pitch] &= 0x00FFFFFF;
//compute first-pass alpha mask
for (int x=0; x<I.width; x++)
  for (int y=0; y<I.height; y++)
  {
    r = (I.pixels[x+y*pitch]&0x00FF0000)>>16;
    b = (I.pixels[x+y*pitch]&0x000000FF);
    if (r+b < 80)
    {
      I.pixels[x+y*pitch] |= 0xFF000000;
      I.pixels[constrain(x+1,0,pitch-1)+y*pitch] |= 0xFF000000;
      I.pixels[constrain(x-1,0,pitch-1)+y*pitch] |= 0xFF000000;
      I.pixels[x+constrain(y+1,0,I.height-1)*pitch] |= 0xFF000000;
      I.pixels[x+constrain(y-1,0,I.height-1)*pitch] |= 0xFF000000;
    }
    else
      pixels[x+y*width] = I.pixels[x+y*pitch];
  }
//make two "smart" dialation passes
for (int i=0; i<2; i++)
{
  for (int x=0; x<I.width; x++)
  for (int y=0; y<I.height; y++)
  {
    g = (I.pixels[x+y*pitch]&0x0000FF00)>>8;
    b = (I.pixels[x+y*pitch]&0x000000FF);
    if ((g+b)>>1 < 160)
      if ((I.pixels[constrain(x+1,0,pitch-1)+y*pitch]&0x0F000000) != 0 || 
          (I.pixels[constrain(x-1,0,pitch-1)+y*pitch]&0x0F000000) != 0 || 
          (I.pixels[x+constrain(y+1,0,I.height-1)*pitch]&0x0F000000) != 0 || 
          (I.pixels[x+constrain(y-1,0,I.height-1)*pitch]&0x0F000000) != 0 ||
          (I.pixels[constrain(x+1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x0F000000) != 0 || 
          (I.pixels[constrain(x+1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x0F000000) != 0 || 
          (I.pixels[constrain(x-1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x0F000000) != 0 || 
          (I.pixels[constrain(x-1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x0F000000) != 0)
      {
        I.pixels[x+y*pitch] |= 0xF0000000;
      }
  }
  for (int x=0; x<I.width; x++)
  for (int y=0; y<I.height; y++)
    if((I.pixels[x+y*pitch]&0xF0000000) != 0)
      I.pixels[x+y*pitch]|=0xFF000000;
}
//anisotropic blurring within mask
for (int i=0; i<100; i++)
{
  for (int x=0; x<I.width; x++)
  for (int y=0; y<I.height; y++)
  if ((I.pixels[x+y*pitch]&0xFF000000) != 0)
  //propogate data in from the left
  {
    r =  1*(I.pixels[x+y*pitch]&0x00FF0000)>>16;
    r += 4*(I.pixels[constrain((x-1)+y*pitch,0,I.width*I.height-1)]&0x00FF0000)>>16;
    r += 2*(I.pixels[constrain((x-2)+y*pitch,0,I.width*I.height-1)]&0x00FF0000)>>16;
    r += 1*(I.pixels[constrain((x-3)+y*pitch,0,I.width*I.height-1)]&0x00FF0000)>>16;
    r>>=3;
    g =  1*(I.pixels[x+y*pitch]&0x0000FF00)>>8;
    g += 4*(I.pixels[constrain((x-1)+y*pitch,0,I.width*I.height-1)]&0x0000FF00)>>8;
    g += 2*(I.pixels[constrain((x-2)+y*pitch,0,I.width*I.height-1)]&0x0000FF00)>>8;
    g += 1*(I.pixels[constrain((x-3)+y*pitch,0,I.width*I.height-1)]&0x0000FF00)>>8;
    g>>=3;
    b =  1*(I.pixels[x+y*pitch]&0x000000FF);
    b += 4*(I.pixels[constrain((x-1)+y*pitch,0,I.width*I.height-1)]&0x000000FF);
    b += 2*(I.pixels[constrain((x-2)+y*pitch,0,I.width*I.height-1)]&0x000000FF);
    b += 1*(I.pixels[constrain((x-3)+y*pitch,0,I.width*I.height-1)]&0x000000FF);
    b>>=3;
    I.pixels[x+y*pitch] =((r<<16) + (g<<8) + b)|0xFF000000;
  }
  for (int x=I.width-1; x>=0; x--)
  for (int y=0; y<I.height; y++)
  if ((I.pixels[x+y*pitch]&0xFF000000) != 0)
  //porpogate data in from the right
  {
    r =  1*(I.pixels[x+y*pitch]&0x00FF0000)>>16;
    r += 4*(I.pixels[constrain((x+1)+y*pitch,0,I.width*I.height-1)]&0x00FF0000)>>16;
    r += 2*(I.pixels[constrain((x+2)+y*pitch,0,I.width*I.height-1)]&0x00FF0000)>>16;
    r += 1*(I.pixels[constrain((x+3)+y*pitch,0,I.width*I.height-1)]&0x00FF0000)>>16;
    r>>=3;
    g =  1*(I.pixels[x+y*pitch]&0x0000FF00)>>8;
    g += 4*(I.pixels[constrain((x+1)+y*pitch,0,I.width*I.height-1)]&0x0000FF00)>>8;
    g += 2*(I.pixels[constrain((x+2)+y*pitch,0,I.width*I.height-1)]&0x0000FF00)>>8;
    g += 1*(I.pixels[constrain((x+3)+y*pitch,0,I.width*I.height-1)]&0x0000FF00)>>8;
    g>>=3;
    b =  1*(I.pixels[x+y*pitch]&0x000000FF);
    b += 4*(I.pixels[constrain((x+1)+y*pitch,0,I.width*I.height-1)]&0x000000FF);
    b += 2*(I.pixels[constrain((x+2)+y*pitch,0,I.width*I.height-1)]&0x000000FF);
    b += 1*(I.pixels[constrain((x+3)+y*pitch,0,I.width*I.height-1)]&0x000000FF);
    b>>=3;
    I.pixels[x+y*pitch] =((r<<16) + (g<<8) + b)|0xFF000000;
  }    
}
for (int i=0; i<3; i++)
for (int x=0; x<I.width; x++)
for (int y=0; y<I.height; y++)
if ((I.pixels[x+y*pitch]&0xFF000000) != 0)
//blur the resulting "stripey" data
{
  r = (I.pixels[x+y*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[constrain(x+1,0,pitch-1)+y*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[constrain(x-1,0,pitch-1)+y*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[x+constrain(y+1,0,I.height-1)*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[x+constrain(y-1,0,I.height-1)*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[constrain(x+1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[constrain(x+1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[constrain(x-1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x00FF0000)>>16;
  r+= (I.pixels[constrain(x-1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x00FF0000)>>16;
  r /= 9;
  g = (I.pixels[x+y*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[constrain(x+1,0,pitch-1)+y*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[constrain(x-1,0,pitch-1)+y*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[x+constrain(y+1,0,I.height-1)*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[x+constrain(y-1,0,I.height-1)*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[constrain(x+1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[constrain(x+1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[constrain(x-1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x0000FF00)>>8;
  g+= (I.pixels[constrain(x-1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x0000FF00)>>8;
  g /= 9;
  b = (I.pixels[x+y*pitch]&0x000000FF);
  b+= (I.pixels[constrain(x+1,0,pitch-1)+y*pitch]&0x000000FF);
  b+= (I.pixels[constrain(x-1,0,pitch-1)+y*pitch]&0x000000FF);
  b+= (I.pixels[x+constrain(y+1,0,I.height-1)*pitch]&0x000000FF);
  b+= (I.pixels[x+constrain(y-1,0,I.height-1)*pitch]&0x000000FF);
  b+= (I.pixels[constrain(x+1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x000000FF);
  b+= (I.pixels[constrain(x+1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x000000FF);
  b+= (I.pixels[constrain(x-1,0,pitch-1)+constrain(y+1,0,I.height-1)*pitch]&0x000000FF);
  b+= (I.pixels[constrain(x-1,0,pitch-1)+constrain(y-1,0,I.height-1)*pitch]&0x000000FF);
  b /= 9;
  I.pixels[x+y*pitch] =((r<<16) + (g<<8) + b);
} 
arraycopy(I.pixels,0,pixels,0,I.width*I.height);
updatePixels();

