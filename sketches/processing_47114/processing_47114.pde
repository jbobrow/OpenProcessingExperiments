
void setup(){
size(500,500);
fill(0,102);
smooth();



}
void draw(){
  float weight = dist (mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(weight);
  line (mouseX,mouseY,pmouseX,pmouseY);
  
}

