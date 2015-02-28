
int r;
int p;
float rectsize = 20;


void setup()
{
  size( 1200, 600 );
  background( 255, 255, 255 );
  smooth();
  frameRate(999);
  colorMode(RGB, 100);
  noStroke();
  r=0;
  p=0;

}
 
 
void draw() {
  
  fill( 255, 255, 255);

  //rect( 0, 0, width, height );
  noStroke();

  if ( key == 'r' )
  {
    fill(random(255), 0, 0, 5);

  }
    if ( key == 'g' )
  {
    fill( 0, random(255), 0, 5);

  }
  if ( key == 'b' )
  {
    fill( 0, 0, 255, 5);
  }
   if ( mousePressed == true )
  {
    fill( random(100),random(100),random(100), 5);
  }
  
  
  translate(mouseX,mouseY);
  rotate(r);
  //rectMODE(RADIUS);
  rect(p, p, rectsize, rectsize);
  rect(40, 40, rectsize, rectsize);
  rect(80, 80, rectsize, rectsize);
  rect(100, 100, rectsize, rectsize);


 r++;
  
 p++;
 if (p > 500) {
 p=0;


 }
}


