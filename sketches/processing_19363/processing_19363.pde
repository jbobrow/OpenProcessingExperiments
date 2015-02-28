

PFont jessie;

void setup(){
  size(250,250);
  jessie=createFont("helvetica", 20);
 frameRate(2);
}
void draw(){
  textFont(jessie,20);
 background(20,20);
    for(int i=10;i<60;i++){
    fill(40,200,170,random(150));
    text("a",random(75),random(height));
  }
  if(mousePressed){
    for(int i=10;i<50;i++){
      fill(240,200,70,random(150));
    text("b",random(mouseX),random(mouseY));
     }
}
}

