
void setup(){
size(800,800);
frameRate(200);
smooth();
  background(8,182, 219);
  
}
  
 void draw() {
  noStroke();
  dist (mouseX, mouseY, pmouseX, pmouseY);
  float d= dist(mouseX, mouseY, pmouseX, pmouseY);
   
   ellipse(mouseX, mouseY, d, d);
     if (d > 20) d = 20;
  strokeWeight(20-d);
 }
  
 void mouseClicked () {
  background(8,182, 219);
}




void keyPressed(){
  println("Taste gedrückt:" + key);
  if(key =='s') saveFrame("line-####.png");
}

