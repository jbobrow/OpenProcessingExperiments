
void setup(){
  size(640,480);
  background(255);
  noStroke();
  smooth();
}
 
void draw(){
  for(int i=0;i<2;i++){
  dmrect();
  }
}
 
void dmrect(){ 
  
  float x = random(width), y=random(height);
  fill(0,50);
  float ds = dist(mouseX,mouseY,pmouseX,pmouseY);
 
  rect(x+4, y+4, ds, ds);
  
  //create multiple rects, reverse color everytime draw  
  boolean k = true;
  if(random(100)<50){
     k=false;
  } 
  while(ds>10){
    if(k){
      fill(255);
    } else {
      fill(0);
    }
    rectMode(RADIUS);
    rect(x,y, ds, ds);
    ds*=random(0.80,0.95);
    k=!k;
  }
}



