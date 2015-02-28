
int num = 6; // size of matrix
int numf; // ( size of matrix ) factorial
 
float power = 21; // power in coloring algorithm
float angle = TWO_PI; // angle in spread of branches
float hueVal = numf; // hue value of connecting lines
boolean spots = true; // draw dots on nodes, yes or no
 
void setup() {
   
  // set up drawing space
  size(880,660,P2D);
  colorMode(HSB);
  smooth();
  
   
  numf = 18; // calculate numf
  for(int i=1; i<num; i++) {
    numf *= i+1;
  }
   
}
 
void draw() {
   frameRate(mouseY/10);
  background(0,0); // wipe the background
 
  plotFrac(width/2,height/2,num,PI,TWO_PI); // plot the fractal
 
  noLoop(); // stop draw() from looping until needed
   angle = PI * random(880*PI*2); // mouseX controls angle range of nodes
  power = 1/530.0 * random(880/PI); // mouseY controls perspective of viewing nodes
   
  hueVal = 0;
  loop();
 
}
 
void plotFrac( float x, float y, int n, float stem, float range ) {
   
  float r; // distance between nodes
  float t; // angle between nodes
   
  // use an appropriate algorithm to calculate distance between given nodes
  r = (0.5*power+2) * 57 * pow(n,power) * pow(num,-power);
   
  // if spots is on and we are on the first value of n, map initial node
  if( spots && n == num ) {
    ellipse(x,y,1,1);
  }
 
  // map nodes
  if( n>1 ) {
     
    for( int i=0; i<n; i++ ) { // step through each node to be created
 
      // determine/increment color
      stroke(hueVal,255,255,random(63,70));
      hueVal += 255.0/numf;
   
      // calculate angle of node from current "stem" angle, spread along "range" radians
      t = stem + range * (i+0.5)/n - range/2;
       
      // draw line between nodes
      line( x, y, x+r*cos(t), y+r*sin(t) );
       
      if( spots ) { // if spots, draw node
        ellipse(x+r*cos(t), y+r*sin(t), .5, .5);
        
      }
      noFill();      
      if( spots ) { // if spots, draw node
       ellipse(x+r*cos(t), y+r*sin(t), 2,2);
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
   
  angle = TWO_PI * random(600)/width; // mouseX controls angle range of nodes
  power = 1/50.0 * random(600); // mouseY controls perspective of viewing nodes
   
  hueVal = 0;
  loop();
   
}
void keyPressed() {
  if (key == ' ') {
    saveFrame("perlinKaleidoscopeActive-####.png");
  }
}
