
/* based on Nick Senskes particle demo code...altered 
to make a skyline type effect */


Particle p;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  p = new Particle(0,height/2,width,0,0);
}

void draw() {
  frameRate(35);
  
  fill(0,random(0,255),random(0,255),5); //sets background color to change constantly to a random hue of blue
  rect(0, 0, width, height);
  p.update();
  p.display();
}

void mousePressed(){
  p.x = 0;
  p.y = height/2; //sets the start point of drawing at hieght/2
  p.vx = random(50); //give ths velocity that the drawing travels at to a randome speed between 5-50
  p.vy =0; //y velocity is 0...no vertical movement
  p.width2 = random(5,75); //defines the width of the rectangles
}

class Particle {
  float x, y; 
  float vx, vy; 
  float width2; 


  Particle(int xpos, int ypos, float velx, float vely, float w) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    width2 = w;
  }

  void update() {
 
    y += vy;
    x += vx;
  }

  void display() {
    fill(random(175),0,0);
    rect(x,y,-random(width2),-random(width2));
  }
}

