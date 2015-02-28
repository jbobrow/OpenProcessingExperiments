
void setup(){
  background(255);
  size(screen.width,screen.height);
   smooth();
 frameRate(30);}

void draw(){

point(mouseX,mouseY);
stroke(random(255),random(255),random(255),random(255));
if (mousePressed){
  line(mouseX,mouseY,pmouseX,pmouseY);

  strokeWeight(abs(mouseX-pmouseX));
 }}
 
 void keyPressed(){
   if (key=='s'){
     saveImage();}}

