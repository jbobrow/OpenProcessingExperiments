

float x = random(100);
float y = random(130);
float sizex = random(18); 
float sizey = random(80);
float z = random(70);

void setup(){

  size (1080,700, P2D);
  noCursor();
  smooth();
  frameRate(60);
  background(0);
  
}

void draw(){
  
  
  strokeWeight(0);
  stroke(4);
  fill(random(190),random(125),random(255),90);
  rect(x,y,sizex,sizey);
 
  if (x <= 1080){x = x ++;}
  if (y <= 700){y = y ++;}

  x = x+ z;
  sizex = sizex + 5;
  sizey = sizey + 8;
  
  ellipse(x+ z,y +400,sizex,sizey);
  rect(x +20,y +50,sizex,sizey);
  
}


