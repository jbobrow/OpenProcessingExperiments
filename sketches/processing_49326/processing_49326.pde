
class Alien {
  float x;
  float y;
  int w=40;
  int h=40;
  color col;
  
  boolean hit = false;
  
  Alien(float x_, float y_, color col_) {
    col = col_;
    x = x_;
    y = y_;
  }
  
  
  void display (float x_, float y_) {
    
    x = x_;
    y = y_;
    
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
  
  void hitTest(Alien alien) {
     
    if (dist(x, y, alien.x, alien.y) <= 100) {
      alien.hit = true;
      hit = true;
    } else {
      alien.hit = false;
      hit = false;
    }
  }
}


