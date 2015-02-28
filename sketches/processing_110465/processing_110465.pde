
float x, y;
float angle = 30 ;
float r = random(0,360);
float diff = 1;
void setup() {
  size(600, 600);
  background(255);
  
}
void draw() {
  x=r*cos(angle);
  y=r*sin(angle);
  
  
  translate(width/2,height/2);
  rotate(r);
  
  
  
  fill(0,0,random(0,255),55);
  stroke(random(0,255),random(0,255),random(0,255),55);
  strokeWeight(0.5);
  rect(x, 0, x, 250);
  strokeWeight(3);
  fill(255,183,243,random(0,100));
  ellipse(0, 0, x, y);
  line( 0, 0, x, y);

 
  angle = angle + 0.1;
  r = r - diff ;
  
  if ( r == 0 || r == 400) {
    diff = diff * -1;
  }
  
  println(x);
  
  
 
  
  }
