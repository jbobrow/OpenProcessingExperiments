
//Reference - http://www.youtube.com/watch?v=MOec_tdnx8A

//Variables
 float x1,y1, rad1;
 float deg = 0;
 
void setup(){
  
  size(700,400);
  background(0);
  stroke(255);
  smooth();
  frameRate(30);
  
}


void draw(){
  
  deg = deg +5;
  rad1 = (PI/180)*deg;
  x1 = sin(rad1)*100+(width/2);
  y1 = cos(rad1)*100+(height/2);
  
  //background(0);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
  fill(255);
  ellipse(x1,y1,50,50);
  
//Resets deg  
 if (deg>=360)
 {
 deg = 0;
 }
}

void mousePressed(){
  if(mouseButton == LEFT)
 {
 noLoop();
 }
 
 if(mouseButton == RIGHT)
 {
 loop();
 } 
}

