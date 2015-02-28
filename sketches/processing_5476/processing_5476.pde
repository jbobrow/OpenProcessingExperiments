
class Arm {
  PGraphics g;
  
  float r1, r2;
  XY goal;
  XY origin;
  XY end;
  float theta1, theta2;
  PID joint1, joint2;
  float velo1, velo2;
  
  float MASS = 5;
  float UFRIC = .9;
  
  float nodeScale;
  
  Block cargo;
  boolean dropAtTarget = false;
  
  Arm(float ir1, float ir2, XY iorigin) {
    this.r1 = ir1;
    this.r2 = ir2;
    this.theta1 = PI/2;              // Point straight up
    this.theta2 = PI;
    this.origin = new XY(iorigin);
    
    goal = new XY(0, -(this.r1+this.r2)/2);  
    float[] t = IK(goal);
    this.theta1 = t[0];
    this.theta2 = t[1];
    
    
    this.nodeScale = 1/12.;
    this.g = createGraphics(int(2.5 * (this.r1+this.r2)), int(2.5 * (this.r1+this.r2)), JAVA2D);       

    joint1 = new PID(MASS*.005,0.000,MASS * .002,1);
    joint2 = new PID(MASS*.005,0.000,MASS * .002,1);
  }  
  
  void update() {
    
    // IK and physics
    float[] angles = new float[2];
    angles = IK(this.goal, -1);
    float d1 = joint1.update(this.theta1, angles[0]);
    float d2 = joint2.update(this.theta2, angles[1]);
    velo1 += d1/MASS;
    velo2 += d2/MASS;
    velo1 *= UFRIC;
    velo2 *= UFRIC;
    this.theta1 += velo1;
    this.theta2 += velo2;
    
    // *** Draw arm
    this.g.beginDraw();
    this.g.colorMode(HSB);
    this.g.smooth(); 
    this.g.background(0,0,0,0);
    this.g.rectMode(CENTER);
    
    this.g.translate(this.g.width/2, this.g.height/2);
    
    // Draw range
    this.g.noFill();
    this.g.stroke(0,0,120);
    this.g.ellipse(0,0, 2 * (this.r1 + this.r2), 2 * (this.r1 + this.r2));
    this.g.ellipse(0,0, 2 * (this.r1 - this.r2), 2 * (this.r1 - this.r2));
    
    
    // First joint and arm
    this.g.noStroke();
    //this.g.line(0,0, this.r1 * cos(this.theta1), this.r1 * sin(this.theta1));
    this.g.pushMatrix();
    this.g.fill(150,150,00);
    //this.g.stroke(0,0,255);
    this.g.noStroke();
    this.g.rotate(this.theta1+PI/2);
    this.g.beginShape();
    this.g.vertex(-this.r1 * this.nodeScale / 2,0);
    this.g.vertex(-this.r2 * this.nodeScale / 2, -this.r1);
    this.g.vertex(this.r2 * this.nodeScale / 2, -this.r1);
    this.g.vertex(this.r1 * this.nodeScale / 2, 0);
    this.g.endShape(CLOSE);
    this.g.popMatrix();
    //this.g.fill(100 - abs(d1)/.05 * 100,100,200);
    this.g.ellipse(0,0,this.r1 * this.nodeScale, this.r1 * this.nodeScale);
    
    // Second joint and arm
    this.g.pushMatrix();
    this.g.translate(this.r1 * cos(this.theta1), this.r1 * sin(this.theta1));
    this.g.noStroke();
   
    float t2 = this.theta2 + this.theta1 + PI;
    this.g.pushMatrix();
    this.g.fill(150,150,00);
    //this.g.stroke(0,0,0);
    this.g.noStroke();
    this.g.rotate(t2+PI/2);
    this.g.beginShape();
    this.g.vertex(-this.r2 * this.nodeScale / 2, 0);
    this.g.vertex(-this.r2 * this.nodeScale / 4, -this.r2);
    this.g.vertex(this.r2 * this.nodeScale / 4, -this.r2);
    this.g.vertex(this.r2 * this.nodeScale / 2, 0);
    this.g.endShape(CLOSE);
    this.g.popMatrix();    
    //this.g.fill(100 - abs(d2)/.05 * 100,100,200);
    this.g.ellipse(0,0,this.r2 * this.nodeScale, this.r2 * this.nodeScale);       
    
    
    // Draw cargo box
    float s = this.cargo == null ? 1.5 : 1.1;
    this.g.stroke(0,0,0);
    this.g.strokeWeight(4);
    this.g.noFill();
    this.g.rect(this.r2 * cos(t2)-1, this.r2 * sin(t2), BLOCK_SIZE*s, BLOCK_SIZE*s);
    this.g.popMatrix();
    this.g.strokeWeight(1);
    
    this.end = new XY(this.r1 * cos(this.theta1) + this.r2 * cos(t2), this.r1 * sin(this.theta1) + this.r2 * sin(t2));    
    this.end.translate(this.origin);    
    
    // Draw target
    this.g.pushMatrix();
    this.g.translate(this.goal.x, this.goal.y);
    /*
    this.g.stroke(0,200,255);
    this.g.line(0,3, 0,-3);
    this.g.line(-3,0, 3,0);
    this.g.ellipse(0,0,2,2);
    */
    if(this.goal.distance(new XY(this.end.x - this.origin.x, this.end.y - this.origin.y)) > 3) {
      this.g.noStroke();
      this.g.fill(0,0,255,abs(frameCount%10-5) * 20 + 50);
      this.g.rect(0,0, BLOCK_SIZE*1.5, BLOCK_SIZE*1.5);
    }
 
    this.g.popMatrix();    
    this.g.endDraw();
    
    // *** Deal with cargo
    if(this.cargo == null)  {
      Block b;
      for(int i=blocks.size()-1; i>=0; i--) {
        b = (Block)blocks.get(i);

        println();
        if(b.free  && b.position.distance(this.end) < 3 && this.dropAtTarget &&
            this.goal.distance(new XY(this.end.x - this.origin.x, this.end.y - this.origin.y)) < 5) {
          this.dropAtTarget = false;
          this.cargo = b;
          this.cargo.free = false;
          if(b.position.x == stockPileLocation) {  // Did we take it from the stockpile?
            stockPileCount--;
          }
        }
      }    
    }
    else {
      if(this.dropAtTarget && this.goal.distance(new XY(this.end.x - this.origin.x, this.end.y - this.origin.y)) < 5) {
        this.cargo.position = new XY(this.goal.x + this.origin.x, this.goal.y + this.origin.y);
        this.cargo.free = true;
        this.cargo = null;  
        this.dropAtTarget = false;
      }
      else {
        this.cargo.position = this.end;
      }
    }

  }
  
  float[] IK(XY goal) {
    return IK(goal, -1);  
  }
  float[] IK(XY goal, int sign) {
    goal = new XY(goal);
    if(goal.length() > this.r1 + this.r2 ) {
      goal.normalize();
      goal.scale(.99*(this.r1 + this.r2));  
    }

    if(goal.length() < this.r1 - this.r2 ) {
      goal.normalize();
      goal.scale(1.01*(this.r1 - this.r2));  
    }    
    float[] angles = new float[2];
    float d = goal.length();
    
    if(goal.x < 0) {
      sign *= -1;
    }
    
    angles[0] = sign * acos((sq(this.r1) + sq(d) - sq(this.r2)) / (2 * this.r1 * d)) + atan(goal.y / goal.x);
    angles[1] = sign * acos((sq(this.r1) + sq(this.r2) - sq(d)) / (2 * this.r1 * this.r2));
    
    if(goal.x < 0) {
      angles[0] -= PI;
      //angles[1] += PI;
    }
    
    return angles;
  }
}

