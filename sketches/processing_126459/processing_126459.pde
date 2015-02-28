
int x, y;
int vx;
int vy;
int a;
int b;

void setup() {
  size(800, 800);
  x=0;
  y=height/2;
  vx=5;
  vy=5;
}


void draw() {
  background(#bfbfbf);
   if (mousePressed);{
    background(#40E0D0);
  }

  chara(x+50,y-70);
 
//mojamoja 
   pushMatrix();
translate(50,120);
translate(x, y-90);
rotate(map(mouseX, 0, 400, 0, 6.28));
//noStroke();
fill(#ffffff);
line(100,0,400,0);
rotate(PI/6);
line(100,0,230,0);
rotate(PI/6);
line(100,0,530,0);
rotate(PI/6);
line(100,0,230,0);
rotate(PI/6);
line(100,0,500,0);
rotate(PI/6);
line(100,0,230,0);
rotate(PI/6);
line(100,0,430,0);
rotate(PI/6);
line(100,0,230,0);
rotate(PI/6);
line(100,0,900,0);
rotate(PI/6);
line(100,0,230,0);
rotate(PI/6);
line(100,0,7000,0);
rotate(PI/6);
line(100,0,400,0);
rotate(PI/6);
line(100,0,290,0);

 

 fill(#FF0000);
  //kitanneehanabidaze
  ellipse(x+10, x, 90, 90);
  ellipse(100, x+10, 10, 10);
  ellipse(120, x-90, 30, 30);
  fill(250);
  ellipse(x-100, x-20, 40, 40);
  ellipse(20, x-10, 35, 35);
  ellipse(x+10, x+90, 30, 30);
  fill(250);
  ellipse(x-70, 100, 40, 40);
  fill(#FF0000);
  ellipse(x-10, 20, 10, 10);
  ellipse(x-90, 20, 90, 90);
  ellipse(x-10, X-20, 50, 50);
  
   
    
popMatrix();



x=x+vx;
if (x>width-80) {
  vx=-5;
}

x=x+vx;
if (x<80) {
  vx=5;
}

y=y+vy;
if (y>height-200) {
  vy=-5;
}

y=y+vy;
if (y<+50) {
  vy=5;
}

if (mousePressed) {
  if ((mouseX>x-100)&&(mouseX<x+100)&&(mouseY>y-100)&&(mouseY<y+100)) {
    x=mouseX;

    y=mouseY;
  }
}
}
void chara(int a, int b) {

  pushMatrix() ;

  translate(a, b);


fill(#ffffff);
  ellipse(0, 100, 200, 200);
  fill(100);
  stroke(200, 0, 0 );


  ellipse(50, 50, 50, 50);
  fill(250);
  ellipse(50, 40, 10, 10);
  ellipse(10, 60, 10, 10);
  ellipse(70, 40, 10, 10);
  fill(250);
  ellipse(20, 70, 20, 20);
  popMatrix();
}



