

void setup(){
  size(600,600);
}

void draw(){
 float velocidad= dist(mouseX, mouseY, pmouseX, pmouseY);
 if (mousePressed){
   strokeWeight(velocidad);
   line(mouseX ,mouseY, pmouseX,pmouseY);
 }
 
 }
