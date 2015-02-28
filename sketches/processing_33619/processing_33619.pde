
int a = 0;
int b = 400;
int c = 0;
int d = 0;
int e = 0;
int f = 500;

int g = 350;
int h = 0;
int i = 100;

void setup(){
  size (700,400);
  background (255);
  
}

void draw(){
  
}

void mousePressed(){
 
  
  if (mouseX < 50){
  line(a,c,a,b);
  a = a + 50;
 }
  
  if (mouseY < 50){
  line(d,e,f,d);
  e = e + 100;
  
  }
  
  if (300 < mouseX && 400 > mouseX){
  noFill();
  ellipse(g,h,i,i);
  i = i + 30;
  }
  
}

