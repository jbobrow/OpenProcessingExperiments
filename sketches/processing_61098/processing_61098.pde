
//HW 7 - Sarah Lesnikoski


Tube[] days = new Tube[3285]; //3,285 days = 9 years
void setup() {
  size(1100,800);
  smooth();
  
  
  for (int i = 0; i < days.length; i++) {
    days[i] = new Tube(color(i*2),0,i*2,i/2.0);
  }
}
  
void draw() {
 background(255);  
 for (int i = 0; i < days.length; i++) {
    days[i].move();
    days[i].display();
  }
}

class Tube {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Tube(color c_, float xpos_, float ypos_, float xspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  }
  
void display() {
  rectMode(CENTER);
  stroke(500);
  fill(c);
  rect(xpos,ypos,240,180);
  ellipseMode(CENTER);
  noStroke();
  fill(234,234,234,65);
  ellipse(xpos,ypos,28,28);
  rectMode(CENTER);
  stroke(30);
  fill(142,120,220,10);
  rect(xpos,ypos,215,150);
   
  
}

void move() {
  xpos = xpos + xspeed;
  if (xpos > width) {
    xpos = 0;
  }
 }
}


/* Learned code from 'Circe circles' notes from class and Learning Processing 
by Daniel Shiffman. */

