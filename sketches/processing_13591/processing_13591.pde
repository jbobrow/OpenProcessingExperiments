
import processing.video.*;
//MovieMaker mm;

ArrayList balls;
color ball_color= color(255,0,255,50);
float easing =0.005;
boolean converge=true;
float angle=0;

void setup() {
  size(500,500);
  smooth();
  background(255,255,255);
  balls = new ArrayList();
  frameRate(900);
  //  balls.add(new Ball(random(0,width), random(0,height), color(255,50)));e
//  mm = new MovieMaker(this, width, height, "Ball4.mov", 30, MovieMaker.RAW, MovieMaker.LOSSLESS);
};

void draw() {

  //   background(255,255,255);
  fill(255,255,255,0);
  noStroke();
  rect(0,0,width,height);

  //For each ball in the array
  for (int i = 0; i <= balls.size()-1; i++) {
    //        color ball_color=color (255-(i*10),0,255,50);
    //get that ball
    Ball aball = (Ball) balls.get(i);
    if(i==0) { 
      //if this is the first vall
      aball.display(10,10,color(255,255,0,100));
    } 
    else {
      Ball aball1 = (Ball) balls.get(i-1); //gets the ball ebfore
      float d=dist(aball.x, aball.y, aball1.x, aball1.y); //finds the distance
      float s=map(d, 0, (float)height, (float) 5, (float) 40); //maps the size to the distance
      aball.display(s,s,ball_color);//draws the call
    };

    if(i>0) { //For the balls that move
      Ball aball1 = (Ball) balls.get(i-1); // gets previous call


      float d=dist(aball.x, aball.y, aball1.x, aball.y);

      if(d>1) {
        if(converge) {
          aball.x +=((aball1.x-aball.x) * easing );
          aball.y +=((aball1.y-aball.y) * easing );
        } 
        else {
          aball.x -= (aball1.x-aball.x) * easing;
          aball.y -= (aball1.y-aball.y) * easing;
        };
      };

      stroke(0,100,0+(i*10),5);

      strokeWeight(15);

      line(aball1.x, aball1.y, aball.x, aball.y);
    };
  };
//  mm.addFrame();
};

void mousePressed() {

  balls.add(new Ball(mouseX, mouseY, ball_color ) );
};

void keyPressed() {

  if ((key == DELETE) || (key == BACKSPACE)) {
    balls.clear();
  };

  if(key =='c' || key == 'C') {
    background(255,255,255);
  };

  if(key =='n' || key =='N') {
    balls.clear();
    background(255,255,255);
  };

  if(key =='-' || key == '=' ) {
    if(converge) {
      converge=false;
    } 
    else {
      converge=true;
    };
  };

  if(key==' ') {
    println("Done");
//    mm.finish();
  };
};

class Ball {
  float x;
  float y;
  color c;

  Ball(float tempx, float tempy, color tempc) {
    x=tempx;
    y=tempy;
    c=tempc;
  };

  void display(float tempw, float temph, color tempc2) {
    float w=tempw;
    float  h=temph;
    color c2=tempc2;
    noStroke();
    fill(c2);
    ellipse(x,y,w,h);
    fill(255,255,255,50);
    ellipse(x,y,w-5,h-5);
     fill(0,100);
    ellipse(x,y,w-9,h-9);
  };


};


