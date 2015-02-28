
//int a = mouseX;
//int b = mouseY;
int a = 240;
int b = 240;
int x1 = a;
int y1 = b;
int x2 = a;
int y2 = b;
int x3 = a;
int y3 = b;
int x4 = a;
int y4 = b;
int z = 5;

void setup (){
  size(500,500);
  background(0);
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

/*  if(x1>500){
      background(0);
       x1 = a;
       y1 = b;
       x2 = a;
       y2 = b;
       x3 = a;
       y3 = b;
       x4 = a;
       y4 = b;
  }*/
  
    if(x1>500){
      x1 = a + z;
      y1 = b - z;
      x2 = a + z;
      y2 = b + z;
      x3 = a - z;
      y3 = b + z;
      x4 = a - z;
      y4 = b - z;
  }
  
  
}

