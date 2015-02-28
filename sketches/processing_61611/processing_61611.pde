
void setup(){
size(600,600,P3D);
colorMode(HSB,360);
background(360);
noStroke();
rectMode(CENTER);





}

void draw(){

  int angle=10;
  translate(300,300);
  background(360);
  rectMode(CENTER);  
  
  
 
  
 
  
 for(int i=0; i<200; i++){
  for(int x=0; x<36; x++)
fill(random(0,360),360,360);
  
  for(int x=0; x<36; x++)
//fill(x*10,360,360);
    
  
  
  
  
  rotateY(radians(random(0,360)));
  rotateX(radians(mouseX));
  pushMatrix();
   
  rotate(radians(i*angle));
  frameRate(11);
  translate(mouseX,0);
  for(int x=0; x<36; x++)
//fill(x*10,360,360);
  rect(0,0,15,15);
  
  popMatrix();
  
   pushMatrix();
   
  rotate(radians(i*angle));
  frameRate(11);
  translate(20,0);
  for(int x=0; x<36; x++)
//fill(x*10,360,360);
  rect(0,0,15,15);
  
  popMatrix();
  
   pushMatrix();
   
  rotate(radians(i*angle));
  frameRate(100);
  translate(120,0);
  for(int x=0; x<36; x++)
//fill(x*10,360,360);
  rect(0,0,15,15);
  
  popMatrix();
  
 }
  
}


