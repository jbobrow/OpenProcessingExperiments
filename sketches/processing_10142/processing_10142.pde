
Ball [] balls = new Ball[60];

void setup(){
  size(578,396);
  smooth();
  for(int i = 0; i < balls.length; i++){
    balls [i] = new Ball (random(i+10,100),random(100,150)*i,random(25,35),random(70,75),random(17,156),random(20,95),0.005);
  }
}

void draw(){
  fill(25,50);
  rect(0,0,width,height);
  for(int i = 0; i < balls.length; i++){
  balls[i].display();
  balls[i].move();
  
  }
}

class Ball{
  float xtime;
  float ytime;
  float x2time;
  float y2time;
  float x3time;
  float y3time;
  float increment;
  Ball (float xtime_,float ytime_,float x2time_,float y2time_,float x3time_,float y3time_,float increment_){
    xtime = xtime_;
    ytime = ytime_;
    x2time = x2time_;
    y2time = y2time_;
    x3time = x3time_;
    y3time = y3time_;
    increment = increment_;
  }
  
  void display(){
    float x = noise(xtime)*550;
    float y = noise(ytime)*400;
    float x2 = noise(x2time)*650;
    float y2 = noise(y2time)*470;
    float x3 = noise(x3time)*450;
    float y3 = noise(y3time)*300;
    


    noStroke();
    fill(x,y,x3,y2);
    beginShape(TRIANGLES);
    
    vertex(x,y);
    vertex(x2,y2);
    vertex(x3,y3);

    endShape();
 
  }
  void move(){
    xtime = xtime+increment;
    ytime = ytime+increment;
    x2time = x2time+increment;
    y2time = y2time+increment;
    x3time = x3time+increment;
    y3time = y3time+increment;
  }
}

