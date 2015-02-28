
int x, y;
int vx;
int vy;

void setup() {
  size(600, 600);
  //noCursor();
  x=0;
  y=0;
  vx=5;
  vy=5;
}  

void chara(int a,int b) {
  
  pushMatrix();
  
  translate(a,b);
  
  fill(0);
  ellipse(75, 55, 20, 50);
  triangle(70, 10, 90, 50, 10, 60);
  fill(255, 255, 255);
  strokeWeight(5);
  ellipse(70, 35, 30, 30);
  ellipse(35, 25, 20, 20);
  fill(0);
  noStroke();
  ellipse(70, 35, x/15, x/15);
  ellipse(35, 25, y/-27, y/-27);
  stroke(0);
  strokeWeight(5);
  line(75, 55, 65, 90);
  line(75, 55, 80, 90);
  line(70, 55, 55, 65);
  line(75, 55, 90, 65);
  popMatrix();
  
}

void draw() {

  background(x,y);

  chara(x-50, y-50);
  chara(x-100, y-5);
  chara(x-5, y-10);



  x=x+vx;
  if (x>width-100) {
    vx=-3;
  }

  if (x<100) {
    vx=15;
  }

  y=y+vy;
  if (y>height-100) {
    vy=-15;
  }

  if (y<50) {
    vy=5;
  }




  if (mousePressed) {
    if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
    }
  }
}

