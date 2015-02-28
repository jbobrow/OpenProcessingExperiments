
Ball [] balls = new Ball [6];


void setup(){
  size (500,700);
  background(255);
  for (int i = 0; i < balls.length; i++){
    balls[i] = new Ball( i * 50,int( random(5,50)*i),int( random(5,50)*i), i*20);
  }
}

void draw(){
  for(int i = 0; i < balls.length; i++){
    balls[i].display();
   
  }
}
class Ball{
  int x;
  int y;
  int w;
  int h;
  int s;
  color c;
  
  Ball (int x_, int w_, int h_, color c_){
    x= x_;
    w = w_;
    h = h_;

    c = c_;
    y = 100;
  }
  
  void display(){
    fill(c);
    ellipse(x,y,w,h);
  }
  
  void move(){
    y = y+s;
  }
  
  void g(){
    s = int(random(1,4));
  }
}


