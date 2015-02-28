

int x = 9;
int y = 78;
int sizex = 60; 
int sizey = 40;

void setup(){

  size (1080,700, P2D);
  noCursor();
  smooth();
  frameRate(60);
  background(255);
  
}

void draw(){
  
  
 
  strokeWeight(2);
  stroke(5);
  fill(25,80,90,5);
  ellipse(x,y,sizex,sizey);
 
  if (x <= 780){x = x + 6;}
  if (y <= 100){y = y + 8;}

  sizex += 6; 
  sizey += 8;
  ellipse(x + y,y + x,sizex,sizey);

  
}


