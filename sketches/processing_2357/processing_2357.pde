
// Gravity Well
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico

particle[] Z = new particle[1500];
float colour = random(1);
long time = 1;

void setup() {
  smooth();
  size(500,500);  
  background(255);
  
  float r, phi, x, y, xx, yy;
  
  for(int i = 0; i < Z.length; i++) {
    r = random(8)+7;
    phi = random(TWO_PI);
    x = width/2+r*cos(phi);
    y = height/2+r*sin(phi);
    xx = width/2+r*cos(phi+0.1);
    yy = height/2+r*sin(phi+0.1);
    Z[i] = new particle( x, y, 10, findAngle(x-xx,y-yy), 1 );
  }
  
  frameRate(60);

}

void draw() {

  filter(INVERT);
  float r;

  stroke(0);
  fill(255,30);
  rect(0,0,width,height);
  
  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) {
    Z[i].gravitate( new particle( width/2, height/2, 0, 0, 1000 ) );
    Z[i].deteriorate();
    Z[i].update();
    r = float(i)/Z.length;
    //colour = pow( ( sq(Z[i].x-width/2) + sq(Z[i].y-height/2) ) / ( sq(width/2) + sq(height/2) ), 0.1);
    stroke( colour, pow(r,0.1), 1-r, 0.15 );
    Z[i].display();
  }
  colorMode(RGB,255);
  
  time++;
  colour+=random(0.01);
  if( colour > 1 ) { 
    colour = colour%1;
  }
  
  if( time%450 == 0 ) {
    reset();
  }
  
  filter(INVERT);
  
}

void mousePressed() {
  time = 1;
  reset();
}

void reset() {
  float r, phi, x, xx, y, yy;  
  int top = int( random(10)+10 );
  int bottom = int( random(top-5)+5 );
  
  colour = random(1);
  
  for(int i = 0; i < Z.length; i++) {
    r = random(top-bottom)+bottom;
    phi = random(TWO_PI);
    x = width/2+r*cos(phi);
    y = height/2+r*sin(phi);
    if( mouseButton == RIGHT ) {
      xx = width/2+r*cos(phi+0.01);
      yy = height/2+r*sin(phi+0.01);
    }
    else {
      xx = width/2+r*cos(phi+sq(random(1))/5);
      yy = height/2+r*sin(phi+sq(random(1))/5);
    }
    Z[i].reset( x, y, 10, findAngle(x-xx,y-yy), 1 );
  }
  
}


