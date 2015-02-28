
int a = 0;
int b = 0;
int c = 0;
int ay = 0;
int by = 0;
float p = random (0,100);

void setup(){
  size ( 700,400);
  background(255);
}

void draw(){
}

void mousePressed (){
  a = mouseX;
  b = (mouseX - 50);
  c = (mouseX + 50);
  ay = mouseY;
  by = (mouseY + 50);
  fill(p);
  triangle(a,ay,b,by,c,by);
}

void mouseReleased (){
  //rect(0,0,width,height);
}

