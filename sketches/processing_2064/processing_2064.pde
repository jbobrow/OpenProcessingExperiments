
//Make a glow around a sphere


int numGlows;

GlowBall globe;

void setup(){
  size(600,600);
  background(0);
  noStroke();
  smooth();
  globe = new GlowBall();
}

void draw(){
  //background(0);
  fill(0,200);
  rect(0,0,width,height);
  globe.run();
}


//-----------------------------------------------------------------

class GlowBall {
  int ballcount = 1000;
  int globeradius = 120;
  PVector globe;

  Ball[] balls = new Ball[ballcount];
  
  GlowBall(){
    globe = new PVector(width/2, height/2);    
    for(int i = 0; i < ballcount; i++){
      balls[i] = new Ball();
    }
  }
  
  void run() {
    updateballs();
    drawglobe();
  }
  
  void updateballs(){
    for(int i = 0; i < ballcount; i++){
      balls[i].run();  
    }
  }
  
  void drawglobe(){
    fill(0);
    ellipse(globe.x, globe.y, globeradius, globeradius);
  }
  
  class Ball{
    float r;
    float maxr;
    PVector ballv;
    PVector ballvel;
    int a = 255;
    color c = color(255,255,0);
    
    
    Ball(){
       ballv = new PVector(globe.x + random(-globeradius/4, globeradius/4), globe.y+random(-globeradius/4, globeradius/4));
       ballvel = new PVector(random(-1,1), random(-1,1));
       r = 1;
       maxr = random(5,30);
       if(random(0,1)>.99){
         maxr+=40;
       }
       if(random(0,1)>.999){
         maxr+=100;
       }
    }
    
    void run(){
      if(PVector.dist(ballv, globe)>globeradius/2){
        ballvel.mult(.2);
        r+=(maxr-r)/60;
        a*=.99;
        c = color(255,255,0,a);
      }
      if(a<10){
        ballv = new PVector(globe.x + random(-globeradius/4, globeradius/4), globe.y+random(-globeradius/4, globeradius/4));
        ballvel = new PVector(random(-.1,.1), random(-.1,.1));
        r = 1;
        a = 255;
        
      }
      ballv.add(ballvel);
      fill(c);
      ellipse(ballv.x,ballv.y,r,r);
      
    }
  }
}
  

