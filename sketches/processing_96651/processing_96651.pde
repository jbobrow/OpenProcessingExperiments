
size (256 , 256);
colorMode (RGB );
loadPixels ();
for (int i=0 ; i< pixels . length ; i++)
{
int d = int( random (1, 20));
pixels [i] = (d ==1)? color (255): color (0);
}
updatePixels ();


