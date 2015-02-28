

int num = 6; // size of matrix
int numf; // ( size of matrix ) factorial

float power = 4; // power in coloring algorithm
float angle = TWO_PI; // angle in spread of branches
float hueVal = 0; // hue value of connecting lines
boolean spots = true; // draw dots on nodes, yes or no

void setup() {
  
  // set up drawing space
  size(640,640,P2D);
  colorMode(HSB);
  smooth();
  
  numf = 1; // calculate numf
  for(int i=1; i<num; i++) {
    numf *= i+1;
  }
  
}

void draw() {
  
  background(0); // wipe the background

  plotFrac(width/2,height/2,num,PI,TWO_PI); // plot the fractal

  noLoop(); // stop draw() from looping until needed

}

void plotFrac( float x, float y, int n, float stem, float range ) {
  
  float r; // distance between nodes
  float t; // angle between nodes
  
  // use an appropriate algorithm to calculate distance between given nodes
  r = (0.5*power+2) * 25 * pow(n,power) * pow(num,-power);
  
  // if spots is on and we are on the first value of n, map initial node
  if( spots && n == num ) {
    ellipse(x,y,n+2,n+2);
  }

  // map nodes
  if( n>1 ) {
    
    for( int i=0; i<n; i++ ) { // step through each node to be created

      // determine/increment color
      stroke(hueVal,255,255,100);
      hueVal += 255.0/numf;
  
      // calculate angle of node from current "stem" angle, spread along "range" radians
      t = stem + range * (i+0.5)/n - range/2;
      
      // draw line between nodes
      line( x, y, x+r*cos(t), y+r*sin(t) );
      
      if( spots ) { // if spots, draw node
        ellipse(x+r*cos(t), y+r*sin(t), n+2, n+2);
      }

      // spread nodes across PI radians
      // plotFrac(x+r*cos(t),y+r*sin(t),n-1,t,PI);
      
      // spread nodes across "angle" radians
      plotFrac(x+r*cos(t),y+r*sin(t),n-1,t,angle);
    }
    
  }
  
}

void keyReleased() { // update draw() when key is released
  
  if( key == CODED ) {
    
    if( keyCode == RIGHT && num < 8 ) { // increase matrix size by 1
      num++;
    }
    else if( keyCode == LEFT && num > 2 ) { // decrease matrix size by 1
      num--;
    }
    
    // calculate (matrix size)! again
    numf = 1;
    for(int i=1; i<num; i++) {
      numf *= i+1;
    }
    
  }
  else if( key == ' ' ) { // toggle drawing nodes option when spacebar is pressed
    spots = !spots;
  }
  
  hueVal = 0; // reset hue for new draw
  loop(); // reinitialize draw() to update fractal. 
}

void mouseMoved() {
  
  angle = TWO_PI * mouseX/width; // mouseX controls angle range of nodes
  power = 1/50.0 * mouseY; // mouseY controls perspective of viewing nodes
  
  hueVal = 0;
  loop();
  
}

