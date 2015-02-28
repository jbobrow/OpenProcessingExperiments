
ArrayList<Flog> myFlogs = new ArrayList<Flog>();

void setup() {
  size(400,400);
  smooth();
  frameRate(60);
}

void draw() {
  background(0,102,153);
  for(Flog f:myFlogs)
    f.display();
}

void mouseClicked() {
  fill(255);
  myFlogs.add(new Flog(mouseX, mouseY));
}

void keyPressed() {
  if (key == ' ' && myFlogs.size() > 0)
    myFlogs.remove(myFlogs.size()-1);
}

class Flog {
  PVector location;
  PVector velocity;
  PVector speed;
  int greenShade;
  int tongue;
  int tongueChange;
  int wing;
  int wingChange;
  float angle;
  int timer;
  
  Flog(int initX, int initY) {
    location = new PVector(initX, initY);
    velocity = new PVector(0, -1*random(1,3));
    speed = new PVector(0.1, 0.1);
    
    greenShade = 50+int(random(100));
    tongue = int(random(10));
    tongueChange = int(random(5));
    wing = 0;
    wingChange = 5;
    angle = random(-45,45);
    
    timer = 0;
  }
  
  void display() {
    timer++;
    
    pushMatrix();
    translate(location.x, location.y);
    pushMatrix();
    rotate(radians(angle));
    
    animate();
    
    drawShadow();
    drawTongue();
    //drawTail();
    drawLeg(true);
    drawLeg(false);
    drawBody();
    drawEyes();
    drawWing(true);
    drawWing(false);
    
    popMatrix();
    popMatrix();
    
    angle = degrees(asin(velocity.x/sqrt(pow(velocity.x,2)+pow(velocity.y,2))));
    if(velocity.y > 0)
      angle = 180-angle;
  }
  
  void drawShadow() {
    noStroke();
    for(int i=0; i<15; i++) {
      fill(0,10);
      ellipse(0, 30, 40+4*i, 50+4*i); 
    }
  }
  
  void drawTongue() {
    noFill();
    stroke(204, 102, 204);
    strokeWeight(10);
    line(0,-45,tongue,-55);
    stroke(0);
    strokeWeight(1);
    line(0,-45,tongue,-54);
  }
  
  void drawTail() {
    triangle(-5, 50, 0, 70, 5, 50);
  }
  
  void drawLeg(boolean isLeft) {
    fill(0, greenShade, 0);
    int m = (isLeft) ? -1:1;
    
    pushMatrix();
    rotate(radians(m*wing));
    beginShape();
    curveVertex(m*10, 50);
    curveVertex(m*35, 20);
    curveVertex(m*60, 15);
    curveVertex(m*20, 45);
    curveVertex(0, 0);
    endShape();
    
    beginShape();
    curveVertex(m*20, 45);
    curveVertex(m*20, 45);
    curveVertex(m*50, 70);
    curveVertex(m*10, 48);
    curveVertex(m*10, 50);
    endShape(); 
    popMatrix(); 
  }
  
  void drawBody() {
    fill(0, greenShade, 0);
    ellipse(0, 0, 80, 100); 
  }
  
  void drawEyes() {
    int eye = greenShade/4;
    if(timer%50>0 && timer%50<10) {
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
    }
    else {
      fill(255);
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
      fill(0);
      ellipse(-35, -23, eye/2, eye/2);
      ellipse(35, -23, eye/2, eye/2);
      fill(0, greenShade, 0);
      arc(-35, -20, eye, eye, 0, PI);
      arc(35, -20, eye, eye, 0, PI);
    }
  }
  
  void drawWing(boolean isLeft) {
    noStroke();
    fill(255, 50);
    int m = (isLeft) ? -1:1;
    
    pushMatrix();
    rotate(radians(-1*m*wing));
    ellipse(m*45, 10, 80, 40);
    stroke(50);
    line(m*5, 10, m*60, 10);
    popMatrix(); 
  }
  
  void animate() {
    wing += wingChange;
    if(wing > 10 || wing < -10)
      wingChange *= -1;

    location.add(velocity);
    
    if(velocity.x > 3 || velocity.x < -3)
      speed.x*=-1;
    if(velocity.y > 3 || velocity.y < -3)
      speed.y*=-1;
    
    velocity.x+=speed.x*random(-1,1);
    velocity.y+=speed.y*random(-1,1);
    
    checkEdges();
    
    tongue += tongueChange;
    if(abs(tongue) > 15)
      tongueChange *= -1;
  }
  
  void checkEdges() {
    if (location.x > width+50) {
      location.x = 0;
    } else if (location.x < -50) {
      location.x = width;
    }
  
    if (location.y > height+50) {
      location.y = 0;
    } else if (location.y < -50) {
      location.y = height;
    }
  }

}

