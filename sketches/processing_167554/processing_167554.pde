

float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
 }

void draw() {

  noFill(); 
  x = r * cos(millis()); 
  y = r * sin(millis());
  translate(width/2, height/2); 
  
  pushMatrix();
  rotate(millis()*cos(angle));
  translate(x,y);
  stroke(random(255),0,random(255),random(50));
  ellipse(0,0,x,y);
  popMatrix();
  
  pushMatrix();
  rotate(cos(millis()/3000)*100);
  stroke(random(100),0,random(255),random(20));
  ellipse(0,0,x*3,y*1);
  popMatrix();
  
  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}

