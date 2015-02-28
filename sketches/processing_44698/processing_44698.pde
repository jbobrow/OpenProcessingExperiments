
int a=400;
int b=68;

void setup(){
  size (640,480);
  smooth();
  stroke(255,0,0);
};

void draw(){
background(255);
line(140,b,260,a);
line(140,b,420,b);
line(420,b,260,a);
line(260,b,260,a);
line(a,b,a,56);
line(mouseX,mouseY,mouseX*1.5,mouseY*1.5);
}

