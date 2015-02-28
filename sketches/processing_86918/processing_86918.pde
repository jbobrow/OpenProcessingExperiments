
// Ping-Yeh Li
// Processing 2.0b6

float x;
float y;
float u;
float v;
float easing = 0.1;
PImage img;
float k;

void setup() {
  size (600, 600);
  smooth();
  img=loadImage("daimondshape2.png");
}

void draw() {
  x+=(mouseX - x)*easing;
  y+=(mouseY - y)*easing;
  noStroke();
  
  fill(255, 255, 255, mouseX/2);
  triangle(x*2, y/2, -200, 200, 400, -400);
  fill(255, 255, 255, mouseY/2);
  triangle(x*2, y/2, 400, -400, 800, 800);

  fill(255, 100, 100, mouseY/5);
  triangle(width-x, y*2, -200, 200, 400, -400);
  fill(250, 100, 100, mouseX/5);
  triangle(width-x, y*2, 400, -400, 800, 800);

  fill(255, 150, 30, mouseX/5);
  triangle(width-x, y, 800, -100, 400, 700);
  fill(255, 150, 10, mouseX/5);
  triangle(width-x, y, 400, 700, -100, 500);


  fill(255, 80, 235, mouseX/5);
  triangle(width-x, height-y*2, -200, 200, 400, -400);
  fill(105, 50);
  triangle(width-x, height-y*2, 400, -400, 800, 800);

  fill(40, 255, 40, mouseY/5);
  triangle(width-x, height-y, 800, -100, 400, 700);
  fill(25, 20);
  triangle(width-x, height-y, 400, 700, -100, 500);

  fill(255, 20, 20, mouseY/5);
  triangle(x, height-y, 800, -100, 400, 700);
  fill(25, 10);
  triangle(x, height-y, 400, 700, -100, 500);
  fill(100, 10);

  fill(150, 30, 255, mouseY/5);
  triangle(x*2, height-y, 800, -100, 400, 700);
  fill(255, 20);
  triangle(x*2, height-y, 400, 700, -100, 500);

  fill(70, 250, 250, mouseY/5);
  triangle(x, y, 500, -200, 900, 300);
  fill(102, 13);
  triangle(x, y, 900, 300, 700, 800);

  fill(250, mouseX/5);
  triangle(x/3, y*2, 500, -200, 900, 300);
  fill(102, 30);
  triangle(x/3, y*2, 900, 300, 700, 800);

  fill(250, mouseX/5);
  triangle(x/2, y*2, 500, -200, 900, 300);
  fill(102, 30);
  triangle(x/2, y*2, 900, 300, 700, 800);



  // draw diamond
  //  stroke(255+sin(k)*60,80+sin(k)*60,200+sin(k)*60, 200+sin(k)*60);
  stroke(5+sin(k)*60, 255+sin(k)*60, 230+sin(k)*60, 200+sin(k)*60);
  k+=0.1;
  strokeWeight(2);
  // main line
  line(101, 188, 476, 188);
  for (int i=0; i<400; i+=20) {
    line(99+i, 188, 288, 450);
  }
  for (int j=0;j<300;j+=15) {
    line(99+j*1.34, 188, 136+j*1.07, 148);
  }
  line(136, 147, 440, 147);
  image(img, 0, 0);
  
}

