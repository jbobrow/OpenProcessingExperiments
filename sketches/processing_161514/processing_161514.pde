
var[] movers = new Mover[10];
var mouse;
var minDist;
var maxDist;
var vert = 5;

void setup() {
  size(500, 500);
  smooth();
  frameRate(20);
  textSize(10);
  textAlign(CENTER,CENTER);
  mouse = new PVector(width/2, height/2);
  
  for(int i = 0; i < movers.length ; i ++ ) {
    movers[i] = new Mover(random(width), random(height));
  }

  minDist = 5;
  maxDist = minDist * minDist*0.5;
  noStroke();
  colorMode(HSB,360,100,100,100);
  fill(320,80,100,80);

}


void draw() {

  // update
  mouse.set(mouseX, mouseY);
  for(int i = 0; i < movers.length; i ++ ) {

    movers[i].applyForce(gravity(movers[i]));
    
    movers[i].wander();
  }

  // render
  background(0,0,100);
  //stroke(255);
  for(int i = 0; i < movers.length; i ++ ) {
    movers[i].display();
  }
}

 PVector gravity(Mover mov) {
      PVector force = PVector.sub(mouse, mov.position);
      float distance = force.mag();
      distance = constrain(distance, minDist, maxDist);
      float m = (100) / (distance * distance);
      force.normalize();
      force.mult(m);
      return force;
  }
  
  void keyPressed() {
      if(key == CODED) {
          if(keyCode == UP) {
          vert++;
          } else if(keyCode == DOWN) {
          vert--;
          }
          vert = constrain(vert,2,100);
      }
  }


class Mover {

   var position;
   var velocity;
   var acceleration;
   var size;
   var radius;
   var wandertheta;
   var wanderRadius;
   var wanderDistance;
   var wanderCircleLoc;
   var wanderCircleOffset;
   var maxspeed = 8;
   var maxforce = 1.8;
  
  Mover(var x_, var y_) {

    position = new PVector(x_,y_);
    velocity = new PVector();
    acceleration = new PVector();
    wanderCircleOffset = new PVector();
    wanderCircleLoc = new PVector();
    wandertheta = 0;
    size = 20;
    radius = size *0.5;
    wanderRadius = 4;
    wanderDistance = 70;
    
  }
 
  void applyForce(PVector force) {
    //PVector f = PVector.div(force,mass);
    acceleration.add(force);
    //println("applyforce");
  } 
  
  void update() {
    velocity.add(acceleration);
   // velocity.limit(minDist*2);
    position.add(velocity);
    acceleration.mult(0);

  }
  

  void display() {
    
    update();
    
    stayWithin();
    
    pushMatrix();
      translate(position.x,position.y);
      sparkle(vert);
    popMatrix();

    //renderDebug();
  }

  void sparkle(int vertices) {
    beginShape();
    for(var i = 0; i < vertices; i++)  { 
      var xx = random(-size,size);
      var yy = random(-size,size);
      vertex(xx,yy);
    }
    endShape(CLOSE);
  }
  
    void wander() {
   
        wanderCircleLoc = velocity.get();
        wanderCircleLoc.normalize();
        wanderCircleLoc.mult(wanderDistance);
        wanderCircleLoc.add(position.get());
    
        if (wanderRadius > 0) {
        
            var change = 0.3;
            
            wandertheta += random(-change, change); 
            
            
            
            float h = velocity.heading2D();
          
            wanderCircleOffset.set(wanderRadius * cos(wandertheta + h), wanderRadius * sin(wandertheta + h));
        } else {
            wanderCircleOffset.set(0, 0);
        }
        var tgt = PVector.add(wanderCircleLoc, wanderCircleOffset);
        
        seek(tgt);
        
    }

    void seek(PVector tgt) {

        var desired = PVector.sub(tgt, position);
        desired.normalize();
        desired.mult(maxspeed);
        desired.sub(velocity);
        desired.limit(maxforce);
        
        applyForce(desired);
       // println("seek completed");
    }

    void stayWithin() {
        var r = size * 0.5;
        var desired = new PVector();
        if (position.x < r) {
            desired = new PVector(maxspeed * 5, velocity.y);
        } else if (position.x > width - r) {
            desired = new PVector(-maxspeed * 5, velocity.y);
        } else if (position.y < r) {
            desired = new PVector(velocity.x, maxspeed * 5);
        } else if (position.y > height - r) {
            desired = new PVector(velocity.x, -maxspeed * 5);
        }
        desired.sub(velocity);
        desired.limit(maxforce);
        applyForce(desired);
       // println("stay within completed");
    }

    void renderDebug() {
        pushMatrix();
        translate(position.x,position.y);
        noFill();
        strokeWeight(1);
        stroke(222);
        ellipse(0, 0, size, 2);
        stroke(255);
        strokeWeight(1);
        line(0, 0, velocity.x*100, velocity.y*100);
        popMatrix();
        fill(255);
        pushMatrix();
        translate(wanderCircleLoc.x, wanderCircleLoc.y);
        ellipse(wanderCircleOffset.x, wanderCircleOffset.y,5,5);
        noFill();
        ellipse(0, 0, wanderRadius*2, wanderRadius*2);
        popMatrix();
    }
}
