
Pendul [] p;

int amount = 200;

void setup(){
  smooth();
  size(200,200);
  p= new Pendul[amount];
  for (float i=0;i<amount;i++){
    p[int(i)]=new Pendul(0.0005*i+0.004,i);
  }
  fill(200);
  
}

void draw(){
  background(255);
  for (int i=0;i<amount;i++){
    p[i].osc();
    p[i].display();
  }
}


class Pendul
{
  float angle;
  float speed,posy;
  
  Pendul(float speed_,float posy_){
    angle=0;
    posy=posy_;
    speed=speed_;
  }
  void osc()
  {
    angle+=speed;
  }
  void display()
  {
    float w = (cos(angle)+1)*0.5;
    ellipse(w*width,posy,10,10);
  }
}
