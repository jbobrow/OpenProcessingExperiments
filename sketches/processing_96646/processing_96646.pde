
void draw ()
{
loadPixels ();
for (int p=0 ; p< pixels . length ; p++)
{
int x = p% width ;
int y = p/ width ;
pixels [p] = wave (x, y, 50, 50, 20, color (0) , color (255));
}
updatePixels ();
}
color wave (int x, int y, int xo , int yo , int wl , color from , color to)
{
float d = dist (x, y, xo , yo );
float w = map(d, 0, wl , 0, TWO_PI );
float s = map(sin(w), -1, 1, 0, 1);
return lerpColor (from , to , s);
}


