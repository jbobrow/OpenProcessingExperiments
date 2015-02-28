

float x = 100;
float y = 180;
float sizex = 108; 
float sizey = 80;
float z = 90;

void setup(){

  size (1080,700, P2D);
  noCursor();
  smooth();
  frameRate(60);
  background(0);
  
}

void draw(){
  
  
  strokeWeight(4);
  stroke(4);
  fill(random(190),random(125),random(255),90);
  rect(x,y,sizex,sizey);
 
  if (x <= 1080){x = x ++;}
  if (y <= 700){y = y ++;}

  x = x+ z;
  y = y++;
  sizex = sizex + 5;
  sizey = sizey + 8;
  
  rect(x+ z,y +40,sizex,sizey);
  rect(x + 20,y +50,sizex,sizey);
 
}


