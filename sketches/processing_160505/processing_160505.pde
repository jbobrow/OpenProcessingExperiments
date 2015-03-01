
Turtle t;

void setup(){
  size(400, 400);
  noCursor();
  t = new Turtle();
}

void draw(){
  background(255);
  t.location.x = mouseX;
  t.location.y = mouseY;
  t.update();
  t.display();
}

class Turtle{
  PVector location;
  float angle;
  int radius;
  color strokeColor;
  
  Turtle(){
    angle = 0;
    location = new PVector(width/2, height/2);
    strokeColor = #408921;
    radius = 15;
  }
  
  void display(){
    fill(255);
    stroke(strokeColor);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    //Cola
    beginShape();
    vertex(0, -radius-6);
    vertex(3, -radius+3);
    vertex(-3, -radius+3);
    endShape(CLOSE);
    //Fin Cola
    for(int i = 0; i < 4; i++){
      ellipse((radius+2)*cos(TWO_PI/4*i+PI/4), (radius+2)*sin(TWO_PI/4*i+PI/4), 5, 5);
    }    
    ellipse(0, radius, 10, 10);
    ellipse(0, 0, radius*2, radius*2);
    ellipse(0, 0, radius*1.5, radius*1.5);
    popMatrix();
  }
  
  void update(){
    angle = radians(frameCount);
  }    
}
