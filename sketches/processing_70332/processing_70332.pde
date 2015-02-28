
float inc; 
float xPos;
float yPos;
float rad; 

void setup(){
  background (0);
  size(600,600);
  smooth();
  inc = 0;
  rad = 40;
}

void draw(){
  translate(width/2, height/2);
  
  
  xPos = cos(radians(inc)) * rad; 
  yPos = sin(radians(inc)) * rad;
  
  
  stroke(random(0,255),random(0,255),random(0,255),50);
  line (30,20,xPos, yPos);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse (xPos, yPos, 10, 10);
  
  inc += 5;
  rad += 1;

}
