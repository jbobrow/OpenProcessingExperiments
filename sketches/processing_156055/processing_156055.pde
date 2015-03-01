
PImage cow;
PImage plas;

float tintR;
float tintG;
float tintB;

float headWidth;
float headHeight;

void setup(){
  size(600,600);
  background(172,255,192);
  
  cow=loadImage("cow.png");
  plas=loadImage("plasticine.png");

}

void draw(){
    background(172,255,192);
    

  
  float random1=random(30);
  float random2=random(30);
  
  float freq=map(mouseY,0,width,0.001,1);
  float scale=map(sin(mouseX*freq),-1,1,350,500);
  

  //plasticine
  tintR=map(mouseX,0,width,180,255);
  tintG=map(mouseY,0,height,180,255);
  tintB=map(frameCount,0,180,0,56);
  
  tint(tintR,tintG,tintB);
 
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(frameCount*-0.1));  
  image(plas,0,0,scale-10,scale+20);
  pushMatrix();
  translate(50,100); 
  rotate(radians(frameCount*0.9)); 
  image(plas,0,0,scale+20,scale-5);
  popMatrix(); 
  popMatrix(); 
  
  
  //cow
  float cowX;
  float cowY;
  
  cowX=map(mouseX,0,width,width/2-150,width/2+30);
  cowY=map(mouseY,0,height,height/2+40,height/2-100);
  //pushMatrix();
  tint(255);
  translate(width/3,height/4);
  image(cow,cowX-250,cowY-300,scale,scale);
  //popMatrix();
}  
  void mousePressed(){ 
  textSize(200);
  fill(50);
  text("MOO", width/2-450, height/2); 
}
 


