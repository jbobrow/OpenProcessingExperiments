
PImage img;

void setup(){
  size(870,670);
  img=loadImage("Butterfly.jpg");
  image(img,0,0);
  noStroke();
  smooth();
}

void draw(){
  if(mousePressed==true){
    fill(204, 51, 204);
  }
  else{
    noFill();
}
if(keyPressed){
  if(key=='g'){
    fill(102, 255, 102);
  }
}
if(keyPressed){
  if(key=='b'){
    fill(102, 255, 255);
  }
}
 if(keyPressed){
   if(key=='o'){
     fill(255, 102, 51);
   }
 }

ellipse(mouseX, mouseY, 5, 5);
}

