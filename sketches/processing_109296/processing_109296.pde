
float x, y;
float angle = 0 ;
float r = 200;
float diff = 4;

void setup() {

  size(600, 600);
  background(#FFF364);
}

void draw() {

  x=r*cos(angle);
  y=r*sin(angle);
  
  translate(width/2,height/2); 
  rotate(r);
  
  
  fill(#FF7300,25);
  stroke(0,80);
  strokeWeight(0.5);
  ellipse(x, 0, x, 70);
  ellipse(0, 0, x, y);
  line( 0, 0, x, y);

 
  angle = angle + 0.2;
  r = r - diff ;
  
  if ( r == 0 || r == 300) {
    diff = diff * -1;
  }
  
  println(x);
  }
  

