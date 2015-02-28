
//rain effect from http://www.openprocessing.org/sketch/68008

//lightning effect from http://www.openprocessing.org/sketch/41533


PImage img;


Drop[] drop = new Drop[20];
 
 
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


void setup() {
  size(600, 400);
  background(255);
 
  smooth();
  noStroke();
  for (int i = 0; i < drop.length;i++) {
    float x = random(width);
    float s = random(1, 5);
    float c1 = random(10);
    float c2 = random(255);
    drop[i] = new Drop(x, s, c1, c2);
  }
  
    img= loadImage("sad.jpg");
    image(img,0,0);
    
  //lightning    
  smooth();
  cursor(CROSS);
  frameRate(50);
    

}
 
void draw() {
  background(img);
  noStroke();
 
  for (int i = 0; i < drop.length;i++) {
    drop[i].move();
    drop[i].display();
  }

  
  
}


class Drop {
  float x;
  float y;
  float s;
  float c1;
  float c2;
  float speed;
 
  Drop(float tmpX, float tmpS, float tmpC1, float tmpC2) {
    x = tmpX;
    y = 0;
    s = tmpS;
    c1 = tmpC1;
    c2 = tmpC2;
    speed = 8 -s;
  }
 
  void move() {
    y += speed;
 
    if (y > height) {
      y =  - 70 * (s / 3);
      c1 = random(150);
      c2 = random(255);
      x = random(width);
    }
  }
 
  void display() {
    fill(c1, c2, 255,255);
    for (int i = 10; i > 0;i--) {
      ellipse(x, y+i*1.2*s, s*i+3, s*i+3);
    }
  }
  
}


//lightning
void lightning(){
 
  
int st=round(random(700));
int end=350;
int y = 0;
int y2 = 40;
 
 
while ( y2 < 500){
 
 end = (st-40) + round(random(80));
 stroke (210,222,10);
 strokeWeight(8);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
  
 end = (st-40) + round(random(80));
 stroke (210,222,10);
 strokeWeight(8);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
  
 }
}
 
void mouseClicked() {
 lightning();
 lightning();
 lightning();
 
}
 
void mousePressed(){
 
 rect(0,0,800,400);
 fill(255);
 frameRate(50);
 loop();

}

