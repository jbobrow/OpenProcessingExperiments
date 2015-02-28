
/*
Coded by Kof @ 
Sun Jul 28 20:11:44 CEST 2013



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'

..and yes, we are probably beings made of fractals as well
 
 */

float frac = 24;

float slope = 0.8;
float sc = 1.8;
float nx,ny;
float TH = 0;
float depth = 1;

PVector one,two,shift;

void setup(){
  size(512,512,P2D);
  noSmooth();
  background(0);
}

void draw(){

  one = new PVector(0,height/2);
  two = new PVector(width-0,height/2);

noiseSeed(98797);


  fill(0,5);
  noStroke();
  rect(0,0,width,height);

tint(255,10);
  image(g,random(-2,2),random(-2,2));
  nx = noise(frameCount/1000.0,0)*sc;
   ny = noise(0,frameCount/1000.0)*sc;
  
  stroke(255,10);


  for(int i= 0 ; i < frac;i++){
    TH = frameCount/200.0+i*(TWO_PI/frac);
    pushMatrix();
    translate(width/2,height/2);
    rotate(-TH);
    translate(-width/2,-height/2);

    fractal(one,two,depth);
    popMatrix();
  }
  
  
}

void fractal(PVector p1,PVector p2,float depth){

  float d = dist(p1.x,p1.y,p2.x,p2.y);
  if(d>=1.5){
    float theta = atan2(p2.y-p1.y,p2.x-p1.x)+(frameCount)/(((1/depth))*200.0);

    PVector p3 = 
      new PVector(
          (p1.x+p2.x)/2.0+cos(theta)*nx*d/2.0,
          (p1.y+p2.y)/2.0+sin(theta)*nx*d/2.0);

    stroke(lerpColor(#ffcc00,#00ccff,map(theta,-PI,PI,0,1)),10);
    if(d<50)
      line(p1.x,p1.y,p2.x,p2.y);
    depth *= slope;

    if(depth >= 0.1){
      fractal(p1,p3,depth);
      fractal(p2,p3,depth);
    }
  }
}

