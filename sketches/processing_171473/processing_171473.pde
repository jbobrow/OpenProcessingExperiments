
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;

void setup () {
  size(600, 600);
  smooth();
  
  ball1 = new Ball(64);
  ball2 = new Ball(32);
  ball3 = new Ball(100);
  ball4 = new Ball (150);
  
}

void draw() {
  
  background(0);
  
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int d = day();    // Values from 1 - 31
  int o = month();  // Values from 1 - 12
  int y = year();   
  
  String st = String.valueOf(d);
  text(st, mouseX-20, mouseY);
  st = String.valueOf(o);
  text(st, mouseX, mouseY); 
  st = String.valueOf(y);
  text(st, mouseX+20, mouseY);
  
  String st2 = String.valueOf(s);
  text(s, mouseX-20, mouseY-20);
  st = String.valueOf(o);
  text(m, mouseX, mouseY-20); 
  st = String.valueOf(y);
  text(h, mouseX+20, mouseY-20);
   
  //left side
  line(s, mouseX, s, mouseY);
  stroke(255);
  line(m, mouseX, m, mouseY);
  stroke(255);
  line(h, mouseX, h, mouseY);
  stroke(255);
  
  //top
  line(mouseX, s, mouseY, s);
  stroke(255);
  line(mouseX, m, mouseY, m);
  stroke(255);
  line(mouseX, h, mouseY, h);
  stroke(255);
  
  //right side
  line(s+500, mouseX, s+500, mouseY);
  stroke(255);
  line(m+500, mouseX, m+500, mouseY);
  stroke(255);
  line(h+500, mouseX, h+500, mouseY);
  stroke(255);
  
  //bottom
  line(mouseX, s+500, mouseY, s+500);
  stroke(255);
  line(mouseX, m+500, mouseY, m+500);
  stroke(255);
  line(mouseX, h+500, mouseY, h+500);
  stroke(255);
  
  ball1.move();
  ball2.move();
  ball1.display();
  ball2.display();
  ball3.move();
  ball3.display();
  ball4.move();
  ball4.display();
  
}
class Ball {
  float r; //radius
  float x, y;  //location
  float xspeed, yspeed;  //speed
  
  //constructor
  Ball (float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random(-5, 5);
    yspeed = random(-5, 5);
  }
  
  void move() {
    x += xspeed;  //Increment x
    y += yspeed;  //Increment y
    
    //Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= -1;
    }
    //check vertical edges
    if (y > height || y < 0) {
      yspeed *= -1;
    }
  }
  
  //draw the ball
  void display() {
    stroke(255);
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}


