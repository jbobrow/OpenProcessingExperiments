

int x = 10;
int y = 30;
int sizex = 18; 
int sizey = 80;


void setup(){

  size (1080,700, P2D);
  noCursor();
  smooth();
  frameRate(60);
  background(0);
  
}

void draw(){
  
  
  strokeWeight(8);
  stroke(10);
  fill(random(190),random(125),random(255),60);
  rect(x,y,sizex,sizey);
 
  if (x <= 1080){x = x + 49;}
  if (y <= 700){y = y + 90;}

  sizex = sizex + 53;
  sizey = sizey + 98;
  
  
  rect(x + 67,y +400 ,sizex,sizey);
  rect(x +20,y +550,sizex,sizey);
  
}


