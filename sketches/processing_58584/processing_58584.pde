

import processing.opengl.*;
Recto[] rectos;
Recty[] rectys;

void setup(){
  size(1000,1000,OPENGL);
  //smooth();
  //frameRate(7);
  rectos = new Recto[66];
  for(int i = 0; i < rectos.length; i++){
    rectos[i] = new Recto(i,i,i); 
  }
  rectys = new Recty[666];
  for(int j = 0; j < rectys.length; j++){
    rectys[j] = new Recty(random(width),random(height),random(width));
  }
}

void draw(){
  background(20);
  //lights();
  //directionalLight(66,66,66,1500,0,-400);
  directionalLight(186,186,186,0,-1,0);
  pushMatrix();
    translate(500,350,0);
    rotateY(map(millis()/60,0,width,0,PI*2));
    rotateX(map(millis()/60,0,height,0,PI*2)); 
     for(int i = 0; i < rectos.length; i++){
  rectos[i].move();
  rectos[i].display();
  }
    for(int j = 0; j < rectys.length; j++){
      rectys[j].move();
      rectys[j].display();
    }

  popMatrix();


  
}

class Recto {
  float x,y,z,angle,dangle;
  Recto(float _x,float _y, float _z){
    x = _x;
    y = _y;
    z = _z;
    //angle = map(sin(dangle),-1,1,1,666); 
    //angle = map(second(),0,60,13,666);
    angle = random(13-166);
  }

  void move(){
    x = sin(radians(angle/6));
    y = cos(radians(angle/6));
    z = tan(radians(angle/6));
  }
  void display(){
    noStroke();
    fill(255,254,242);
   
    pushMatrix();
      //translate(x,500,y);
      rotateY(z);
      rotateX(z);
      box(150);
    popMatrix();
    angle++;
    dangle++;
    
  }
}

class Recty {
  float x,y,z,angle;
  Recty(float _x,float _y, float _z){
    x = _x;
    y = _y;
    z = _z;
    angle = random(0-25);
  }

  void move(){
    x = cos(radians(angle)) * random(100) + width/2; 
    y = sin(radians(angle)) * random(100) + height/2;
    z = cos(radians(angle)) * random(100) + width/2; 
  }
  void display(){
    pushMatrix();
      translate(x,500,y);
      rotateY(z);
      rotateX(z);
      box(500);
    popMatrix();
    noStroke();
    angle++;
  }
}

