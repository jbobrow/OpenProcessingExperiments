

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
   
   
   
  fill(0,0,random(100,300),80);
  stroke(random(0,255),random(0,255),random(0,100),20);
  strokeWeight(0.5);
  strokeWeight(8);
  fill(305,200,100,random(0,100));
  line( 0, 0, x, y);
 
  
  angle = angle + 0.1;
  r = r - diff ;
   
  if ( r == 0 || r == 400) {
    diff = diff * -1;
  }
   
  println(x);
   
   
  
   
  }




