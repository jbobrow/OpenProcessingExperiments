
Wobbler ball01;
Wobbler ball02;
Wobbler ball03;
Wobbler ball04;
Wobbler ball05;

void setup(){
  size(400,400);
  background(255);
  smooth();
  ball01 = new Wobbler(width/2,height/2,10);
  ball02 = new Wobbler(width/3,height/3,20);
  ball03 = new Wobbler(width/4,height/4,40);
  ball04 = new Wobbler(250,250,80);
  ball05 = new Wobbler(150,150,160);
}

void draw(){
  background(255);
  ball01.move();
  ball01.display();
  ball01.randColor();
  ball02.move();
  ball02.display();
  ball02.randColor();
  ball03.move();
  ball03.display();
  ball03.randColor();
  ball04.move();
  ball04.display();
  ball04.randColor();
  ball05.move();
  ball05.display();
  ball05.randColor();
}


//when setting up a class, capitalize first letter
class Wobbler {
  //enter variables that will be used
  float xpos;
  float ypos;
  float diameter;
  //enter constructor (which is a block)
  Wobbler(float txpos, float typos, float tdiameter){
    xpos = txpos;
    ypos = typos;
    diameter = tdiameter;
  }
  void move(){
    xpos += random(-3,3);
    ypos += random(-3,3);
    if(mousePressed){
      xpos = random(width);
      ypos = random(height);
    }
  }
  void display(){
    ellipse(xpos,ypos,diameter,diameter);
  }
  void randColor(){
    if(mousePressed){
      fill(random(0,255),random(0,255),random(0,255));
    }
  }
}


