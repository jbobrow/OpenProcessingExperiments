
float circle1 = 0;
float circle2 = 0;
float center;
int CD = 1;
Sweep Sonar;
Sweep Radar;

 
void setup() {
  size(600,600);
  Sonar = new Sweep(5, 40); // Parameters go inside the parentheses when the object is constructed.
  Radar = new Sweep( 500, 200);

   
}
 
void draw() {
  background(0);
    smooth();
  stroke (100, 255, 100);
  fill (0,0);

  for (int CD=1; CD < 500; CD = CD + 100) { 
  ellipse (300, 300, CD, CD);
  }
  line (0,0, 600, 600);
  line (600,0, 0, 600);
  Sonar.move();
  Sonar.display();
  Radar.move();
  Radar.display();
  
}
 
class Sweep { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?

  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
 
  Sweep(float tempXpos, float tempYpos) { // The Constructor is defined with arguments.

    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = 0.5 + random(2.); 
    yspeed = 0.5 + random(2.); // Every Kar gets a random speed
  }
 
  void display() {
    stroke (255, 0, 0);
    fill (50, 50);
  
    ellipse (xpos, ypos , circle1 , circle1);

    circle1 = circle1 + 1;

    if (circle1 > 10) {
      circle1 = circle1 * -1;
    }
  }
 
  void move() {
    xpos = xpos + xspeed;
    if ((xpos > width) || (xpos < 0)) {
      xspeed = xspeed *-1;
    }
    ypos = random (300, 320);
    
  }
}


