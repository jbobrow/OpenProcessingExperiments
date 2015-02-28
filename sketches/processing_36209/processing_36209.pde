
int x1=50;
int y1=x1;
int x2=21;
int y2=0;
int x3=0;
int y3=0;

int colour=0;

void setup() {
  size(700, 400);
  smooth();
}

void draw() {
  background(colour);
  println(x1);
  println(x2);
  
  circ();
}

void mouseMoved() 
{
  colour ++;
  if (colour==255) {
    colour=0;
  }
}

void circ(){
  ellipse(width/2, height/2, x1,x1);
  if((x1 > 19)&&(x1!=80)){
  x1=x1+1;
  
  
   
  }
  
}

void mouseReleased()
{
  x1=20;
}


