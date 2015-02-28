
// Gravity Swarm
// Claudio Gonzales, March 2010
// Albuquerque, New Mexico

particle[] Z = new particle[8000];
float colour = random(1);
boolean tracer = false;
int depth;

void setup() {
  smooth();
  size(500,500,P2D);  
  depth = width;
  background(255);
  frameRate(25);
  
  float n = 100;
  float px, py, pz;
  float m, v, theta, phi;
  
  for(int k = 0; k < n; k++) {
    px = random(width);
    py = random(height);
    pz = random(depth);
    m = random(50);
    for(int i = int((Z.length-1000)*k/n); i < int((Z.length-1000)*(k+1)/n); i++) {
      v = sq(random(sqrt(m)));
      theta = random(TWO_PI);
      phi = random(TWO_PI);
      Z[i] = new particle( px+v*cos(phi)*cos(theta), py+v*cos(phi)*sin(theta), pz+v*sin(phi), 0, 0, 0, 1 );
    }
  }
  px = width/2;
  py = height/2;
  for(int i = Z.length-1000; i < Z.length; i++) {
    pz = random(depth);
    v = sq(random(sqrt(width/4)));
    theta = random(TWO_PI);
    Z[i] = new particle( px+v*cos(theta), py+v*sin(theta), pz, 0, 0, 0, 1 );
  }

  /*
  for(int i = 0; i < Z.length; i++) {
    r = i/float(Z.length);
    Z[i] = new particle( random(width), r*height, depth/2, 0, 0, 0, 1 );
  }
  */
  
  frameRate(60);

}

void draw() {
  
  colorMode(RGB,255);
  float r;
  
  if( !tracer ) {
    background(0);
  }
  else {
    fill(0,10);
    rect(0,0,width,height);
  }
  
  filter(INVERT);

  for(int i = 0; i < Z.length; i++) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 0.75 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, depth/2, 0, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }

    Z[i].update();
    r = float(i)/Z.length;
    colorMode(HSB,1);
    if( Z[i].magnitude/100 < 0.1 ) {
      stroke( colour, pow(r,0.1), 0.9*sqrt(1-r), Z[i].magnitude/100+abs(Z[i].z/depth)*0.05 );
    }
    else {
      stroke( colour, pow(r,0.1), 0.9*sqrt(1-r), 0.1+abs(Z[i].z/depth)*0.05 );
    }
    Z[i].display();
  }

  colour+=random(0.01);
  colour = colour%1;

  filter(INVERT);
  
}

void keyPressed() {
  
  if( key == ' ' ) {
  
    float r, choice = random(1);
    
    for(int i = 0; i < Z.length; i++) {
      
      r = i/float(Z.length);
  
      if( choice > 0.8 ) {
        // Slice
        Z[i].reset( r*width, r*height, random(depth), 0, 0, 0, 1 );
      }

      else if( choice > 0.6 ) {
        // Plane
        Z[i].reset( random(width), r*height, depth/2, 0, 0, 0, 1 );
      }
      
      else if( choice > 0.4 ) {
        // X
        if( r < 0.5 )
          Z[i].reset( (1-2*r)*width, 2*r*height, 2*r*depth, 0, 0, 0, 1 );
        else
          Z[i].reset( (1-(2*r-1))*width, (1-(2*r-1))*height, (2*r-1)*depth, 0, 0, 0, 1 );
      }
      
      else if( choice > 0.2 ) {
        // Smooth Curve
        Z[i].reset( (1-r)*width, sqrt(r)*height, r*depth, 0, 0, 0, 1 );
      }
  
      else { 
        // Swirl
        Z[i].reset( height/2+r*cos(r*10*PI)*height/2, height/2+r*sin(r*10*PI)*height/2, r*depth, 0, 0, 0, 1 );
      }
    }
  
  }
  else if( key == ENTER ) {
    tracer = !tracer;
  }
    
}




