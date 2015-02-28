
int numCircles = 1000;
float [] circleX = new float [numCircles];
float [] circleY = new float [numCircles];
float [] vel = new float[numCircles];
int [] r = new int[numCircles];
int [] b = new int[numCircles];
int [] g = new int[numCircles];
boolean [] back = new boolean [numCircles];
float rad[] = new float[numCircles];



void setup(){
  size(750, 750);
  smooth();
  noStroke();
  frameRate(30);
  
  for(int i =0; i<numCircles; i++){
    circleX[i] = random(0, width);
    circleY[i] = random(0, height);
    vel[i] = 5;
    back[i] = false;
    rad[i] = random(10, 30);
    
  }
}

void draw(){
 background(121, 181, 200);
  for(int i = 0; i<numCircles; i++){
  
  
    bounce(i);
    make(i);

  }
}

void make(int i){
  if(back[i] == true){
    
    fill(100, 23, 62);
     noStroke();
  ellipse(circleX[i], circleY[i], rad[i], rad[i]);
  }
  else{
  fill(255, 0, 127);
  noStroke();
  ellipse(circleX[i], circleY[i], rad[i], rad[i]);
  }
}

void bounce(int i){

  if (circleX[i] < 0 || circleX[i] > height){
    vel[i] *= -1;
    back[i] = !back[i];
    
  }
    
    circleX[i] += vel[i];
}
