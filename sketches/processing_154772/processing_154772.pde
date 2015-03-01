
//Day 7: Made the line into an array of lines v1

//number of lines
int num = 20;
float[] x1 = new float[num];
float[] y1 = new float[num];  
float[] dx = new float[num];
float[] dy = new float[num];  
int currentFrame = 0;


void setup() {
  size(500, 500);
  //frameRate(60);

  
  for(int i = 0; i< num; i++){
  // initial position in the centre of the screen, random locations within the constrained space
  x1[i] = random(100,width-100);
  y1[i] = random(100,height-100);
  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
  
  //background
  background(0,0,50);
}


void draw() {
  
  // min max speed
  float max = 2;
  float min = 1;
  
  // color of line
  noStroke();
  fill(255,0,50,80);
  
  // loop throuhg the lines array
  for(int i = 0; i< num; i++){
    // calculate new position
  x1[i] += dx[i];
  y1[i] += dy[i];
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if ( x1[i] > width-50 || x1[i] < 50) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }
  if (y1[i] > height-50 || y1[i] < 50) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }
  ellipse(x1[i],y1[i],4,4);
  }

}




