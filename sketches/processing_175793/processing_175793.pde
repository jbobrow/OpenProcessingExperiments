
void setup(){
size(1000,1000);
smooth();
}
void draw(){
if(mousePressed){
 fill(0); 
 }else{
  fill(255);
 }
 ellipse(mouseX,mouseY,80,80); 
 }