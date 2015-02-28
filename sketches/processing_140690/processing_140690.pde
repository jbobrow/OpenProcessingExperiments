
//Mady Dean 03/19/14 Creative Computing: Section B//

Mover[] movers = new Mover[20];

void setup() {
  size(500,500);
  smooth();
  background(0);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  noStroke();
  fill(random(100), random(15));
  rect(0,0,width,height);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
}
  
  fill(255,49,56);
  text( "Click mouse to disperse.", 350, 490);
}

void mousePressed(){
  for (int i = 0; i < movers.length; i++) {
    movers[i].location.x = random(width);
    movers[i].location.y = random(height); 
  }
  
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(10,30);
    topspeed = 5;
  }

  void update() {

    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location); 
    dir.normalize();     
    dir.mult(0.3);        
    acceleration = dir;  

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
 }

 void display() {
    stroke(random(255),random(255),10,0); 
    fill(76,0,153);
    ellipse(location.x,location.y,30,30);
                 fill(0,0,0);
    ellipse(location.x,location.y+8, 23,7);
             fill(0,238,118);
    ellipse(location.x,location.y+6, 22,7);
    fill(0,0,0);
    ellipse(location.x,location.y+3, 3,3);
     fill(0,0,0);
    ellipse(location.x+7,location.y, 8,8);
         fill(0,0,0);
    ellipse(location.x-7,location.y, 8,8);
             fill(0,0,0);
                 fill (255,49,56);
        ellipse(location.x,location.y+17, 3,4);
    strokeWeight(10); 
  }


  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }

  }

}

