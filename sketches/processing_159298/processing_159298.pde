
float dt = 0;
float x = 10;

void setup(){
  size(400,400);
  colorMode(HSB,255);
  background(255);
  frameRate(10);
}


void draw(){
  if(dt < 6.29){
    noFill();
    stroke(#AFDAFF);
    arc(200,200,100,100,dt,dt+0.5);
    dt += 0.08;
  }
  if(dt > 6.29){
    fill(0,10);
    rect(0,0,width,height);
    stroke(#AFDAFF);
    ellipse(200,200,100+x,100+x);
    x += 10;
    if(x == 700){
      dt =0;
      x = 0;
      background(255);
    }
  }
}


