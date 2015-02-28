
void setup(){
  size(400,400);
  noStroke();
  smooth();
  noCursor();
}

void draw(){

if(mouseX>width/2){
  background(0);
}
else{
  background(255);
}
if(mousePressed==true){
  float r=random(255);
  float g=random(255);
  float b=random(255);
  fill(r,g,b);
}
else{
  fill(#00FF99);
}

if(mouseY>height/2){
  rect(0,200,mouseX,mouseY);
}
else{
  rect(width/2,0,width-mouseX,mouseY);
}

if((mouseX<width/2)&&(mouseY<height/2)){
  fill(#FFFF00);
  ellipse(width/4,height/4,50,50);
}
if((mouseX>width/2)&&(mouseY>height/2)){
   float r=random(255);
  float g=random(255);
  float b=random(255);
  fill(r,g,b);
  ellipse(width/4*3,height/4*3,100,100);
}
}


