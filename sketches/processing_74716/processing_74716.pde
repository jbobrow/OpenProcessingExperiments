
Ball myBall1;
Ball myBall2;
Ball myBall3;
Ball myBall4;
Ball myBall5;
Ball myBall6;
Ball myBall7;
Ball myBall8;
Ball myBall9;
Ball myBall10;
Ball myBall11;

 
void setup() {
  size(400,600);
  myBall1 = new Ball(200, 600); // Parameters go inside the parentheses when the object is constructed.
  myBall2 = new Ball(200, 600);
  myBall3 = new Ball(200, 600);
  myBall4 = new Ball(200, 600);
  myBall5 = new Ball(100, 600);
  myBall6 = new Ball(300, 600);
  myBall7 = new Ball(300, 600);
  myBall8 = new Ball(300, 600);
  myBall9 = new Ball(100, 600);
  myBall10 = new Ball(300, 600);
  myBall11 = new Ball(100, 600);
  
  
  
  smooth();
   
}
 
void draw() {
  background(0);
  myBall1.move();
  myBall1.display();
  myBall2.move();
  myBall2.display();
  myBall3.move();
  myBall3.display();
  myBall4.move();
  myBall4.display();
  myBall5.move();
  myBall5.display();
  myBall6.move();
  myBall6.display();
  myBall7.move();
  myBall7.display();
  myBall8.move();
  myBall8.display();
  myBall9.move();
  myBall9.display();
  myBall10.move();
  myBall10.display();
  myBall11.move();
  myBall11.display();
  
  
}
 
class Ball { 
  color c;
  float xpos;
  float ypos;
  float yspeed;
  float Goup;
  
  
 
  Ball(float tempXpos, float tempYpos) { 
    c = 0;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = 0.5 + random(1.);     
    
   
  }
 
  void display() {
    noStroke();
    
    
    
    fill(random(100,255),random(130,255),random(100,255),150);
    ellipse(xpos, ypos-(600-ypos)/12 ,30+(600-ypos)/13,30+(600-ypos)/13);
    
    fill(random(100,255),random(130,255),random(100,255),100);
    ellipse(xpos, ypos-(600-ypos)/15 ,30+(600-ypos)/14,30+(600-ypos)/14);
    
    fill(random(100,255),random(130,255),random(100,255),80);
    ellipse(xpos, ypos-(600-ypos)/25 ,30+(600-ypos)/15,30+(600-ypos)/15);
    
    fill(random(100,255),random(130,255),random(100,255),70); 
    ellipse(xpos, ypos, 30+(600-ypos)/19,30+(600-ypos)/19);
    
    

  }
 
  void move() {
    ypos = ypos - yspeed;
    if (ypos < width/1000) {
      ypos = 600;

    }
    
  }
}


