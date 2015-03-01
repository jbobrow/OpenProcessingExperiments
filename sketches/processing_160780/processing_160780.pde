
int numObj = 10;
int passes = 10;

// The width and height of the boxes
float boxW = 40;
float boxH = 40;

void setup() {
  size(700,700);
  smooth();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  //noFill();
  //stroke(0);
  ellipse(0,0,width-50,height-50);
  rings();
}

void rings()
{
  int r = 50; //controls the width of the ingredient ring (aka radius of ring?)
  int ingredient = 0;  
  //int numObj = 10;
  // We must keep track of our position along the curve
  float arclength = 0;
  // For every box
  for(int j = 0; j<passes;j++)
  {
    for (int i = 0; i < numObj; i++) {
      // Each box is centered so we move half the width
      arclength += boxW/2; 
      
      // Angle in radians is the arclength divided by the radius
      float theta = arclength / r;
      
      pushMatrix();
      // Polar to cartesian coordinate conversion
      translate(r*cos(theta) , r*sin(theta));
      // Rotate the box
      rotate(theta); //change to random
      
      //switch statement for ingredient selection
      
      //draw ingredient
      
      
      // Display the box
      fill(0, 100);
      rectMode(CENTER);
      rect(0, 0, boxW, boxH);
      popMatrix();
      
      // Move halfway again
      arclength += boxW/2;
      
    }
    ingredient++;
    r = int(random(50,width-70));
    numObj = r/10;
    
  }
}
