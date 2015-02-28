
void setup(){
  size(600,600);
  background(255);
 
  
}

void draw(){ 
   PImage myred=loadImage("redpaint.jpg");
   image(myred,0,100);
 PImage mygreen=loadImage("greenpaint.jpg");
   image(mygreen,0,150);  
  PImage myblue=loadImage("bluepaint.jpg");
   image(myblue,0,200);
    
   
  }




void mouseClicked(){
  if(mouseX<=50 && mouseX>=0 && mouseY<=150 && mouseY>=100){
  background(255,0,0);}
  
  
  if(mouseX<=50 && mouseX>=0 && mouseY<=200 && mouseY>=150){
  background(0,255,0);}
  
 
  if(mouseX<=50 && mouseX>=0 && mouseY<=250 && mouseY>=200){
  background(0,0,255);}  
}

void mouseDragged(){
  fill(random(0,255));
   ellipse(mouseX, mouseY, 10, 10);
}
  


void keyPressed() {
  if(key==' '){
    background(255);
  
}  
}

