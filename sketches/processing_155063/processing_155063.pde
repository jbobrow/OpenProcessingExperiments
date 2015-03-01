
//Day 11: making monsters into flowers v2

int num = 15;
float x;
float y;
float[] x1 = new float[num];
float[] y1 = new float[num];  
float[] dx = new float[num];
float[] dy = new float[num];  
float pulse = 10;
float degrees = 0;
float growthSpeed = 1;
float growthDirection = 1;

void setup() {
  size(500, 500);
  strokeWeight(3);
}

void draw() {
  
  noStroke();
  fill(80);
  rect(0,0,width,height);
  fill(255,10,50);
  stroke(224,204,20);
  
  // base degrees on frame count
  degrees = frameCount;
  
  // pulsing to creative movement for the x of the curve
  pulse = pulse + (growthSpeed * growthDirection);
  //stroke pulse
  if(pulse > 250 || pulse < 1){
    growthDirection *= -1;
  } 
  
 //look through line points
  for(int i = 0; i< num; i++){

  // generate 2nd point in a circle, distributed by num of points
  float angle=TWO_PI/(float)num;
  float baseRadius= 100;
  x = baseRadius*sin(angle*i+radians(degrees));
  y = baseRadius*cos(angle*i+radians(degrees));
  
  //positioning
  x = x + width/2;
  y = y + height/4; 

  x1[i] = width/2;
  y1[i] = 125;
   
  // draw curvy lines
  curve(x1[i], y1[i]+pulse, x1[i],y1[i]+pulse, x, y+baseRadius, x, y+baseRadius-pulse*3);
  }
}




