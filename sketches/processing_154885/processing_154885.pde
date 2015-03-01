
//Day 9: making a monster of distances from day 8's sketch with an additional point location in a circle

int num = 20;
float x;
float y;
float[] x1 = new float[num];
float[] y1 = new float[num];  
float[] dx = new float[num];
float[] dy = new float[num];  
float pulse = 10;
float growthSpeed = 1.0;
float growthDirection = 1;
int currentFrame = 0;
float distance = 400;
float howFar = 0;

void setup() {
  size(500, 500);
  noFill();
  strokeWeight(3);
  // initial position in the centre of the screen
  for(int i = 0; i< num; i++){
  x1[i] = width/2;
  y1[i] = 100;
  // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
  }
}

void draw() {
  
  background(0,0,50);
  
  // pulsing to creative movement for the x of the curve
  pulse = pulse + (growthSpeed * growthDirection);
  //stroke pulse
  if(pulse > width || pulse < 1){
    growthDirection *= -1;
  } 
 
  float max = 2;
  float min = 0.5;
 //look through line points
  for(int i = 0; i< num; i++){
 // calculate new position
  x1[i] += dx[i];
  y1[i] += dy[i];
 //When the point hits the edge of the window, it reverses its direction and changes velocity
  if ( x1[i] > width-100 || x1[i] < 100) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }
  if (y1[i] > height-100 || y1[i] < 100) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }

  // generate 2nd point in a circle, distributed by num of points
  float angle=TWO_PI/(float)num;
  float baseRadius= 50;
  x = baseRadius*sin(angle*i);
  y = baseRadius*cos(angle*i);
  
  // shift curve on the y and stroke color based on distance
  float curves = 0;
  howFar = dist(x1[i], y1[i], x, y);
      if (howFar < distance) {
       stroke(240,10,80);
       curves = 20;
      } 
      if (howFar > distance)  {
        stroke(180);
        
      } 
  // draw curvy lines
  curve(x1[i]+pulse, y1[i], x1[i],y1[i], x+width/2, y+baseRadius+20, x+width/2, y+baseRadius+20-(pulse+curves));
  }
 
}




