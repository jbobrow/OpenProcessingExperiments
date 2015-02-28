
void setup() {
  size(500,500);
  background(255);
}

void draw() {

strokeWeight(1);
  line(10,10,mouseX,mouseY);

strokeWeight(5);
stroke(mouseX,0,50,75); //0-500
ellipse(mouseX,mouseY,mouseX,mouseY);

}

