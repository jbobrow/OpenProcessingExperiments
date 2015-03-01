
int MAX = 200;
int time = 0;
Circle[] circles = new Circle[MAX];

void setup(){
  smooth();
  size(800,800);
  for(int i=0; i < MAX; i++) {
     circles[i] = new Circle();
  }
frameRate(12);
}

void draw(){
  background(200,210,255);
  for(int i=0; i < time; i++) {
     circles[i].update(); 
  }
  if(time < MAX) time++;

}

class Circle {
    float x=random(0,width);
    float y=random(0,height);
    float size = 10;
    void update()
    {
      noFill();
      strokeWeight(1);
   stroke(0,y%255,((x+y)/2)%255);
      if( size < 50) ellipse(x,y,size,size);
      else 
      {
        size = 10;
        x=random(0,width);
        y=random(0,height);
      }
      size++;     
    }
}
