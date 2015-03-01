
//Day 8: classic distance testing
int num = 20;
float[] x1 = new float[num];
float[] y1 = new float[num];  
float[] dx = new float[num];
float[] dy = new float[num];  
int currentFrame = 0;
float distance = 100;
float howFar = 0;

void setup() {
  size(500, 500);

  // initial position in the centre of the screen
  for(int i = 0; i< num; i++){
  x1[i] = 100+i*10;
  y1[i] = 100+i*10;
  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
}

void draw() {
  
  background(0,0,50);
 
  float max = 2;
  float min = 0.5;
 
 //look through line points
  for(int i = 0; i< num; i++){
    // calculate new position
  x1[i] += dx[i];
  y1[i] += dy[i];
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if ( x1[i] > width-100 || x1[i] < 100) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }
  if (y1[i] > height-100 || y1[i] < 100) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }
  stroke(255);
  noFill();
  // exlude the line
  //ellipse(x1[i],y1[i],5,5 );
  }
  
  // loop through distances between all points
  for (int i=0; i<num; i++) {
    for (int j=0; j<i; j++) {
      howFar = dist(x1[i], y1[i], x1[j], y1[j]  );
      if (howFar < distance) {
        stroke(255);
        strokeWeight(2);
        line(x1[i], y1[i], x1[j], y1[j]);
      }
    }
  }
}




