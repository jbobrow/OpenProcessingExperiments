
// Gravity Swarm II
// Claudio Gonzales, July 2009
// Albuquerque, New Mexico

particle[] Z = new particle[10000];
float colour = random(1);
boolean tracer = false;
boolean night = true;

void setup() {
  smooth();
  size(500,500,P2D);  
  background(255);
  frameRate(30);
  
  float r;
  float phi;
  
  for(int i = 0; i < Z.length; i++) {
        
    r = sqrt( random( sq(width/2) + sq(height/2) ) );
    phi = random(TWO_PI);
    Z[i] = new particle( r*cos(phi)+width/2, r*sin(phi)+height/2, 0, 0, random(2.5)+0.5 );
  }
  
}

void draw() {

  float r;

  if( night )
    filter(INVERT);

  if( tracer ) {
    stroke(255,100);
    fill(255,100);
    rect(0,0,width,height);
  }
  else {
    background(250);
  }
  
  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, 0, 0, 50 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, 0, 0, 50 ) );
    }
    Z[i].deteriorate();
    Z[i].update();
    r = float(i)/Z.length;
    if( sq(Z[i].magnitude)/50 < 0.15 ) {
      stroke( colour, pow(r,0.1), 1-r, sq(Z[i].magnitude)/50 );
    }
    else {
      stroke( colour, pow(r,0.1), 1-r, 0.15 );
    }
    
    //if( i < Z.length-1 )
      //line( Z[i].x, Z[i].y, Z[i+1].x, Z[i+1].y );
    Z[i].display();
  }
  
  colorMode(RGB,255);
  
  colour+=random(0.01);
  if( colour > 1 ) { 
    colour = colour%1;
  }
  
  if( night )
    filter(INVERT);
  
}

void keyPressed() {
  if( keyCode == ENTER ) {
    tracer = !tracer;
    background(255);
  }
  if( keyCode == SHIFT ) {
    night = !night;
  }
}


