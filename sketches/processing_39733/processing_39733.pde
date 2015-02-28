
float X;
 
void setup(){
 size(500,500);
 background(255);
 X=0;
}
 
void draw(){
 if(mouseButton==RIGHT){
  background(255);
 }
}
 
void mouseDragged(){
 X+=4;
 if(X>height) X=0;
 noFill();
 stroke(0,0,random(132,211),30);  
 strokeWeight(4);
 bezier(0,X,mouseX,mouseY,mouseX,mouseY,width,X);
}  

