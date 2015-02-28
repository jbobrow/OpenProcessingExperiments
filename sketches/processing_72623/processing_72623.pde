
import ddf.minim.*;
AudioPlayer player; 
Minim minim;
PImage img;
float a=0;
float b=.01;
float c=.005;
void setup()
{
  size(800, 600, P3D);
  minim = new Minim(this);
  player = minim.loadFile("Super Mario Galaxy 2 Music - Bowser's Galaxy Generator - YouTube.mp3", 2048);
  player.loop();
  img=loadImage("Space.jpg");
 }
void draw()
{
  background(0);
  translate(0, 0, -1500);
  image(img, -1800, -1500, width*5, height*5);
  translate(0, 0, 1500);
  pointLight(255, 255, 255, 400, 300, 250);
  a=a+b;
  int s=millis()/1000;
  if (s<=21)
  {
    //EARTH//
    fill(0, 0, 255);
    noStroke();
    translate(400, 300, -250);
    rotateY(-a);
    sphere(150);
    //MOON//
    fill(175);
    translate(50, 10, -500);
    sphere(30);
  }
  if (s>=22 && s<=42)
  {
    pointLight(255, 255, 255, 400, 300, 370);
    //MARS//
    fill(255, 0, 0);
    translate(400, 300, 250);
    rotateY(-a);
    sphere(50);
    fill(175);
    //DEIMOS & PHOBOS//
    translate(30, 10, -100);
    sphere(1);
    translate(10, 10, -50);
    sphere(1);
  }
  if (s>=43 && s<=63)
  {
    pointLight(255, 255, 255, 400, 300, 550);
    //SUN//
    fill(255, 255, 0);
    noStroke();
    translate(400, 300, 350);
    rotateY(-a);
    sphere(50);
    //MERCURY//
    fill(175);
    translate(10, 0, 60);
    rotate(b);
    sphere(.5);
    //VENUS//
    fill(255, 255, 0);
    translate(15, 0, -10);
    rotateZ(b);
    sphere(.75);
    //EARTH//
    fill(0, 0, 255);
    translate(26, 0, 15);
    sphere(1.25);
    //MARS//
    fill(255, 0, 0);
    rotateZ(c);
    translate(36, 0, -20);
    sphere(1);
  }
  if (s>=64 && s<=84)
  {
    //JUPITER//
    fill(200, 135, 40);
    translate(400, 300, -350);
    rotateY(-a);
    sphere(200);
    //IO//
    fill(200, 130, 55);
    translate(20, 10, -250);
    sphere(5);
    //EUOROPA//
    fill(180, 140, 100);
    translate(25, 10, 50);
    sphere(3);
    //GANYMEDE//
    fill(175);
    translate(30, 10, -150);
    sphere(7);
    //CALLISTO//
    fill(90, 70, 50);
    translate(35, 10, 150);
    sphere(6);
  }
  if (s>=85 && s<=105)
  {  
    //SATURN//
    fill(220, 225, 20);
    translate(400, 300, -350);
    rotateY(-a);
    sphere(200);
    rotateX(80);
    stroke(175);
    noFill();
    ellipse(0, 0, 500, 500);
    ellipse(0, 0, 525, 525);
    ellipse(0, 0, 550, 550);
    ellipse(0, 0, 575, 575);
    ellipse(0, 0, 600, 600);
    ellipse(0, 0, 625, 625);
    ellipse(0, 0, 650, 650);
    ellipse(0, 0, 675, 675);
    ellipse(0, 0, 700, 700);
    ellipse(0, 0, 725, 725);
    ellipse(0, 0, 750, 750);
    ellipse(0, 0, 775, 775);
    ellipse(0, 0, 800, 800);
    ellipse(0, 0, 825, 825);
    //MIMAS//
    noStroke();
    fill(175);
    translate(450, 0, -10);
    rotateX(a);
    sphere(3);
    //ENCELADUS//
    translate(40, 10, -10);
    sphere(4);
    //TETHYS//
    translate(40, 10, 50);
    sphere(5);
    //DIONE//
    translate(40, 10, -50);
    sphere(6);
    //RHEA//
    translate(60, 10, 100);
    sphere(9);
    //TITAN//
    fill(200, 120, 20);
    translate(250, 10, -20);
    sphere(10);
  }
  if (s>=106 && s<=126) 
  {
    //URANUS//
    noStroke();
    fill(0, 255, 255);
    translate(400, 300, -150);
    rotateX(-a);
    sphere(150);
    noFill();
    stroke(175);
    rotateY(-80);
    ellipse(0, 0, 425, 425);
    ellipse(0, 0, 450, 450);
    ellipse(0, 0, 475, 475);
    ellipse(0, 0, 500, 500);
    rotateY(80);
    rotateX(a);
    translate(0, 0, -10);
    rotateY(-a);
    noStroke();
    //MIRANDA//
    fill(175);
    translate(250, 0, -10);
    sphere(3);
    //ARIEL//
    translate(40, 10, -10);
    sphere(4);
    //UMBRIEL//
    translate(40, 10, 50);
    sphere(5);
    //TITINIA//
    translate(200, 10, 100);
    sphere(10);
    //OBERON//
    translate(100, 10, -20);
    sphere(8);
  }
  if (s>=127 && s<=147)
  {
    //NEPTUNE//
    pointLight(255, 255, 255, 400, 300, 350);
    fill(0, 0, 255);
    translate(400, 300, -150);
    rotateY(-a);
    sphere(150);
    //TRITON//
    fill(175);
    rotateY(a);
    rotateY(a);
    translate(250, 0, -10);
    sphere(10);
  }
  if (s>=148)
  {
    //SUN//
    fill(255, 255, 0);
    noStroke();
    translate(400, 300, -250);
    rotateY(-a);
    sphere(50);
    //MERCURY//
    fill(175);
    translate(10, 0, 60);
    rotate(b);
    sphere(.5);
    //VENUS//
    fill(255, 255, 0);
    translate(15, 0, -10);
    rotateZ(b);
    sphere(.75);
    //EARTH//
    fill(0, 0, 255);
    translate(26, 0, 15);
    sphere(1.25);
    //MARS//
    fill(255, 0, 0);
    rotateZ(c);
    translate(36, 0, -20);
    sphere(1);
    //JUPITER//
    fill(200, 135, 40);
    translate(150, 0, 150);
    rotateZ(c);
    sphere(10);
    //SATURN//
    fill(220, 225, 20);
    translate(160, 0, -150);
    sphere(8);
    rotateX(80);
    noFill();
    stroke(175);
    ellipse(0, 0, 21, 21);
    ellipse(0, 0, 22, 22);
    ellipse(0, 0, 23, 23);
    ellipse(0, 0, 24, 24);
    ellipse(0, 0, 25, 25);
    //URANUS//
    noStroke();
    rotateX(-80);
    fill(0, 255, 255);
    translate(180, 0, 150);
    sphere(7);
    noFill();
    stroke(175);
    ellipse(0, 0, 14, 14);
    ellipse(0, 0, 16, 16);
    ellipse(0, 0, 18, 18);
    ellipse(0, 0, 20, 20);
    //NEPTUNE//
    noStroke();
    fill(0, 0, 255);
    translate(200, 0, -150);
    sphere(7);
  }
}


