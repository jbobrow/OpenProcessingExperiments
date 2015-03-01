
// question 5
Ball[] ball;

boolean pause = false;

void setup(){
  ball = new Ball[3];
  for(int i = 0; i < 3; i++)
    ball[i] = new Ball();
  size(500,500);
}

void draw(){
  if(!pause){
    background(174);
    for(int i = 0; i < ball.length; i++){
      ball[i].display();
    }
    for(int i = 0; i < ball.length; i++){
      for(int j = 0; j < ball.length; j++){
        if(i != j){
          if (ball[i].intersect(ball[j])) { 
            color c = color(random(255),random(255),random(255));
            ball[i].reset(c);
            ball[j].reset(c);
          }
        }
      }
    }
    for(int i = 0; i < ball.length; i++)
      ball[i].r++;
  }
}

void mousePressed(){
  pause = !pause;
}

void keyPressed(){
  Ball b = new Ball();
  ball = (Ball[]) append(ball, b);
}
class Ball{
  float x;
  float y;
  int r;
  color c;
  Ball(){
    x = random(width);
    y = random(height);
    c = color(random(255),random(255),random(255));
  }
  
  void display(){
    fill(c);
    noStroke();
    ellipse(x,y,2*r,2*r);
  }
  
  boolean intersect(Ball b){
    if(dist(x,y,b.x,b.y)<(r+b.r))
      return true;
    else
      return false;
  }
  
  void reset(color w){
    c = w;
    x = random(width);
    y = random(height);
    r = 0;
  }
  
}


