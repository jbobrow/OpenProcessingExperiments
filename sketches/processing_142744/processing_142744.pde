


ArrayList<Balls> balls = new ArrayList();

void setup(){
  
  size(400,400);
  smooth();
  background(0);
}

void draw(){
  balls.add(new Balls(random(width),random(height)));
  background(0);
  for(int i =0; i< balls.size(); i++){
    Balls r =balls.get(i);
    r.display();
    r.grow();
    if (r.fade<=0){
      balls.remove(r);
    }
  }
 println(balls.size());
  
}

class Balls{
  float x;
  float y;
  float rSize;
  float fade =255;
  int r=int(random(255));
  int g= int(random(255));
  int b= int(random(255));
  
  Balls(float _x,float _y){
    x = _x;
    y = _y;
  }
  
  void display() {
    stroke(r,g,b,fade);
    fill(r,g,b,fade);
    ellipse(x,y,rSize,rSize);
    
  }
  
  void grow() {
    rSize++;
    fade-=10;
    if(fade <=0){
      fade=0;
    }
  }
}
    
  


