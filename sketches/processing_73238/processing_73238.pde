
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img;
PImage img2;
float a=0;
int b=500;
int c=50;
float d=100;
int l=600;
int m=300;
int n=400;
int o=300;
int p=400;
int s=600;
int y=200;
void setup()
{
  size(800, 600, P3D);
  minim = new Minim(this);
  player = minim.loadFile("You Should Be Dancing.mp3", 2048);
  player.loop();
  img=loadImage("Disco Floor.png");
  img2=loadImage("NightSF.jpg");
}
void draw()
{
  noCursor();
  background(15, 5, 5, 0);
  translate(0, 0, -1500);
  tint(0, 153, 204, 255);
  image(img2, -1200, -900, width*4, height*2.9);
  //OLYMPIC RINGS//
  noFill();
  //1//
  strokeWeight(5);
  stroke(0, 0, 250, 100);
  ellipse(-1040, 110, 200, 200);
  stroke(0, 0, 0, 100);
  ellipse(-820, 110, 200, 200);
  stroke(250, 0, 0, 100);
  ellipse(-600, 110, 200, 200);
  stroke(244, 245, 40, 100);
  ellipse(-945, 200, 200, 200);
  stroke(12, 124, 32, 100);
  ellipse(-720, 200, 200, 200);
  //2//
  stroke(0, 0, 250, 100);
  ellipse(1360, 110, 200, 200);
  stroke(0, 0, 0, 100);
  ellipse(1580, 110, 200, 200);
  stroke(250, 0, 0, 100);
  ellipse(1800, 110, 200, 200);
  stroke(244, 245, 40, 100);
  ellipse(1455, 200, 200, 200);
  stroke(12, 124, 32, 100);
  ellipse(1680, 200, 200, 200);
  strokeWeight(1);
  //TRIFORCE//
  fill(235, 240, 12, 50);
  stroke(235, 240, 12, 50);
  triangle(400, 0, 330, 135, 470, 135);
  triangle(330, 135, 400, 270, 260, 270);
  triangle(470, 135, 400, 270, 540, 270);
  translate(0, 0, 1500);
  speakers();
  //FLOOR//
  fill(175);
  translate(0, 200, -50);
  noTint();
  beginShape();
  texture(img);
  vertex(-100, 400, 50, 0, 0);
  vertex(-100, 400, -450, img.width, 0);
  vertex(900, 400, -450, img.width, img.height);
  vertex(900, 400, 50, 0, img.height);
  endShape();
  translate(0, -200, 50);
  navi();
  translate(0,0,-100);
  jennifer();
  translate(0, 0, -75);
  keyman();
  translate(0, 0, 10);
  strokeWeight(1);
  ghost();
  translate(0, 0, 30);
  plasageist();
  translate(0, 0, -50);
  voltorb();
  translate(0, -100, 20);
  translate(0, -400, 0);
  balloons();
  translate(100, 0, 0);
  translate(-800, 0, 0);
  translate(400, 100, 0);
  disco();
}
void disco()
{
  fill(255);
  pointLight(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 400, 100, 1500);
  rotateY(-a);
  a=a+d;
  strokeWeight(1);
  stroke(0);
  sphere(50);
  strokeWeight(3);
  stroke(175);
  line(0, -100, 0, 0, 0, 0);
}
void speakers()
{
  translate(200, 310, -70);
  fill(50);
  strokeWeight(1);
  stroke(175);
  box(100, 300, 50);
  stroke(0);
  fill(150);
  translate(-3, -75, 0);
  sphere(int(random(42, 47)));
  translate(3, 75, 0);
  translate(-3, 75, 0);
  sphere(int(random(42, 47)));
  translate(3, -75, 0);
  translate(-200, -310, 70);
  translate(600, 310, -70);
  fill(50);
  stroke(175);
  box(100, 300, 50);
  stroke(0);
  fill(150);
  translate(3, -75, 0);
  sphere(int(random(42, 47)));
  translate(-3, 75, -10);
  translate(3, 75, 10);
  sphere(int(random(42, 47)));
  translate(-3, -75, 0);
  translate(-600, -310, 70);
}
void ghost()
{
  translate(0, 400, 10);
  translate(0, 0, -30);
  //RED//
  fill(255, 0, 0);
  stroke(255, 0, 0);
  beginShape();
  vertex(o-13, 20);
  vertex(o-13, 50);
  vertex(o-5, 60);
  vertex(o+2, 50);
  vertex(o+9, 60);
  vertex(o+16, 50);
  vertex(o+23, 60);
  vertex(o+30, 50);
  vertex(o+30, 20);
  endShape();
  ellipse(o+9, 17, 43, 43);
  fill(255);
  stroke(255);
  ellipse(o-3, 20, 15, 15);
  ellipse(o+20, 20, 15, 15);
  fill(0, 10, 250);
  stroke(0, 10, 250);
  ellipse(o-3, 20, 5, 5);
  ellipse(o+20, 20, 5, 5);
  translate(0, 0, 30);
  //CYAN//
  translate(0, 25, 10);
  fill(0, 239, 250);
  stroke(0, 239, 250);
  beginShape();
  vertex(p-13, 120);
  vertex(p-13, 150);
  vertex(p-5, 160);
  vertex(p+2, 150);
  vertex(p+9, 160);
  vertex(p+16, 150);
  vertex(p+23, 160);
  vertex(p+30, 150);
  vertex(p+30, 120);
  endShape();
  ellipse(p+9, 117, 43, 43);
  fill(255);
  stroke(255);
  ellipse(p-3, 120, 15, 15);
  ellipse(p+20, 120, 15, 15);
  fill(0, 10, 250);
  stroke(0, 10, 250);
  ellipse(p-3, 120, 5, 5);
  ellipse(p+20, 120, 5, 5);
  translate(0, -25, -10);
  //PINK//
  translate(0, 0, -10);
  fill(240, 191, 215);
  stroke(240, 191, 215);
  beginShape();
  vertex(s-13, 70);
  vertex(s-13, 100);
  vertex(s-5, 110);
  vertex(s+2, 100);
  vertex(s+9, 110);
  vertex(s+16, 100);
  vertex(s+23, 110);
  vertex(s+30, 100);
  vertex(s+30, 70);
  endShape();
  ellipse(s+9, 67, 43, 43);
  fill(255);
  stroke(255);
  ellipse(s-3, 70, 15, 15);
  ellipse(s+20, 70, 15, 15);
  fill(0, 10, 250);
  stroke(0, 10, 250);
  ellipse(s-3, 70, 5, 5);
  ellipse(s+20, 70, 5, 5);
  o=o+int(random(-3, 3));
  p=p+int(random(-3, 3));
  s=s+int(random(-3, 3));
  if (o<149)
  {
    o=150;
  }
  if (o>646)
  {
    o=645;
  }
  if (p<-6)
  {
    p=-5;
  }
  if (p>706)
  {
    p=705;
  }
  if (s<89)
  {
    s=90;
  }
  if (s>721)
  {
    s=720;
  }
}
void voltorb()
{
  translate(0, 100, -20);
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(2);
  ellipse(y, 1, 50, 50);
  fill(255);
  arc(y, 1, 50, 50, 0, PI);
  stroke(0);
  line(y-25, 1, y+25, 1);
  fill(255);
  strokeWeight(1);
  triangle(y-15, -12, y, -2, y-15, -7);
  triangle(y+20, -12, y+10, -2, y+20, -7);
  fill(0);
  ellipse(y-9, -6, 2, 2);
  ellipse(y+17, -7, 2, 2);
  y=y+int(random(-2, 2));
  if (y<49)
  {
    y=50;
  }
  if (y>746)
  {
    y=745;
  }
}
void plasageist()
{
  translate(0, 0, 50);
  fill(20, 225, 255);
  noStroke();
  ellipse(b, c-10, 50, 30);
  triangle(b-6, c+3, b+5, c+3, b, c+20);
  triangle(b-25, c-10, b-15, c+30, b-20, c-10);
  triangle(b+25, c-10, b+15, c+30, b+20, c-10);
  fill(0);
  stroke(0);
  ellipse(b, c-10, 45, 25);
  fill(255, 0, 0);
  ellipse(b, c-15, 8, 8);
  triangle(b-16, c-12, b-1, c-6, b-11, c-5);
  triangle(b+1, c-4, b+11, c-5, b+16, c-12);
  strokeWeight(3);
  point(b, c-15);
  b=b+int(random(-2, 2));
  c=c+int(random(-2, 2));
  if (b<-11)
  {
    b=810;
  }
  if (b>811)
  {
    b=-10;
  }
  if (c<-1)
  {
    c=0;
  }
  if (c>501)
  {
    c=500;
  }
}
void jennifer()
{
  translate(0, 0, 75);
  noStroke();
  //LEFT LEG//
  fill(0);
  beginShape();
  vertex(m+5, 490);
  vertex(m+20, 530);
  vertex(m+20, 535);
  vertex(m+40, 535);
  vertex(m+40, 530);
  vertex(m+25, 490);
  endShape();
  fill(50);
  beginShape();
  vertex(m+20, 535);
  vertex(m+25, 590);
  vertex(m+30, 590);
  vertex(m+30, 580);
  vertex(m+35, 590);
  vertex(m+45, 590);
  vertex(m+40, 530);
  vertex(m+40, 535);
  endShape();
  arc(m+45, 590, 20, 20, PI, TWO_PI);
  line(m+45, 590, m+55, 590);
  //LEFT ARM//
  fill(250, 193, 140);
  ellipse(m+60, 458, 20, 20);
  fill(70);
  beginShape();
  vertex(m-15, 390);
  vertex(m+15, 440);
  vertex(m+60, 470);
  vertex(m+60, 445);
  vertex(m+27, 415);
  vertex(m+7, 390);
  endShape();
  //HEAD & BODY//
  fill(20);
  rect(m-15, 390, 30, 100);
  ellipse(m+15, 410, 20, 35);
  rect(m-15, 420, 37, 70);
  fill(250, 193, 140);
  ellipse(m+5, 355, 50, 70);
  fill(0);
  arc(m+5, 345, 50, 70, PI, TWO_PI);
  rect(m-20, 345, 20, 50);
  //RIGHT LEG//
  beginShape();
  vertex(m-15, 490);
  vertex(m-20, 530);
  vertex(m-22, 540);
  vertex(m-2, 540);
  vertex(m, 530);
  vertex(m+5, 490);
  endShape();
  fill(50);
  beginShape();
  vertex(m-22, 535);
  vertex(m-30, 590);
  vertex(m-25, 590);
  vertex(m-22, 580);
  vertex(m-18, 590);
  vertex(m-7, 590);
  vertex(m-1, 535);
  endShape();
  arc(m-7, 590, 20, 20, PI, TWO_PI);
  line(m-7, 590, m+3, 590);
  //RIGHT ARM//
  fill(250, 193, 140);
  ellipse(m+60, 465, 20, 20);
  fill(80);
  stroke(230);
  beginShape();
  vertex(m-15, 400);
  vertex(m+15, 440);
  vertex(m+60, 480);
  vertex(m+60, 455);
  vertex(m+27, 425);
  vertex(m+7, 400);
  vertex(m-15, 400);
  endShape();
  stroke(0);
  strokeWeight(3);
  line(m-4, 401, m+20, 430);
  line(m+20, 430, m+57, 464);
  strokeWeight(1);
  fill(255);
  stroke(0);
  triangle(m-8, 400, m, 400, m-4, 390);
  //SKIRT//
  fill(80);
  noStroke();
  quad(m-15, 465, m-19, 515, m+35, 515, m+22, 465);
  //BELTS//
  fill(10, 60, 15);
  rect(m-15, 460, 37, 8);
  rect(m+22, 457, 3, 11);
  //FACE//
  fill(255);
  stroke(0);
  ellipse(m+20, 355, 10, 5);
  strokeWeight(4);
  line(m+15, 352, m, 352);
  fill(0, 0, 0, 200);
  strokeWeight(1);
  rect(m+15, 350, 15, 8);
  strokeWeight(4);
  point(m+24, 355);
  strokeWeight(2);
  line(m+18, 375, m+26, 375);
  //CAPE//
  fill(0);
  stroke(0);
  triangle(m-15, 397, m-30, 510, m-15, 510);
  m=m+int(random(-4, 4));
  if (m<-1)
  {
    m=0;
  }
  if (m>601)
  {
    m=600;
  }
}
void keyman()
{
  translate(0, 0, -10);
  noFill();
  stroke(0);
  strokeWeight(5);
  ellipse(n+5, 270, 60, 60);
  line(n+5, 300, n+05, 390);
  line(n+5, 390, n-15, 470);
  line(n+5, 390, n+15, 470);
  line(n+5, 330, n-15, 390);
  line(n+5, 330, n+20, 390);
  stroke(252, 245, 15);
  ellipse(n+30, 400, 20, 20);
  line(n+33, 410, n+40, 440);
  line(n+37, 435, n+32, 437);
  line(n+40, 440, n+35, 443);
  n=n+int(random(-6, 6));
  if (n<149)
  {
    n=150;
  }
  if (n>646)
  {
    n=645;
  }
}
void balloons()
{
  noStroke();
  pointLight(255, 255, 255, 300, 0, 0);
  fill(255, 0, 0);
  sphere(50);
  fill(0, 255, 0);
  translate(100, 0, 0);
  sphere(50);
  fill(0, 0, 255);
  translate(-100, 0, 0);
  translate(800, 0, 0);
  sphere(50);
  translate(-100, 0, 0);
  fill(255);
  sphere(50);
}
void navi()
{
  translate(0,0,100);
  fill(140, 177, 193);
  stroke(140, 177, 193);
  triangle(mouseX-10, mouseY-5, mouseX-30, mouseY-50, mouseX-30, mouseY-25);
  triangle(mouseX+10, mouseY, mouseX+70, mouseY-20, mouseX+45, mouseY);
  triangle(mouseX-10, mouseY+10, mouseX-30, mouseY+10, mouseX-15, mouseY+20);
  triangle(mouseX+5, mouseY+10, mouseX+25, mouseY+25, mouseX+10, mouseY+25);
  stroke(82, 162, 198);
  fill(82, 162, 198);
  ellipse(mouseX, mouseY, 30, 30);
  ellipse(mouseX, mouseY+30, 10, 10);
  ellipse(mouseX, mouseY+50, 10, 10);
  stroke(20, 175, 245);
  fill(20, 175, 245);
  ellipse(mouseX, mouseY, 25, 25);
  fill(255);
  stroke(255);
  ellipse(mouseX, mouseY, 20, 20);
  ellipse(mouseX, mouseY+30, 7, 7);
  ellipse(mouseX, mouseY+50, 7, 7);
}


