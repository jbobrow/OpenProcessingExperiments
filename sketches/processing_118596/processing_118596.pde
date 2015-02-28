
Ball ball1;
Ball ball2;
Ball ball3;
float diff1; 
float diff2; 
float diff3; 

void setup(){
  size(800, 600); // 
  ball1 = new Ball(600,100,0);
  ball2 = new Ball(400,50,0);
  ball3 = new Ball(100,200,0);
  
  frameRate(20);
  ball1.move(); 
  ball2.move(); 
  ball3.move();

  
}
void draw() {
  background(255);

  diff1 = abs(ball1.Xpos - ball2.Xpos); 

  diff2 = abs(ball2.Xpos - ball3.Xpos); 

  diff3 = abs(ball3.Xpos - ball1.Xpos);
 
  
  ball1.display();
  ball2.display();
  ball3.display();
  
  if (diff1 < 1.0 && diff2 < 1.0 || diff2 < 1.0 && diff3 < 1.0 || diff3 < 1.0 && diff1 < 1.0)
  {
    //draw still shape
  }
  else if (diff1 < 1.0)
  //if the difference in xpos between ball1 & ball2 is greater than 1 move ball 3
  {
    ball3.move(); 
  }
  else if (diff2 < 1.0) 
  {
    ball1.move(); 
  }
  else if (diff3 < 1.0)
  {
    ball2.move();
  }
  else
  {
  ball1.move(); 
  ball2.move(); 
  ball3.move();
  } 

}

class Ball {
  float Xpos;
  float Ypos;
  float xspeed;
  float yspeed;
  float x = 0;
  float y = 0;
  PImage lamp;
  
  //float diff; 

  Ball(float tempXpos, float tempYpos, float tempXspeed) { // A constructor. 
    Xpos = tempXpos;
    Ypos = tempYpos;
    xspeed = tempXspeed;
    
  }
  void move(){
    Xpos=  random(255); 
    Ypos= random(255); 
  }
  void display() { // Function.
    fill(0);
    stroke(0);  
    ellipse(Xpos,Ypos,20,20);
    fill(random(255));
    stroke(random(255));
    ellipse(Xpos -20,Ypos-6,20,2);
    ellipse(Xpos +20,Ypos-6,20,-2);

  }
}
