
void setup(){
size(500,300);
background(random(220),random(225),random(255));
}
 
void draw(){
  stroke(random(220),random(255),random(255));
  line(pmouseX,pmouseY,mouseX,mouseY);
   
}
