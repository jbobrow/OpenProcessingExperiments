
import ddf.minim.*;
//PVector!!
 Minim minim;
 AudioPlayer song;

Ball a_ball, another_ball, onemore_ball;
 
void setup() {
  minim = new Minim (this);
  song = minim .loadFile("click_x.wav");
  size(500,500);
  smooth();
  background(255);
  a_ball = new Ball(10, 100, 1, 3.3);
  another_ball = new Ball(random(width), random(height), random(5), random(5));
  onemore_ball = new Ball(random(width), random(height), random(7), random(5));
}
 
void draw() {
  noStroke();
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
    


 
 //dist (xlocation,ylocation,x1,x2) = 
  }
 
  void display() {
    stroke(0);
    fill(0,242,200);
    ellipse(loc.x,loc.y,30,30);
    
   if ((loc.x <= 0) || (loc.x >= 500) || (loc.y <= 0) || (loc.y >= 500) &&!song.isPlaying()) {
song.loop(0);
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

//float x = sqrt((mouseY^2)+(mouseX^2))

//float y = sqrt((500-mouseY^2)+(500-mouseX^2))

//if (ball intersects with

//float x = mouseY;
//float y = mouseX;
//float Bottomline = (x,y, 500,0);
//float Topline = (x,y, mouseX, mouseY);
//if (loc.x = 

 //float dx = abs( x1 - x2 ); 
  //float dy = abs( y1 - y2 ); 
  //float dx = x2 - x1;
  //float dy = y2 - y1;

 // float d = sqrt( dx*dx + dy*dy ); 


  //if (loc.x is in A [area]); {
//song.loop(0);
  // }

//float mX = (-x1+x)*ca + (-y1+y)*sa; 
  //float mY = (-y1+y)*ca + ( x1-x)*sa; 
 
//float a = atan2(mouseY-height/2, mouseX-width/2);


