

void branch(float startX, float startY, float theta, int w){
  float newtheta = theta+=random(-.4,.4);
  int distance = int(random(20,50));
  float newX = startX+(distance*cos(newtheta));
  float newY = startY+(distance*sin(newtheta));
  strokeWeight(w);

  stroke(int(random(150,255)));

  line(startX, startY, newX,newY);
  w--;
  if(w>0){
    int numBranches = int(random(1,5));
    while(numBranches >0){
      branch(newX, newY, newtheta, w);
      numBranches--;
    }
  }
  else return;
}



void setup(){
  size(800,600);
  background(0);
  noLoop();
}


void draw(){
  smooth();
  background(0);
  int sw = 8;
  int x = 0;
  while (x<width){
    branch(x, height, -PI/2, sw);
    //branch(x, 0, PI/2, sw);
    x+=100;
  }
  
}






