
float X;
 
void setup(){
 size(450,450);
 background(0,2,1,250);
 X=0;
}
 
void draw(){
 if(mouseButton==CENTER){
  background(0);
 }
}
 
void mouseDragged(){
 X+=3;
 if(X>height) X=0;
noFill();
 stroke(0,10,random(30,350),30);  
 strokeWeight(5);
 smooth();
 bezier(0,X,mouseX,mouseY,mouseX,mouseY,width,X);
}              

