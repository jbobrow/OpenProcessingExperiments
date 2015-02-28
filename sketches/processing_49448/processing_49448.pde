
class Alien {
  int index;
  float x;
  float y;
  int w = 40;
  int h = 40;
  color col;
  
  boolean hit = false;
  
  // perlin noise
  float xt;
  float yt;
  float increment;
  
  Alien(float x_, float y_, color col_, float xt_, float yt_, float increment_) {
    col = col_;
    x = x_;
    y = y_;
    
    // Perlin noise
    xt = xt_;
    yt = yt_;
    increment = increment_;
  }
  
  
  void moveCritter() {  
    // add noise
    x = width * noise(xt);
    y = height * noise(yt);
    
    // increment timers
    xt += increment;
    yt += increment;
    
    hit = false;
  }
  
  
  void drawCritter() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    //head
    noStroke();
    if (hit) {
      fill(131,44,209);
    } else {
      fill (col);
    }
    arc(x,y-25,w,h,PI,PI+PI);
  
    //body
    noStroke();
    if (hit) {
      fill(131,44,209);
    } else {
      fill (col);
    }
    rect(x,y-12,w,h-10);
  
  
    //eyes
    fill(255);
    ellipse(x+8,y-30,w-33,h-31);
    ellipse(x-8,y-30,w-33,h-31);
    fill(0);
    ellipse(x+8,y-27,w-33,h-33);
    ellipse(x-8,y-27,w-33,h-33);
  
    //feet
    noStroke();
        if (hit) {
      fill(131,44,209);
    } else {
      fill (col);
    }
    arc(x+20,y+10,w-20,h-20,PI,PI+PI);
    arc(x-20,y+10,w-20,h-20,PI,PI+PI);
  
    //antenea
    if (hit) {
      stroke(131,44,209);
    } else {
      stroke (col);
    }
    stroke(col);
    line(x+12,y-55,x+8,y-42);
    line(x-12,y-55,x-8,y-42);
    ellipse(x+12,y-55,w-35,h-35);
    ellipse(x-12,y-55,w-35,h-35);
  }
  
  void hitTest(float objX, float objY) {
    if (dist(x, y, objX, objY) <= 50) {
      hit = true;
    } 
  }

}


