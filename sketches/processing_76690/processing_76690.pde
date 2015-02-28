
/*****************************************
 * Assignment #4
 * Name:         Erin Penney
 * E-mail:       epenney@brynmawr.edu
 * Course:       CS 110 - Section #1
 * Submitted:    10/23/12
 * 
 * This is a sketch of a school of fish swimming by. When the user clicks, a rectangular boat appears. When the mouse is released, the school of fish returns.
***********************************************/
//define variables
Fish [] f;
int N = 800;

//setup sketch
void setup() {
  size(500, 500);
  smooth();
  background(0,0,255);
  frameRate(5);
  
  f = new Fish [N];
  
  for (int i=0; i<N; i++) {
    f[i] = new Fish(random(20,30), color(random(255), random(255), random(255)));
  }
}

//draw background and fish
void draw() {
  background(0,0,255);
    
    for(int i=0; i<N; i++) {
      f[i].display();
      f[i].move();
    }
  }
  //start Fish class
  class Fish {
  
    float x, y, w;
    float m;
    color c;
    float speed;
    float delta;
    
    Fish (float ww, color cc) {
      x = random(width);
      y = random(height);
      w = ww;
      m = 1;
      delta = random(0.1, 2.0);
      c = cc;
      speed = random(0.5, 2.5);
    }
    
    //move fish
    void move() {
      x = x + m;
      y = y;
      speed = speed;
    }
       
    //animate fish   
    void stepAnimation() {
      if (y > (height-w/2)) {
        speed = speed * -delta;
        y = height-w/2;
      }
      if ((x > (width-w/2)) || (x < w/2))
        m = m * -1;
    }
  
    void display() {
      fill(c);
      noStroke();
      ellipse(x, y, w, w);
    }
}// end of class Fish


//draw random rainbow boat
void mousePressed() {
  background(random(0,255),random(0,255),random(0,255));
  fill(random(0,255),random(0,255),random(0,255));
  rect(mouseX, mouseY, 100,100);
}
