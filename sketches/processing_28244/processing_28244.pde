
PImage underwater;
PImage [] mario;
PImage marioDie;
int frame = 3;
int x = 250;
int y = 250;
float rot = 0;
float desiredRot = 0;
float driftX = 250;
float driftY = 250;
  
void setup() {
  size (500, 500);
  mario = new PImage[4];
  for(int i = 0; i<mario.length; i++) {
    mario[i] = loadImage("Mario Swim"+ (i+1) +".png");
  }
  underwater = loadImage("underwater.jpg");
}
  
  
void draw() {
    
  if(frame > 2) frame = 0;
    
  rot += (desiredRot-rot)*0.1;
    
  image(underwater, 0,0, 500, 500);
  
  pushMatrix();
  //translate(x, y);
  rotate(rot);
    if (mousePressed){
    int i= -2;
    frame=3;
    driftY= driftY-(10*i);
  }
  image(mario[frame], driftX, driftY, 100, 100);
  frameRate(5);
  frame++;
   
    driftX+= random(-10, 10);
      if(driftX<=0)
      {
        driftX=0;
      }
      if (driftX >=450){
        driftX=450;
      }
      driftY+= random(-10, 10);
      if(driftY<=50)
      {
        driftY=100;
      }
      if (driftY >=500){
        driftY=500;
      }
   
  popMatrix();
   
 
}
  
  
/*
  if(key == CODED) {
    if(keyCode == RIGHT) {
      x += 5;
      desiredRot = -.5*PI;
      frame++;
    }
    else if(keyCode==LEFT) {
      x-= 5;
      desiredRot = .5*PI;
      frame++;
    }
    else if(keyCode == UP) {
      y-= 5;
      desiredRot = PI;
      frame++;
    }
    else if (keyCode == DOWN) {
      y+= 5;
      desiredRot = 0;
      frame++;
    }
  }
}*/


