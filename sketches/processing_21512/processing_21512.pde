
void setup(){
  size(screen.width,screen.height);
  background(201,172,4);
  smooth();
  
}
void draw(){

stroke(55);
if(mousePressed){
  line(mouseX,mouseY,pmouseX,pmouseY);
  //strokeWeight(random(.3,20));
  strokeWeight(abs(mouseX-pmouseX));
}
}
void keyPressed(){
  if (key=='s'){
    saveImage();}}

