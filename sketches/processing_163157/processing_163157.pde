
color c;
float xpos;
float ypos;
float diameter;
float sxpos;
float sypos;
Circle circ;
Square squa;

void setup(){
  size(1000, 800);
  background(0);
  frameRate(25);
  rectMode(CENTER);
  stroke(255);
  circ = new Circle(xpos, ypos);
  squa = new Square(sxpos, sypos);
}

void draw(){
  circ.display();
  squa.display();
  line(xpos, ypos, sxpos, sypos);
}

void keyPressed(){
  background(0);
}

class Circle {
  
  Circle(float x, float y){
  xpos = width/2;
  ypos = height/2;
  diameter = 1.0;
  }
    
  
  void display(){
    c = color(random(150), random(150), random(150), 64);
    fill(c);
    smooth();
    ellipse(xpos, ypos, diameter, diameter);
    
    for(int i=0; i<15; i++){
      diameter = diameter + 1;
    }
    //for(int i = 15; i<30;i
    if(diameter >= 250){
      diameter = 10.0;
    }
  }
}

class Square {
  
  Square(float x, float y){
    diameter = 1.0;
  }
    
  void display(){
    c = color(random(255), random(255), random(255), 64);
    fill(c);
    smooth();
    sxpos = random(width);
    sypos = random(height);
    rect(sxpos, sypos, diameter, diameter);
  }
}


