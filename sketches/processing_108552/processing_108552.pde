
void chara(int a, int b) {
  pushMatrix();
  scale(1.2);
  translate(a, b);
  fill(a,b,mouseX);
  stroke(200, 100, 50);
  fill(200, 100, 50);

//body
rect(20,40,45,20);
//head
quad(0,20,10,30,30,30,30,10);
ellipse(65,50,15,20);
//nec
rect(20,20,10,20);
triangle(30,10,40,40,30,40);
//leg
triangle(20,60,30,60,10,90);
triangle(60,60,70,60,80,90);

//tail
pushMatrix();
translate(70,50);
rotate(map( a,0,400,0,20));
triangle(0,0,90,40,70,50);
popMatrix();
//triangle(mouseX+95,20,90,40,70,50);
//
triangle(40,0,30,20,30,10);
//eye
stroke(10);
strokeWeight(2);
noFill();
ellipse(20,20,8,8);

pushMatrix();
translate(21,21);
rotate(map( a,0,400,0,20));
ellipse(1,1,2,2);
popMatrix();
//option
stroke(200,300,50);
line(20,35,37,30);
line(37,30, 400, -700);
 popMatrix();
}

float x, y;
float vx, vy;
void setup() {
  size(1000, 300);
  x=500;
  y=150;
  vx=4;
  vy=0;
}
void draw() {
  background(mouseX-50, 150, mouseX-50);
  chara(int(x)-50, int(y)-95);
  x=x+vx;
  y=y+vy;
  vy=vy+0.1;


  if (x>width-190)vx=-vx;
  if (x<50)vx=-vx;
  if (y>height-50)vy=-vy*0.9;
  if (y<50)vy=-vy*0.9;
  if (mousePressed) {
    if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
      vx=mouseX-pmouseX;
      vy=mouseY-pmouseY;
      if (mousePressed) {
        fill(255, 0, 0);
        textSize(30);
        text("Bow Bow!", mouseX, mouseY);
      }
    }
  }
}



