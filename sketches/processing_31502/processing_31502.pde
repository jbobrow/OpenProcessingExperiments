
int x1 = 240;
int y1 = 240;
int x2 = 260;
int y2 = 240;
int x3 = 260;
int y3 = 260;
int x4 = 240;
int y4 = 260;
int z = 3;

void setup (){
  size(500,500);
  background(0,0,255);
}

void draw(){

  noFill();
  //fill(0,0,255);
  stroke(43,random(217),255);
  strokeWeight(10);
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
  x1 = x1 + z;
  y1 = y1 - z;
  x2 = x2 + z;
  y2 = y2 + z;
  x3 = x3 - z;
  y3 = y3 + z;
  x4 = x4 - z;
  y4 = y4 - z;
  
}

