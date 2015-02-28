
void setup() {
  size(500, 500);
  background(255);
}

void mouseClicked(){
  setup();
}

void draw() {
  
noStroke();

fill( random(200, 300), random(200, 300), random(200, 300) );
rect(mouseX, mouseY, 50, 50);


}



