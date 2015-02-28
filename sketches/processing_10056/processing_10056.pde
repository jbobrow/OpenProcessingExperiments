
boolean flip = false;


void setup()
{
  size (500, 500);
  background(255);
  smooth();

}



void draw()
{
 background(255);
  noStroke();
  fill(0);
  
        for ( float i = 0; i <= height; i+=17) 
     {
      ellipse(width/2, height/2, width-i, height-i);
      translate(0,-7);
      fill( 255 );
        if(flip)
          fill(0);
          flip = !flip;
noLoop();
}
}

