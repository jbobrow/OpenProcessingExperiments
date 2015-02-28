
//Cold winter night, silent grass mood, we are cool and young
//click mouse to grow grass , move mouse to catch stars
//Green,green grass of home
//Xia,Huang-jing VI
//541009408@qq.com
//ZJU+NCKU
//
 
 
int val = 5;
int j = 600;
int a, c, d, x, y, p;
float s;
PImage b;
int sec=second();
 
 
void setup() {
  size(800, 550);
  //background(0);
  b = loadImage("1.jpg");
  background(b);
  smooth();
  //noLoop();
  frameRate(8);
}
 
 
 
void draw () {
  a = (int)random(205);
  c = (int)random(6);
  d = (int)random(75);
  x = (int)random(-50, 750);
  y = (int)random(120, 350);
  s = random(1);
  p = (int)random(25, 25);
 
 
 
  for (int i = -150; i <= width; i+=val) {
    int r=255;
 
    r=floor(random(193));
    // stroke(91, 138, 10);
    // strokeWeight(s);
 
 
    float t = random (50);
    float u = random (30);
    stroke(random(200), random(150));
 
    strokeWeight(s);
    beginShape();
    fill(random(50, 120), 10);
    vertex(i, j);
    //vertex(i+t, j-t);
    //vertex(i+(2*t), 1.40*j+(3*t-j));
    bezierVertex(i+t, j-t, i+4*t, j-3*t, i+3*t, j-5*t );
    //bezierVertex(i+t, j-u*t, i+2*t, j-u*t, i+3*t, j-u*t );
    endShape();
 
    strokeWeight(3*s);
    stroke(random(50, 150), random(50));
    beginShape();
    noFill();
    vertex(i, j);
    //vertex(i+t, j-t);
    //vertex(i+(2*t), 1.40*j+(3*t-j));
    bezierVertex(i+t, j-0.5*t, i+4*t, j-2*t, i+3*t, j-5*t );
    //bezierVertex(i+t, j-u*t, i+2*t, j-u*t, i+3*t, j-u*t );
    endShape();
  }
 
  //draw stars
  stroke(255, 50);
  strokeWeight(random(6));
  fill(random(20, 100), random(30, 50));
  ellipse(mouseX+random(-200, 200), mouseY-random(30), 2, 2);
  fill(random(100, 200), random(80, 180));
  ellipse(mouseX+random(-200, 200), mouseY-random(30), 2, 2);
  ellipse(mouseX+random(-200, 200), mouseY-random(30), 5, 5);
 
  //draw a boy
 
 
 
  //draw thunder
 
  //float a = random(50);
  // stroke(255, 20);
  // float xstep = 40;
  // float ystep = 10;
  //float lastx = 600;
  //float lasty = 0;
  // float y = 0;
  // int border = 20;
  // for (int x=600; x<=630&&x>=580;
  //  x+=xstep) {
  // xstep = random(-20,20);
  //ystep = random(50);
  // x += xstep;
  //  y += ystep;
  // line(x, y, lastx, lasty);
  //  lastx = x;
  // lasty = y;
  // }
 
 
 
  //mousepressed
  if (mousePressed) {
    for (int i = -150; i <= mouseX; i+=mouseX*0.05) {
      strokeWeight(random(1, 3));
      stroke(random(50, 150), random(20, 80));
      beginShape();
      noFill();
      // fill(100,i,100,10);
      vertex(i, 600);
      bezierVertex(i+random(50), 600-random(50), i+4*random(50), 600-3*random(50), i, random(250, 450));
      endShape();
    }
  }
}



