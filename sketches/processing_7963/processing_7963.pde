

PImage pollen;
PImage pollen_vertical;
PImage pollen_tilt_left;
PImage pollen_tilt_right;
float easing = 0.1;
float x;
float y;
float r;
float s;

float xe;

void setup()
{
  background(255);
  size(640, 480);
  smooth();
  colorMode(HSB, 360, 100, 100, 255);
  //noLoop();
  imageMode(CENTER);
  pollen = loadImage("pollen.png");
  pollen_vertical = loadImage("pollen_vertical.png");
  pollen_tilt_left = loadImage("pollen_tilt_left.png");
  pollen_tilt_right = loadImage("pollen_tilt_right.png");

}

  void draw() {
    
  background(0);
  
  //easing
  xe = xe + (mouseX - xe) * easing;
  
  
 //opacity transition
 if (mouseX < 580) { tint(176, 27, 88, 120); 
  } else { 
    
   float o = map(xe, 580, width, 150, 240);
    tint(176, 27, 88, o);
  }
  
  pushMatrix();
  x = map(xe, 0, width, 80, 449);
  y = map(xe, 0, width, 100, 146);
  r = map(xe, 0, width, 0, radians(10));
  s = map(xe, 0, width, 1.0, 0.2);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 400, 500);
  y = map(xe, 0, width, 500, 130);
  r = map(xe, 0, width, radians(150), 0);
  s = map(xe, 0, width, 1.2, 1.0);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 550, 516);
  y = map(xe, 0, width, 300, 187);
  r = map(xe, 0, width, radians(250), 0);
  s = map(xe, 0, width, 0.2, 0.4);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 630, 565);
  y = map(xe, 0, width, 250, 185);
  r = map(xe, 0, width, radians(50), 0);
  s = map(xe, 0, width, 1.75, 0.78);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_left, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 565, 565);
  y = map(xe, 0, width, 100, 142);
  r = map(xe, 0, width, 0, radians(100));
  s = map(xe, 0, width, 1.0, 0.3);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 470, 474);
  y = map(xe, 0, width, 270, 190);
  r = map(xe, 0, width, 0, radians(100));
  s = map(xe, 0, width, 0.3, 0.6);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_left, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 290, 570);
  y = map(xe, 0, width, 380, 104);
  r = map(xe, 0, width, 0, radians(100));
  s = map(xe, 0, width, 1.2, 0.6);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_left, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 100, 595);
  y = map(xe, 0, width, 287, 134);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 0.5, 0.4);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 30, 607);
  y = map(xe, 0, width, 400, 107);
  r = map(xe, 0, width, 0, radians(300));
  s = map(xe, 0, width, 1.0, 0.25);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 524, 600);
  y = map(xe, 0, width, 280, 162);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 0.2, 0.3);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 500, 530);
  y = map(xe, 0, width, 320, 226);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 0.1, 0.55);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width,500, 495);
  y = map(xe, 0, width, 260, 213);
  r = map(xe, 0, width, 0, radians(230));
  s = map(xe, 0, width, 0.1, 0.26);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, -200, 494);
  y = map(xe, 0, width, 500, 232);
  r = map(xe, 0, width, 0, radians(60));
  s = map(xe, 0, width, 2.0, 0.35);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, -200, 475);
  y = map(xe, 0, width, 200, 235);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 2.0, 0.1);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, -400, 476);
  y = map(xe, 0, width, 0, 219);
  r = map(xe, 0, width, 0, radians(300));
  s = map(xe, 0, width, 3.0, 0.13);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 900, 460);
  y = map(xe, 0, width, -230, 227);
  r = map(xe, 0, width, 0, radians(140));
  s = map(xe, 0, width, 2.0, 0.27);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 530, 443);
  y = map(xe, 0, width, 400, 214);
  r = map(xe, 0, width, 0, radians(360));
  s = map(xe, 0, width, 1.2, 0.19);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 800, 432);
  y = map(xe, 0, width, 700, 170);
  r = map(xe, 0, width, 0, radians(160));
  s = map(xe, 0, width, 2.5, 0.48);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 20, 459);
  y = map(xe, 0, width, 700, 160);
  r = map(xe, 0, width, 0, radians(100));
  s = map(xe, 0, width, 2.5, 0.2);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 10, 436);
  y = map(xe, 0, width, 240, 201);
  r = map(xe, 0, width, 0, radians(230));
  s = map(xe, 0, width, 2.0, 0.25);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 600, 432);
  y = map(xe, 0, width, 25, 111);
  r = map(xe, 0, width, 0, radians(150));
  s = map(xe, 0, width, 0.5, 0.6);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, -700, 469);
  y = map(xe, 0, width, 950, 72);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 3.2, 0.7);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 500, 533);
  y = map(xe, 0, width, 300, 69);
  r = map(xe, 0, width, 0, radians(100));
  s = map(xe, 0, width, 0.2, 0.8);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_left, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, -900, 503);
  y = map(xe, 0, width, -30, 47);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 3.16, 0.4);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 250, 524);
  y = map(xe, 0, width, 230, 38);
  r = map(xe, 0, width, 0, radians(200));
  s = map(xe, 0, width, 0.4, 0.16);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 132, 474);
  y = map(xe, 0, width, 180, 44);
  r = map(xe, 0, width, 0, radians(230));
  s = map(xe, 0, width, 0.6, 0.16);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_right, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 400, 577);
  y = map(xe, 0, width, 300, 64);
  r = map(xe, 0, width, 0, radians(300));
  s = map(xe, 0, width, 0.75, 0.27);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_vertical, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 420, 595);
  y = map(xe, 0, width, 400, 79);
  r = map(xe, 0, width, 0, radians(230));
  s = map(xe, 0, width, 0.5, 0.2);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 50, 602);
  y = map(xe, 0, width, 30, 93);
  r = map(xe, 0, width, 0, radians(160));
  s = map(xe, 0, width, 0.8, 0.15);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 200, 615);
  y = map(xe, 0, width, 210, 126);
  r = map(xe, 0, width, 0, radians(90));
  s = map(xe, 0, width, 0.35, 0.18);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 140, 614);
  y = map(xe, 0, width, 360, 145);
  r = map(xe, 0, width, 0, radians(90));
  s = map(xe, 0, width, 1, 0.2);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 240, 603);
  y = map(xe, 0, width, 280, 181);
  r = map(xe, 0, width, 0, radians(20));
  s = map(xe, 0, width, 0.1, 0.2);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen_tilt_left, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 360, 563);
  y = map(xe, 0, width, 130, 226);
  r = map(xe, 0, width, 0, radians(120));
  s = map(xe, 0, width, 0.27, 0.23);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 230, 416);
  y = map(xe, 0, width, 190, 140);
  r = map(xe, 0, width, 0, radians(220));
  s = map(xe, 0, width, 0.2, 0.28);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 400, 412);
  y = map(xe, 0, width, 770, 157);
  r = map(xe, 0, width, 0, radians(90));
  s = map(xe, 0, width, 3.3, 0.19);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 300, 412);
  y = map(xe, 0, width, 170, 174);
  r = map(xe, 0, width, 0, radians(90));
  s = map(xe, 0, width, 0.3, 0.13);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, -850, 431);
  y = map(xe, 0, width, 300, 75);
  r = map(xe, 0, width, 0, radians(320));
  s = map(xe, 0, width, 4.2, 0.18);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 300, 421);
  y = map(xe, 0, width, 130, 196);
  r = map(xe, 0, width, 0, radians(220));
  s = map(xe, 0, width, 0.6, 0.13);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 340, 415);
  y = map(xe, 0, width, 100, 186);
  r = map(xe, 0, width, 0, radians(220));
  s = map(xe, 0, width, 0.35, 0.1);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 380, 410);
  y = map(xe, 0, width, 60, 122);
  r = map(xe, 0, width, 0, radians(220));
  s = map(xe, 0, width, 0.9, 0.14);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  pushMatrix();
  x = map(xe, 0, width, 300, 432);
  y = map(xe, 0, width, 60, 142);
  r = map(xe, 0, width, 0, radians(220));
  s = map(xe, 0, width, 0.43, 0.16);
  translate(x, y);
  scale(s);
  rotate(r);
  image(pollen, 0, 0);
  popMatrix();
  
  //rotate();
}



