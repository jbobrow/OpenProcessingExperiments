
// Gravity Swarm
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico

particle[] Z = new particle[6000];
float colour = random(1);

void setup() {
  smooth();
  size(500,500,P2D);  
  background(255);
  
  for(int i = 0; i < Z.length; i++) {
    Z[i] = new particle( random(width), random(height), 0, 0, 1 );
  }
  
  frameRate(60);
  colorMode(RGB,255);

}

void draw() {
  
  filter(INVERT);

  float r;

  stroke(0);
  fill(0);
  rect(0,0,width,height);
  
  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, 0, 0, 1 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }
    Z[i].update();
    r = float(i)/Z.length;
    stroke( colour, pow(r,0.1), 1-r, Z[i].w);
    Z[i].display();
  }
  colorMode(RGB,255);
  
  colour+=random(0.01);
  if( colour > 1 ) { 
    colour = colour%1;
  }

  filter(INVERT);
  
}



