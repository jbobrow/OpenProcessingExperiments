
int rotation=360;
void setup(){
  size(500,500);
  smooth();
  
}
void draw(){
  
  pushMatrix();
  //background(100);
  if(rotation<=360){
  translate(width/2,height/2);
  rotate(radians(rotation));
 
  rectMode(CENTER);
  //strokeWeight(1);
  //rect(0,0,100,100);
 // strokeWeight(10);
  line(-20,50,40,20);
  popMatrix();
  
  pushMatrix();
  translate(width/4,height/4);
  rotate(radians(rotation));
  rect(0,0,50,50);
  popMatrix();

  rotation=rotation-10;
  }else if(rotation<0){
    rotation=360;
  }
}
