
float x, y;
float vx, vy;

void setup() {
  size(600, 600);
  x=200;
  y=200;
  vx=3;
  vy=0;
}

void draw() {
  background(129, 205, 255);  

 pushMatrix();
  scale(0.7);
  kyara(int(x), int(y));
  popMatrix();
  
  //kusa
  stroke(107, 252, 173);
  fill(107, 252, 173);
  ellipse(30, 490, 80, 50);
  ellipse(90, 470, 45, 60);
  ellipse(130, 500, 100, 80);
  ellipse(200, 460, 70, 50);
  ellipse(260, 460, 80, 40);
  ellipse(300, 450, 60, 90);
  ellipse(360, 470, 50, 20);
  ellipse(400, 460, 80, 60);
  ellipse(450, 460, 50, 80);
  ellipse(510, 470, 80, 50);
  ellipse(580, 450, 30, 20);

  stroke(32, 196, 98);
  fill(32, 196, 98);
  ellipse(70, 510, 90, 50);
  ellipse(120, 540, 100, 70);
  ellipse(200, 510, 50, 80);  
  ellipse(240, 500, 70, 60);
  ellipse(300, 500, 60, 40);
  ellipse(330, 520, 60, 20);
  ellipse(410, 500, 70, 50);
  ellipse(460, 490, 50, 70);
  ellipse(530, 520, 100, 40);
  ellipse(560, 480, 50, 20);

  stroke(10, 142, 64);
  fill(10, 142, 64);
  ellipse(240, 540, 70, 40);
  ellipse(280, 570, 90, 40);
  ellipse(330, 550, 100, 40);
  ellipse(500, 580, 90, 50);

  //hana
  stroke(255);
  fill(255);
  ellipse(100, 440, 20, 20);
  ellipse(120, 500, 40, 40);
  ellipse(240, 460, 25, 25);
  ellipse(300, 480, 35, 35);
  ellipse(500, 500, 30, 30);

  stroke(255, 222, 255);
  fill(255, 222, 255);
  ellipse(120, 510, 20, 20);
  ellipse(300, 490, 15, 15);

  
 
  kyara(int(x)-50, int(y)-50);

  x=x+vx;
  y=y+vy;

  vy=vy+0.1;

  if (x>width-55) vx=-vx;
  if (x<55) vx=-vx;
  if (y>height-100) vy=-vy*0.9;
  if (y<100) vy=-vy*0.9;

  if (mousePressed) {
    if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
      vx=mouseX-pmouseX;
      vy=mouseY-pmouseY;
    }
  }


  //haikei temae
  stroke(10, 142, 64);
  fill(10, 142, 64);
  ellipse(60, 570, 130, 70);
  ellipse(150, 560, 80, 90);
  ellipse(420, 560, 60, 100);
  ellipse(570, 560, 100, 60);

  stroke(255);
  fill(255);
  ellipse(70, 530, 60, 60);
  ellipse(460, 550, 50, 50);

  stroke(255, 222, 255);
  fill(255, 222, 255);  
  ellipse(70, 535, 40, 40);
  ellipse(460, 557, 35, 35);

  stroke(255, 201, 255);
  fill(255, 201, 255);
  ellipse(70, 540, 30, 30);
  ellipse(460, 563, 25, 25);
}

void kyara(int a, int b) {
  pushMatrix();
  translate(a, b);
 
if (mousePressed){
 stroke(255);
 fill(255);
  ellipse(-3,70,3,3);
  ellipse(-5,90,1,1);
  ellipse(-10,80,2,2);
  ellipse(110,80,2,2);
  ellipse(103,70,3,3);
  ellipse(105,90,1,1);
}
 
  //hane
  pushMatrix();
  translate(20, 80);
  rotate(a);
  stroke(219, 255, 242);
  fill(219, 255, 242);
  ellipse(0, 0, 30, 15);
  popMatrix();
  pushMatrix();
  translate(80, 80);
  rotate(-a);
  ellipse(0, 0, 30, 15);
  popMatrix();

  //asi
  strokeWeight(5);
  stroke(250, 239, 116);
  line(40, 80, 40, 100);
  line(60, 80, 60, 100);

  //te
  line(40, 80, 15, 80);
  line(60, 80, 85, 80);

  //karada
  strokeWeight(2);
  stroke(30, 245, 20);
  fill(a, b, 146);
  triangle(50, 60, 20, 90, 80, 90);

  //tuno
  strokeWeight(5);
  stroke(250, 239, 116);
  line(80, 10, 75, 10);
  line(20, 10, 25, 10);
  if (mousePressed) {
    stroke(254,0,255);
    line(80, 10, 75, 10);
    line(20, 10, 25, 10);
  }
  line(25, 10, 30, 30);
  line(75, 10, 70, 30);

  //kao
  stroke(250, 239, 116);
  fill(250, 239, 116);
  stroke(250, 239, 116);
  ellipse(50, 50, 100, 50);

  //me
  strokeWeight(1);
  fill(0);
  ellipse(20, 50, 5, 5);
  ellipse(80, 50, 5, 5);

  //kuti
  strokeWeight(5);
  stroke(250, 116, 143);
  line(30, 50, 70, 50);

  popMatrix();
}


