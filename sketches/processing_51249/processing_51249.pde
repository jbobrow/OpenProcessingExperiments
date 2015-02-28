

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
    rad = map(brightness(img.pixels[pix]),0,255,3,7);
    col = img.pixels[pix];
  }
    
  void paint() {
    fill(col);
    ellipse(pos.x,pos.y,(2*rad)-1,(2*rad)-1);
  }

  void checkOver(Ball b) {
    PVector diff = PVector.sub(pos,b.pos);
    if(diff.mag() < rad + b.rad) {
      PVector cen = PVector.add(pos,b.pos);
      cen.div(2);
      diff.normalize();
      pos = PVector.add(cen,PVector.mult(diff,(rad + b.rad)/2));
      b.pos = PVector.add(cen,PVector.mult(diff,-(rad + b.rad)/2));
      vel.set(0,0,0);
      b.vel.set(0,0,0); 
    }
  }

  void force() {
    PVector diff = PVector.sub(pos,new PVector(mouseX,mouseY,0.0));
    float distance = diff.mag();
    diff.normalize();
    if(distance < rad) {
      PVector deltaVel = PVector.mult(diff,15);     
      vel.add(deltaVel);
    }
    else if(distance < 40) {
      PVector deltaVel = PVector.mult(diff,15*sq(rad/distance));     
      vel.add(deltaVel);
    }
  }

}  


