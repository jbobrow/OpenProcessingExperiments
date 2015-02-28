
size (256,256);
colorMode (RGB);
loadPixels ();
for (int i=0 ; i<pixels.length; i++)
{
  color c=color (i/256,i%256,255);
  pixels [i]=c;
}
updatePixels ();



