
int n = 5000;
Ball[] balls = new Ball[n];
int l = 0;
PImage img;       
PVector pos, vel;
String [] link = new String[25];

void setup() {
  noStroke();
  ellipseMode(CENTER); 
  smooth();
  frameRate(60);
  link[0] = "foto1.jpg";
  link[1] = "foto2.jpg";
  link[2] = "foto3.jpg";
  link[3] = "foto4.jpg";
  link[4] = "foto5.jpg";
  link[5] = "foto6.jpg";
  link[6] = "foto7.jpg";
  link[7] = "foto8.jpg";
  link[8] = "foto9.JPG";
  link[9] = "foto10.JPG";
  link[10] = "foto11.JPG";
  link[11] = "foto12.JPG";
  link[12] = "foto13.JPG";
  link[13] = "foto14.JPG";
  link[14] = "foto15.JPG";
  link[15] = "foto16.JPG";
  link[16] = "foto17.JPG";
  link[17] = "foto18.JPG";
  link[18] = "foto19.JPG";
  link[19] = "foto20.JPG";
  link[20] = "foto21.JPG";
  link[21] = "foto22.JPG";
  link[22] = "foto23.JPG";
  link[23] = "foto24.JPG";
  link[24] = "foto25.JPG";
  img = loadImage(link[(int)random(link.length)]);
  size(1024, 576, P2D); 
  background(0);
}

void draw() {
  //if(frameCount<50){
  tint(255, 10);
  image(img, 0, 0);
  //}
  //else {
  //  fill(255,10);
  //  rect(0,0,width,height);
  if (l < n) {
    pos = new PVector(random(0.55*width-10, 0.55*width+10), random(0.4*height-10, 0.4*height+10), 0);
    vel = new PVector(0, 0, 0);
    balls[l] = new Ball(pos, vel);
    l+=1;
  }

  for (int i = 0; i < l; i+=1) {
    balls[i].update();
    balls[i].paint();
  }

  for (int i = 0; i < l; i+=1) {
    for (int j = 0; j < l; j+=1) {
      if (j != i) {
        balls[i].checkOver(balls[j]);
      }
    }
  }
  //}
}

class Ball {
  PVector pos;
  PVector vel;
  float rad;
  color col;
  int pix = width*height/2;  

  Ball(PVector posTemp, PVector velTemp) {
    pos = posTemp.get();
    vel = velTemp.get();
    rad = 2;
    col = color(0);
  }

  void update() {
    pos.add(vel);
    if (pos.x > width - rad) {
      pos.x = width - rad;
      vel.x = -vel.x;
    }
    else if (pos.x < rad) {
      pos.x = rad;
      vel.x = -vel.x;
    }
    if (pos.y > height - rad) {
      pos.y = height - rad;
      vel.y = -vel.y;
    }
    else if (pos.y < rad) {
      pos.y = rad;
      vel.y = -vel.y;
    }
    vel.mult(0.999);
    pix = round(pos.x) + round(pos.y)*width;
    rad = map(brightness(img.pixels[pix]), 0, 255, 5, 10);
    col = img.pixels[pix];
  }

  void paint() {
    fill(col, 50);
    ellipse(pos.x, pos.y, (2*rad)-1, (2*rad)-1);
  }

  void checkOver(Ball b) {
    PVector diff = PVector.sub(pos, b.pos);
    if (diff.mag() < rad + b.rad) {
      PVector cen = PVector.add(pos, b.pos);
      cen.div(2);
      diff.normalize();
      pos = PVector.add(cen, PVector.mult(diff, (rad + b.rad)/2));
      b.pos = PVector.add(cen, PVector.mult(diff, -(rad + b.rad)/2));
      vel.set(0, 0, 0);
      b.vel.set(0, 0, 0);
    }
  }
}  

void mousePressed() {
  img = loadImage(link[(int)random(link.length)]);
  tint(255, 10);
  image(img, 0, 0);
}



