
class Bulb
{
  PVector pos = new PVector();
  color c = 0;
  //
  ArrayList <FireFly> fireFlies; // FireFlies Reference
  //
  Bulb(){}
  
 void update()
  {
    PVector mouse = new PVector( mouseX, mouseY );
//    c = max( 0, 255 - (int) pos.dist( mouse ) );
    color blendedColor = 0;
    for ( FireFly ff:fireFlies )
    {
      color ffColorWithAlpha = color( red(ff.c), green(ff.c), blue(ff.c), max(0,255-pos.dist( ff.pos )*0.4) );
      blendedColor = blendColor(blendedColor, ffColorWithAlpha, ADD);
    }
    c = color( red(blendedColor), green(blendedColor), blue(blendedColor) );
  }
 
  void render()
  {
    noStroke();
    fill( c );
    rect( pos.x, pos.y, 20, 20 );
  } 
}

