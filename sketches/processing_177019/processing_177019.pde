
void setup(){
  size(1000,1000);
  background(255,200,200);  
  smooth();

}

void draw() {
 if (mousePressed) {
 fill (0);
}else{
 fill(255);

}

ellipse(mouseX,mouseY,80,80);

}
