
//author: Weiyuh Li
//purpose: daydream of spring
//concept: "A year's plan starts with spring",so I create 2 clocks in space 
//          to remind viewer that spring is coming.
//control: press left button of mouse to rise to thunder-clock (flashing per 5 second)
//         press right button of mouse to land to grass-clock (red grass circulate per minute)
//reference: class exercise by Sheng-Fen Nik Chien


//import processing.opengl.*;
float xstart, xnoise, ystart, ynoise, xstartNoise, ystartNoise;
float z1;
float speed;
float view;

void setup() {
  z1 = 0.0;
  speed = 0.05;
  view =0.015;
  frameRate(50);
  size(640, 360, P3D);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  xstartNoise = random(20);
  ystartNoise = random(20);
}
void draw() {
  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart +=(noise(xstartNoise)*0.5)-0.25;
  ystart +=(noise(ystartNoise)*0.5)-0.25;
  xnoise = xstart;
  ynoise = ystart;
//cloud
  float x1 =0.0;
  for (int x=0; x<width; x++) {
    float y1 =0.0;
    for (int y=0; y<width; y++) {
      stroke(noise(x1, y1, z1)*255+100, 50);
      point(x, y);
      y1 += view;
    }
    x1 += view;
  }
  z1 += speed;

  if (mousePressed) {

    if (mousePressed && (mouseButton == LEFT)) {
      view -= 0.001;
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      view += 0.001;
    }
  }
  if (keyPressed) {
    if (keyCode == UP) {
      speed += 0.05;
    }
    if (keyCode == DOWN) {
      speed -= 0.05;
    }
  }
  //grass clock
  if (view>=0.025) {
    for (int y = 0; y <= height; y+=5) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = 0; x <= width; x+=5) {
        xnoise += 0.1;
        drawPoint(x, y, noise(xnoise, ynoise));
      }
    }
  }
  //thunder clock
  if (view<=0.005) {
    int t2=second();
    if (t2==5 |t2==10 |t2==15 |t2==20 |t2==25 |t2==30 |t2==35 |t2==40 |t2==45 |t2==50 |t2==55 |t2==60 ) {
      int c1 =int(random(100,255));
      int c2 =int(random(100,255));
      int c3 =int( random(20));
      strokeWeight(int(random(6)));
      stroke(c1, c2, c3 );
      float radius = 100;
      float centX = random(width);
      float centY = random(height);
      float xf, yf;
      radius = 10;
      float lastxf = -999;
      float lastyf = -999;
      float radiusNoise = random(10);
      for (float ang=0; ang<=360*1.5; ang+=10) { 
        radiusNoise += 0.05;
        radius += 0.5;
        float thisRadius = radius + (noise(radiusNoise)*(centX+centY/5)) - 50;                
        float rad = radians(ang);                                  
        xf = centX + (thisRadius * cos(rad));
        yf = centY + (thisRadius * sin(rad)); 
        if (lastxf > -999) {
          line(xf, yf, lastxf, lastyf);
        }
        lastxf = xf;
        lastyf = yf;
        fill(255,10);
     
        rect(0,0,width,height);
      }
    }
  }
}


void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  int t=second();
  translate(x, 7*x/t);
  rotate(noiseFactor * radians(360));
  stroke(random(255), 4*t, 3*t, 200+t);
  line(0, 0, t, 50+t);

  popMatrix();
  stroke(30, random(255), 30, 150);
  pushMatrix();
  translate(y, x);
  rotate(3*PI/2);
  rotate(noiseFactor * radians(180));
  line(0, 0, 50, 80);
  popMatrix();

  if (t==1) {
   noStroke();
    fill(255, 255, 70);
    rect(0, 0, width, height);
  }
}
void keyPressed(){
  if (keyCode==LEFT);
  saveFrame("daydream.jpg");
}

