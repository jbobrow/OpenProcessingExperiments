
PImage YoCuadr1;
PImage YoCuadr2;
PImage YoCuadr3;
PImage YoCuadr4;

void setup(){
  size(600,900,P3D);
  smooth();
  YoCuadr1 = loadImage("YoCuadr1.jpg");
  YoCuadr1.resize(width/2,height/2);
  YoCuadr2 = loadImage("YoCuadr2.jpg");
  YoCuadr2.resize(width/2,height/2);
  YoCuadr3 = loadImage("YoCuadr3.jpg");
  YoCuadr3.resize(width/2,height/2);
  YoCuadr4 = loadImage("YoCuadr4.jpg");
  YoCuadr4.resize(width/2,height/2);
  
  noCursor();
}
void draw(){
  background(0);

 rotateX(PI/300);
//  translate(-width/2,-height/2);
  YoCuadr1.loadPixels();

  for (int i=0; i<YoCuadr1.width; i+=5){
    for (int j=0; j<YoCuadr1.height; j+=5){
      int pColor = YoCuadr1.get(i,j);
      
      float d = map(dist(i,j,mouseX,mouseY),0,width,0,100);
      
      //int b = (int)brightness(pColor);
      float b = map(brightness(pColor),0,255,0,d);
      strokeWeight(0.4);
      stroke(random(30,130),random(100,255),random(30,130));
      fill(pColor);
      rectMode(CORNER);
      pushMatrix();
      float angul = atan2(j-mouseY,i-mouseX);
      translate(i,j);
      rotateZ (angul);
      box(15,15,b);
      popMatrix();
      //rect(i,j,b,b);
      }
  }
  
  pushMatrix();
  translate(width/2,0);
  YoCuadr2.loadPixels();

  for (int i=0; i<YoCuadr2.width; i+=6){
    for (int j=0; j<YoCuadr2.height; j+=6){
      int pColor = YoCuadr2.get(i,j);
      
      float d = map(dist(mouseX,mouseY,i,j),0,width,0,200);
      
      //int b = (int)brightness(pColor);
      float b = map(brightness(pColor),0,255,0,d);
      strokeWeight(0.5);
      stroke(random(30,130),random(100,255),random(30,130));
      fill(pColor);
      rectMode(CORNER);
      pushMatrix();
      float angul = atan2(j-mouseY,i-mouseX);
      translate(i,j);
      rotateZ (angul);
      box(10,10,b);
      popMatrix();
      //rect(i,j,b,b);
      }
  }
  popMatrix();
pushMatrix();
  translate(0,height/2);
  YoCuadr3.loadPixels();

  for (int i=0; i<YoCuadr3.width; i+=8){
    for (int j=0; j<YoCuadr3.height; j+=8){
      int pColor = YoCuadr3.get(i,j);
      
      float d = map(dist(mouseX,mouseY,i,j),0,width,0,400);
      
      //int b = (int)brightness(pColor);
      float b = map(brightness(pColor),0,255,0,d);
      
      strokeWeight(0.5);
      stroke(random(20,150),random(100,255),random(20,150));
      fill(pColor);
      rectMode(CORNER);
      pushMatrix();
      float angul = atan2(j-mouseY,i-mouseX);
      translate(i,j);
      rotateZ (angul);
      box(10,10,b);
      popMatrix();
      //rect(i,j,b,b);
      }
  }
  popMatrix();
  translate(width/2,height/2);
  YoCuadr4.loadPixels();

  for (int i=0; i<YoCuadr4.width; i+=9){
    for (int j=0; j<YoCuadr4.height; j+=9){
      int pColor = YoCuadr4.get(i,j);
    
      float d = map(dist(mouseX,mouseY,i,j),0,width,0,500);
      
      //int b = (int)brightness(pColor);
      float b = map(brightness(pColor),0,255,0,d);
      
      strokeWeight(0.6);
      stroke(random(20,150),random(100,255),random(20,150));
      fill(pColor);
      rectMode(CORNER);
      pushMatrix();
      float angul = atan2(j-mouseY,i-mouseX);
      translate(i,j);
      rotateZ (angul);
      box(15,15,b);
      popMatrix();
      //rect(i,j,b,b);
      }
  }
}

