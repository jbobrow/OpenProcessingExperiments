
PImage chualuz;
int x,y,x1,y1,x2,y2,x3,y3,x4,y4;
void setup(){
  chualuz=loadImage ("chualuz.jpg");
  size(500,500);  
  noFill();
}

void draw(){
  stroke (99,103,95);
  fill (175,206,139);
  x=200-mouseX-25;
  y=200-mouseY-25;
  x1=mouseX-25;
  y1=mouseY-25;
  x2=mouseX-40;
  y2=mouseY-30;
  x3=mouseY-80;
  y3=mouseX-90;
  x4=mouseY-65;
  y4=mouseX-50;
  
  rect(x1,100,50,50);
  rect(25,y2,50,50);
  rect(125,x2,50,50);
  rect(x,40,50,50);
  rect(y2,145,50,50);
  rect(25,y,30,50);
  rect(125,x2,50,50);
  rect(x4,43,20,67);
  rect(90,125,y4,50);
  rect(25,x3,50,73);
  rect(125,y1,y3,50);

for (int i = 0; i < 500; i = i+10) {
  line(0, i, 500, i);
}
}


