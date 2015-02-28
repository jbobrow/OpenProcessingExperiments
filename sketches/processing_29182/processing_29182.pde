
import ddf.minim.*;

 Minim minim;
 AudioPlayer song;

float black = 3;
float darcy = 8;
float jerk = 200;
Ball a_ball, another_ball, onemore_ball;
 
void setup() {
  minim = new Minim (this);
  song = minim .loadFile("shiny-ding.mp3");
  size(500,500);
  smooth();
  background(255);
  a_ball = new Ball(10, 100, 1, 3.3);
  another_ball = new Ball(random(width), random(height), random(5), random(5));
  onemore_ball = new Ball(random(width), random(height), random(7), random(5));
}
 
void draw() {
 //noStroke();
 fill(255);
 rect(0,0,width,height);
 
 
 
  a_ball.update();
  another_ball.update();
  onemore_ball.update();
 
  
  a_ball.display();
  another_ball.display();
  onemore_ball.display();
 
     line (mouseX,mouseY,500,0);
  line (0,500,mouseX,mouseY);
  
}

class Ball {
  PVector loc;  
  PVector vol;  
 
  Ball(PVector l, PVector v) {
    loc = l;
    vol = v;
  }

  Ball(float x, float y, float xsp, float ysp) {
    loc = new PVector(x, y);
    vol = new PVector(xsp, ysp);
  }
  
  void update() {
    
    if ((xlocation() > width) || (xlocation() < 0)) {
      changeSpeed(new PVector(-1,1));
    }
    if ((ylocation() > height) || (ylocation() < 0)) {
      changeSpeed(new PVector(1,-1));
    }
    loc.add(vol);
    

 
  }
 
  void display() {
    noStroke();
    fill(255,159,black,30);
    triangle(0,0,0,500,250,500);
    fill(205,250,darcy,30);
    triangle(0,0,500,0,250,500);
    fill(94,jerk,222,30);
    triangle(500,0,250,500,500,500);
    fill(0,242,200);
    ellipse(loc.x,loc.y,30,30);
    
   if ((loc.x <= 0) || (loc.x >= 500) || (loc.y <= 0) || (loc.y >= 499) &&!song.isPlaying()) {
song.loop(0);

if (loc.y<=3){
  black = random(180,210);
}else{ black = 3;
}
if (loc.x >=500){
  jerk = random(0,20);
}else{ jerk = 200;
}

if (loc.x<=1){
  darcy = random(10,40);
}else{ darcy = 8;
}



float line2 = dist (mouseX,mouseY,500,0);
float line1 = dist (mouseX,mouseY,0,500);
float dist1 = dist (mouseX,mouseY,loc.x,loc.y);
float dist2 = dist (loc.x,loc.y,500,0);
float dist3 = dist (loc.x,loc.y,0,500);

if (dist1+dist2<line1+50){
 strokeWeight (3);
}else{
  noStroke();
}

if(dist3+dist1<line1+50){
strokeWeight (3);
}else{
  noStroke();
}

   }
  
 
  }
 
  float xlocation() {
    return loc.x;
  }
 
  float ylocation() {
    return loc.y;
  }
 
  PVector changeSpeed(PVector a) {
    vol.mult(a);
    return vol;
  }
  
}

void stop()
{
  
  super.stop();
}



