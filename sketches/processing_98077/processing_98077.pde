
void setup()
{
  size(500,500);
}

void draw ()
{
loadPixels ();
for ( int p =1 ; p < pixels . length ; p ++)
{
int x = p % width ;
int y = p / width ;
float w1 = wave (x , y , 50 , 50 , 100);
float w2 = wave (x , y , 20 , 50 , 50);
float w = constrain ( w1 + w2 ,0 ,1);
pixels [ p ]= lerpColor ( color (#F50707) , color (#000000) , w );
}
updatePixels ();
}
float wave ( int x , int y , int xo , int yo , int wl )
{
float d = dist (x , y , xo , yo );
float w = map (d , 0 , wl , 0 , TWO_PI );
return map ( sin ( w ) , -1 , 1 , 0 , 2);
}


