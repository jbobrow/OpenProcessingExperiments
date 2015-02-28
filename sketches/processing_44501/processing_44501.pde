
float time =0;

void setup () {
  size ( 800, 400);
  smooth();
  background(255);
  frameRate (25);
}
void draw () {
  float x =10 ;
  float m1  ;
  fill ( #1D2124,10);
  noStroke ();
  rect (0, 0, width, height);
  
  while ( x<width ) {
    strokeWeight (3);
    stroke ( 255);
    point (x, height* noise(x/100, time));
    x=x+10;
  }
  m1 = float(mouseX)/400;
  time = time+m1;
  println ( m1 ); 
}           
                
