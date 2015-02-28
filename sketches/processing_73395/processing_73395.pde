
PImage skyline;
Robot f;
Robot f2;
Robot f3;
Robot f4;
Robot f5;
Robot f6;
Robot f7;
Robot f8;
Robot f9;
Robot f10;
Robot f11;
Robot f12;

float a=random(2);


void setup() {
  skyline = loadImage("louisville_night_skyline.png");
  size(600, 600);
  noStroke();
  background(0);
  smooth();
  frameRate(500);
  f = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f2 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f3 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f4 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f5 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f6 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f7 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f8 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f9 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f10 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f11 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
  f12 = new Robot(random(width), height+(height+random(600)), 7+random(5), (255), 1+random(5));
}

void draw() {

  f.render();
  f2.render();
  f3.render();
  f4.render();
  f5.render();
  f6.render();
  f7.render();
  f8.render();
  f9.render();
  f10.render();
  f11.render();
  f12.render();
}

void firework() {
  fill (0, 0, 0, 8);
  rect(0, 0, width, height-380);
  fill (random(255), random(255), random(255));
  ellipse (random(width), random(height-380), 2, 5); 
  ellipse (random(width), random(height-380), 2, 5);
  ellipse (random(width), random(height-380), 2, 5); 
  ellipse (random(width), random(height-380), 2, 5);
  ellipse (random(width), random(height-380), 2, 5); 
  ellipse (random(width), random(height-380), 2, 5);
  ellipse (random(width), random(height-380), 2, 5); 
  ellipse (random(width), random(height-380), 2, 5);
}

void moon() {
  fill (255, 255, 255, 3);
  ellipse(400, 100, 30, 30);
}

class Robot {
  float x=0;
  float y=0;
  float m=0;
  float d=0;
  int c=0;



  public Robot(float new_x, float new_y, float new_m, int new_c, float new_d) {
    x=new_x;
    y=new_y;
    m=new_m;
    c=new_c;
    d=new_d;
  }

  public void render() {
    tint(150, 153, 204, 5);
    image(skyline, 0, 0);
    fill (0, 0, 0, 5);
    rect(0, height-380, width, height);
    if (y>height-380) { 
      fill(255);
      float f = sin(radians(a));
      x+=f;
      ellipse(x, y, d, d);
      a=a+0.1;
      y -= m;
    }

    else {
      firework();
      y=0;
    }
    if (a>=160) {
      moon();
    }
  }
}


