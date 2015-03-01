
Pendul [] p;

int amount = 400;

void setup(){
  //colorMode(HSB, 1.0);
  
  size(1080,720);
  smooth();
  noStroke();
  p= new Pendul[amount];
  for (float i=0;i<amount;i++){
    p[int(i)]=new Pendul(0.0001*i+0.0008,(width/amount)*i,(i/50.0)-floor(i/50.0));
  }
  fill(200);
  
}

bool shouldUpdate = true;

void draw(){
  background(200,255,200);
  for (int i=0;i<amount;i++){
    if (shouldUpdate){
      p[i].osc();   
    }
    p[i].display();
  }
}


void mouseClicked() {
    shouldUpdate = !shouldUpdate
}


class Pendul
{
  float angle;
  float speed,posy;
  float hue;
  
  Pendul(float speed_,float posy_,float hue_){
    angle=0;
    posy=posy_;
    speed=speed_;
    hue=hue_;
  }
  void osc()
  {
    angle+=speed;
  }
  void display()
  {
    fill(hue*255,0,(1-hue)*255);
    float w = (cos(angle)+1.1)*0.45;
    ellipse(w*width,posy,20,20);
  }
}
