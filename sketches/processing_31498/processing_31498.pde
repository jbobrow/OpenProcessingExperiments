
int x = 100;
int y = 50;

void setup(){
  size(500,500);
}
  
void draw(){
  strokeWeight(5);
  stroke(0,255,0);
  background(0);
  noFill();
  quad(x,0, x,y, y,x, 0,x);
  x = x+2;
  y = y+2;

  if(x>1000){
      x = 0;
  }
  
}

//void 
