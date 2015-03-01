
Flower[] flowers = new Flower[20];
 PFont font;


void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
 
 font=loadFont("DFWaWaTC-W5-48.vlw");
  textFont(font);
  
  
  for (int i = 0 ; i < flowers.length;i++) {
    flowers[i] = new Flower();
  }
  strokeWeight(5);
}
 
void draw() {
  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);
 
  if(mousePressed){
     String s_1="Assignment";
     
     for (int i=0; i<12; i+=1) {
       float x_1=random(0,width);
       float y_1=random(0,height);
       float sz=random(10,55);
       int substrbegin=(int)random(0,s_1.length()-1);
       int substrend=(int)random(substrbegin+1,s_1.length()-1);
       textSize(sz);
       fill(255);
       text(s_1.substring(substrbegin,substrend),x_1,y_1);
     }
   }
 
  for (int i = 0 ; i < flowers.length;i++) {
    flowers[i].display();
  }
}
 
class Dot {
  float hue;
 
  float R = random(10, 100);
  float theta = random(TWO_PI);
 
  float x;
  float y;
 
  float goal_x = R * cos(theta);
  float goal_y = R * sin(theta);
 
  float easing_x = random(0.03, 0.07);
  float easing_y = random(0.03, 0.07);
 
  float sat = random(30,100);
  float brt = random(30,100);
 
  Dot(float tmpHue) {
    x = 0;
    y = 0;
    hue = tmpHue;
  }
 
  void move() {
    x += (goal_x - x) * easing_x;
    y += (goal_y - y) * easing_y;
  }
 
  void display(float alp) {
    stroke(hue, sat, brt, alp);
    point(x, y);
  }
}
 
class Flower {
  int dot_val = (int)random(100, 200);
 
  Dot[] dots = new Dot[dot_val];
 
  float x = random(width);
  float y = random(height);
  float hue = random(360);
 
  float alp = random(10, 255);
  float alp_spd = random(3, 6);
 
  Flower() {
    for (int i = 0; i < dots.length;i++) {
      dots[i] = new Dot(hue);
    }
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < dots.length;i++) {
      dots[i].move();
      dots[i].display(alp);
    }
     
    alp -= alp_spd;
     
    if (alp < 0) {
      x = random(width);
      y = random(height);
      hue = random(360);
 
      for (int i = 0; i < dots.length;i++) {
        dots[i].x = 0;
        dots[i].y = 0;
      }
      alp = 255;
    }
 
    popMatrix();
  }
}

