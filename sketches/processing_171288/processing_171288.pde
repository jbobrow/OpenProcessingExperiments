

class Particle
{
  float x, y, y2, vx, vy;

  // keep track of amplitude 
  float amp;

  // keep track of sin wave
  float theta;

  Particle()
  {
    x = 0;
    y = height/2+random(-50, 50);
    vx = 0;
    vy = 0;
    theta = random(0, PI*2);
    amp = 100;
  }

  void update()
  {
    vx+=noise(x*.01, y*.01, frameCount*.01)-.25;
    vy+=noise(y*.01, frameCount*.01+34556, x*.01)-.5;
    vx*=.95;
    vy*=.95;
    x+=vx;
    y+=vy;
  }

  void display()
  {
    theta+=.2;
    float y2 = sin(theta)*amp;
    pushMatrix();
    translate(x, y);
    rotate(atan2(vy, vx));
    noStroke();


    // RED
    fill(random(240, 252), random(0, 3), random(0, 3), random(0, 150));
    ellipse(0, y2, 10, 10);
    
    // ORANGE
    fill(random(240, 245), random(150, 158), random(30, 52), random(0, 150));
    ellipse(0, -y2, 10, 10);
    
    //  YELLOW
    fill(random(240, 245), random(219, 223), random(30, 52), random(0, 150));
    ellipse(0, -y2*.5, 10, 10);
    
    // GREEN
    fill(random(0, 5), random(210, 214), random(100, 119), random(0, 150));
    ellipse(0, y2*2, 10, 10);
    
    // BLUE
    fill(random(0, 5), random(70, 83), random(200, 214), random(0, 150));
    ellipse(0, y2*3, 10, 10);
    
    // PURPLE
    fill(random(100, 131), random(0, 5), random(200, 214), random(0, 150));
    ellipse(0, y2*3, 10, 10);
    
    // WHITE
    fill(255, random(75, 100));
    ellipse(0, y2*4, 10, 10);
    
    popMatrix();
  }
}
ArrayList lines;
Particle p;

void setup()
{
  size(1000, 700);
  lines = new ArrayList();
  background(0);

  p = new Particle();
//  p2 = new Particle();
//  p3 = new Particle();
}

void draw()
{


  p.update();
  p.display();

//  p2.update();
//  p2.display();
//  
//  p3.update();
//  p3.display();
}



