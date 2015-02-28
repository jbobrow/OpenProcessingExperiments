
Ball redBall;
Ball greenBall;
Ball blueBall;


void setup() {
   size(600,600);
   background(255);
   redBall = new Ball(color(255,100,100),width/4,height/2,2);
   greenBall = new Ball(color(100,255,100),width/2,height/2,2);
   blueBall = new Ball(color(100,100,255),width-width/4,height/2,2);
  
}

void draw() {
  noStroke();
  background(30,30,30);
  redBall.bounce();
  redBall.display();
  greenBall.bounce();
  greenBall.display();
  blueBall.bounce();
  blueBall.display();
  
}

class Ball {
   color c;
   float xpos;
   float ypos;
   float ybounce;
   
   Ball(color tempC, float tempXpos, float tempYpos, float tempYbounce) {
       c = tempC;
       xpos = tempXpos;
       ypos = tempYpos;
       ybounce = tempYbounce;
   }
   
   void display() {
       fill(c);
       ellipse(xpos, ypos, 100, 100);
   }
   
   void bounce() {
       ypos = ypos + ybounce;
       if (ypos+50 > height) {
       ybounce = ybounce-1;
       };
       if (ypos-50 < 0) {
       ybounce = ybounce+5;
       };
   }
  
}


