
// Two snake objects
Snake s0;
Snake s1;

void setup() {
  size(500,500);
  smooth();
  // Start
  s0 = new Snake(50);
  //s1 = new Snake(25);
}

void draw() {
  // background(280,0,180,150);

  float r = 100;
  float g = 150;
  float b = 200;
  float a = 200;

  float diam = 50;
  float x = 100;
  float y = 100;


  //Fill all variables with random values
  r= random (255);
  g= random (255);
  b= random (255);
  a= random (255);
  diam = random (50);
  x = random (width);
  y = random(height);

  //Use values to draw an ellipse
  noStroke ();
  // fill (r,g,b,a);
  //ellipse (x,y,diam,diam);

  if (mousePressed) {
    fill(250,250,160);
    ellipse (x,y,diam,diam);
  }
  else {
    fill(250,250,160);
    //ellipse (x,y,diam,diam);
  }

  // Update and display
  s0.update(mouseX-30,mouseY);
  s0.display();

  // Update and display
  // s1.update(mouseX+30,mouseY);
  //s1.display(); 

  // Probabilities for 3 different cases
  float purple_prob = 0.40;	// 40% chance of purple color
  float pink_prob = 0.30; // 30% chance of pink color
  float blue_prob = 0.30; // 30% chance of blue color

  float num = random(1);	

  // If random number is less than .6 
  if (num < purple_prob) {
    fill(150,15,30,100); 
    // If random number is between .6 and .7
  } 
  else if (num < pink_prob + purple_prob) {
    fill(280,0,180,100); 
    // Other ( between .7 and 1.0)
  } 
  else {
    fill(10,52,178,100);
  }
  ellipse(random(width),random(height),64,64);
}

class Snake {
  // x and y positions
  int[] xpos;
  int[] ypos;

  // The length of the snake
  Snake(int n) {
    xpos = new int[n];
    ypos = new int[n];
  }

  void update(int newX, int newY) {
    // xpos[0] = xpos[1], xpos[1] = xpos = [2] etc.
    for (int i = 0; i < xpos.length-1; i ++ ) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }

    // Update the last spot with the mouse location.
    xpos[xpos.length-1] = newX;
    ypos[ypos.length-1] = newY;
  }

  void display() {
    // Draw everything
    for (int i = 0; i < xpos.length; i ++ ) {
      // Draw an ellipse for each
      stroke(0);
      fill(110,25,280);
      ellipse(xpos[i],ypos[i],i,i);
    }
  }
}


