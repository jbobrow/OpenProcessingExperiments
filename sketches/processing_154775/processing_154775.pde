
//Day 7, second line array version, 
//with odd and even allocation of color and size differences

//number of lines
int num = 20;
float[] x1 = new float[num];
float[] y1 = new float[num];  
float[] dx = new float[num];
float[] dy = new float[num];  
int currentFrame = 0;


void setup() {
  size(500, 500);
  
  // run through the lines array
  for(int i = 0; i< num; i++){
  // initial position in the centre of the screen within the constrained space
  x1[i] = width/2;
  y1[i] = height/2;
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
  // allocate different color and size to odds and evens in the array
  if(i % 2 == 0){
     fill(185,7,43,70);
     size = 6;
  }else{
      fill(220,220,232,70);
      size = 4;
  }
  ellipse(x1[i],y1[i],4,4);
  }

}




