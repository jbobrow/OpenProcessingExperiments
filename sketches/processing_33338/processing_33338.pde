

int x = 10;
int y = 38;
int sizex = 10; 
int sizey = 60;


void setup(){

  size (1080,700, P2D);
  noCursor();
  smooth();
  frameRate(60);
  background(0);
  
}

void draw(){
  
  
  strokeWeight(0);
  stroke(5);
  fill(55,255,25,5);
  rect(x,y,sizex,sizey);
 
  if (x <= 1080){x = x + 29;}
  if (y <= 700){y = y + 20;}

  sizex = sizex + 153;
  sizey = sizey + 98;
  
  
  rect(x + 67,y +100 ,sizex,sizey);
  rect(x + y,y +5,sizex,sizey);
  
}


