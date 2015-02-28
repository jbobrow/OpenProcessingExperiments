
float ellSize;
float speed;
int dir;

void setup(){
  smooth();
  size(600,800);
  ellSize = 0;
  dir=10;
  background(255);

}
void draw(){
  fill(98,255,random(200,255),70);
  noStroke();
  if(mousePressed){
  ellipse(mouseX,mouseY,dir+(random(10,40)),dir+(random(10,40)));
  }
 if(mouseX > 150 && mouseX < 450 && mouseY > 250 && mouseY < 500){
    stroke(67,random(200,251),random(150,255),45);
 }  else{
    stroke(67,random(200,251),random(0,150),30);
 }
  textSize(44);
  fill(150);
  text("Keep the Pool Clean",82,65);
  textSize(20);
  fill(180);
  text("Just keep swimming",200,681);
  text("Just keep swimming",200,707);
  text("Just keep swimming swimming swimming", 83,733);
  text("What do we do we swim, swim, swim", 113,761);
//  background(55);

  noFill();
  strokeWeight(10);
//  speed = abs(pmouseX-mouseX);
//  ellipse(width/2,height/2,speed,speed);
  ellipse(width/2,height/2,ellSize+=(random(-33,33)),ellSize+=(random(-33,33)));
  ellSize+=dir;
  if(ellSize>600){
    ellSize = 0;
 }
//  if(ellSize > 600){
//    dir=-10;
//  }
//  if(ellSize <= 30){
//    dir=10;
//  }

}

