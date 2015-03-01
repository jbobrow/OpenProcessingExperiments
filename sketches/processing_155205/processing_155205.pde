
//Day 12: kinda 2001 space odessy day

int num = 20;
int numShapes = 5;
float x;
float y;
float pulse = 10;
float degrees = 0;
float growthSpeed = 1;
float growthDirection = 1;
float base = 50;


void setup() {
  size(500, 500);
}

void draw() {
  noStroke();
  fill(0,0,50, 100);
  rect(0,0,width,height);
  // match rotation to frameCount
  degrees = frameCount/2;
  // pulsing to creative movement for the x of the curve
  pulse = pulse + (growthSpeed * growthDirection);
  //stroke pulse
  if(pulse > 500 || pulse < 1){
    growthDirection *= -1;
  } 
  
  float baseAdd = 0;
  for(int i = 0; i < numShapes; i++){
  flower(base+ baseAdd, base/2);
  baseAdd = baseAdd + width/numShapes;
  }

 
}

void flower(float posX1, float posY1){
    strokeWeight(3);
  //look through line points
  for(int i = 0; i< num; i++){
    if(i % 2 == 0){
      stroke(255,0,50);
    } else if(i % 3 == 0){
      stroke(255,80,50,80);
  } else{
      stroke(255,200,150,80);
    }

  // generate 2nd point in a circle, distributed by num of points
  float angle=TWO_PI/(float)num;
  float baseRadius= 500;
  x = baseRadius*sin(angle*i+radians(degrees));
  y = baseRadius*cos(angle*i+radians(degrees));
  
  //positioning
  x = x + posX1;
  y = y + posY1; 
  
  line(x,y+pulse,width/2,height/2);
  
  }
}




