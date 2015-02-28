
void setup(){
  size(500,500);
background(255);
println("setup");
}


void draw(){ 
  println(abs(mouseX-pmouseX));
  stroke(mouseX,mouseY,mouseX);
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX, mouseY, pmouseX, pmouseY);
 

}

void mousePressed(){
  saveFrame("pollock.png");
}

