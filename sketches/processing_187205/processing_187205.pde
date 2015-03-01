
int numSnowFlakes = 50;
snowFlake[] snowFlakes = new snowFlake[numSnowFlakes];
float snowAngle = PI/3;
float maxRadius = 50;
float snowBraRot = PI/3;

void setup(){
  size(1280, 600);
  smooth();
  frameRate(15);
  for(int i = 0 ; i < numSnowFlakes; i++){
    int c = color(random(200, 255), random(64, 255));
    snowFlakes[i] = new snowFlake(random(0, width), random(-50, height/2), random(0, PI/6), random(0, maxRadius), int(random(2, 4)), random(3, 10), random(PI/360, PI/24), c, i);
  }
}
void draw(){
  background(200, 0);
  for(int j = 0; j < numSnowFlakes; j++){
    snowFlakes[j].display();
    snowFlakes[j].move();
    snowFlakes[j].update();
  }
  //saveFrame("flames/####.tif");
}

class snowFlake{
  float posx, posy;
  float posa = -PI/2; 
  float radius;
  int branchTimes;
  float speedy;
  int idno;
  float speedr;
  color clr; 
  
  snowFlake(float x, float y, float a, float r, int bt, float sy, float sr, color c, int id){
    posx = x;
    posy = y;
    posa = a;
    radius = r;
    branchTimes = bt;
    speedy = sy;
    speedr = sr;
    clr = c;
    idno = id;
  }
  
  void move(){
    posx = posx;
    posy += speedy;
    posa += speedr;
  };
  
  void update(){
    if(posy >= height+radius){
      int c = color(random(200, 255), random(64, 255));
      snowFlakes[idno] = new snowFlake(random(0, width), random(0, height/2), random(0, PI/6), random(0, maxRadius), int(random(2, 4)), random(3, 10), random(PI/360, PI/24), c, idno);
    }
  };
  
  void display(){
    pushMatrix();
    translate(posx, posy);
    rotate(posa);
    stroke(clr);
    strokeWeight(6*(radius/maxRadius));
    for(int k = 0; k <= 5; k++){
      branch(radius, branchTimes);
      rotate(snowAngle);
    }
    popMatrix();
  }
  
  void branch(float r, int bt){
    line(0, 0, r/bt, 0);
    pushMatrix();
    for(int l = 0; l < bt-1; l++){
      translate(r/bt, 0);
      rotate(-snowBraRot);
      line(0, 0, r/(bt+1), 0);
      rotate(snowBraRot*2);
      line(0, 0, r/(bt+1), 0);
      rotate(-snowBraRot);
      line(0, 0, r/(bt), 0);
    }
    popMatrix();
    
  }
  
}


