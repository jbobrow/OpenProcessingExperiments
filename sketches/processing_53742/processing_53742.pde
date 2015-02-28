
class Clock {//draws the clock
  int sides;
  int rad;
  float theta;
  
  Clock(int sides, int rad, float theta) {
    this.sides = sides;
    this.rad = rad;
    this.theta = theta;
  }
  void draw() {
    smooth();
    frameRate (1);
    stroke(0);
     
    if (mouseX<width/2){
    fill(0);
    }
    else {
      fill (255,255,0);
    }
   
    ellipse(width/2, height/2, rad*2.5, rad*2.5);
    
  
    fill(255);
   
   
    ellipse(width/2, height/2, rad*0.1, rad*0.1);

    stroke (random(50, 255), random(100, 255), random(200, 255));
    strokeWeight (2);
    //clock hand movement
    line (width/2, height/2, cos(theta)*rad+width/2, sin(theta)*rad+height/2);
    if (mouseX<width/2){
    theta = theta - (TWO_PI/sides);
    }
    else {
      theta = theta + (TWO_PI/sides);
    }
  }
}


