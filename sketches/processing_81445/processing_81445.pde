
PImage zahn;
PImage zeiger;
PImage pendel;

void setup(){
  size(840,480);
  frameRate(60);
  smooth();
  zahn = loadImage("zahn1.png");
  zeiger = loadImage("zeiger2.png");
  pendel = loadImage("pendel.png");
}

void draw(){
  background(0);
  zahnrad(840,10,800,-1,0,1);
  zahnrad(0,450,700,-1,0,1);
  pendel(740,0,0.4,-3);
  zahnrad(200,100,600,-1,0,1);
  zahnrad(640,480,500,1,0,1);
  pendel(400,-300,1,1);
  pendel(200,0,0.5,-2);
  zahnrad(200,0,100,1,0,1);
  zahnrad(100,100,250,1,0,1);
  zahnrad(100,335,250,-1,10,1);
  zahnrad(100,100,100,1,0,1);
  zahnrad(190,100,100,-1,10,1);
  zahnrad(390,100,200,-1,0,2);
  zahnrad(390,100,100,-1,0,2);
  zahnrad(590,50,240,1,5,2);
  zahnrad(590,50,100,1,0,2);
  zeiger(240,-20-(second()*6),0,0);
  zeiger(440,-20-(minute()*6),0,0);
  zeiger(640,-20-(hour()*16),0,0);
}

void zahnrad(float x, float y, float s,float r,float r_,float mode){
  pushMatrix();
  translate(x,y);
  if(mode == 1){
  rotate(radians((360/60*second()*r)+r_));
  }
  
  else{
    rotate(radians((360/60*minute()*r)+r_));
  }
  
  image(zahn,-(s/2),-(s/2),s,s);
  popMatrix();
}

void zeiger(float x, float y,float s1, float s2){
  pushMatrix();
  translate(x,y);
  image(zeiger,-140/4,-670/4);
  popMatrix();
}

void pendel(float x, float y,float s,float r_){
  pushMatrix();
  translate(x,y);
  rotate(radians(sin(frameCount/12.0))*4*r_);
  image(pendel,-164/2*s,0,164*s,729*s);
  popMatrix();
}


