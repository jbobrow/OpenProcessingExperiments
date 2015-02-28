
PImage img;boolean white= false;
void setup(){
  size(500,500,P2D);
  background(255);
  noStroke();
}
void draw(){
  img=get(0,0,500,500);
  img.filter(BLUR,.7);
  background(img);
}
void mouseDragged(){
  if(white==false){
    fill(0);
  }else{fill(255);}
  ellipse(mouseX,mouseY,30,30);
}
void keyPressed(){
  if(white==false){
    white=true;
  }else{white=false;}
}

  
  

