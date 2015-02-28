
class Particle {
  float x;
  float y;
  float xspeed;
  float yspeed;
  float velocityX;
  float velocityY;
  
  Particle(float x1, float y1) {
    x = x1;
    y = y1;
   
    xspeed = random(0,0.5);
    yspeed = random(-2,0);
  }
  
  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() {
    yspeed += 0.07;
  }
  
  void display() {
    stroke(0);
    fill(0,75);
    ellipse(x,y,10,10);
    
  }
  
  void drawParticle(){
    if (timer.isFinished()) {
      if (q != rowCount){
        for(int row = q; row == q; row++){
          x1 = aTable.getFloat(row,0);
          y1 = aTable.getFloat(row,1);
          balletjes.add(new Particle(x1,y1));        
          }
       q++;
      }
      timer.start();
    }

  }
}

