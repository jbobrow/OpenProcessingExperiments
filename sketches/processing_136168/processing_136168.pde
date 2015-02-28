
//global variables
float radius = 50.0;
int X, Y; //ellipse
int nX, nY; //ellipse
int delay = 9; //delay effect
int num = 60;
float mx[] = new float[num];
float my[] = new float [num];
int r, g, b; //colors for background


// setup the processing canvas
void setup() {
  size(400, 400);
  strokeWeight(10);
  frameRate(15); 
  X = width/2;
  Y = height/2;
  nX = X; 
  nY = Y;
  r = 0;
  g = 0;
  b = 0;


  
}

//main draw loop 
void draw () {
  
  radius = radius + sin( frameCount /4);
  //track cricle to new destination
  X+=(nX-X)/delay; //delay effect
  Y+=(nY-Y)/delay; //delay effect
  
  background(r, g, b); //color
  fill(r, 100, b); //color
  stroke(255);
  ellipse(X, Y, radius, radius); //shape
  for(int i =1; i<num; i++) {
    mx[i-1] = mx[i];
    my[i-1] = my[i];
  }
  
  mx[num-1] = mouseX;
  my[num-1] = mouseY;
  
  for(int i=0; i<num; i++) {
    ellipse(mx[i], my[i], i/2, i/2);
  }
}

void keyPressed() {
 r = int(random(256)); //pressing any key will bring out random colors
 g = int(random(256));
 b = int(random(256));
}


void mouseMoved() {
  nX = mouseX; // interactive 
  nY = mouseY;
} 








