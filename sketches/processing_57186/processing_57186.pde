
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(222);
  Robo(mouseX-300, mouseY-300);
}

void Robo(int x, int y) {
  translate(x, y);
rect(300, 300, 200, 200); //head
ellipse (340, 340, 70, 70); //eye outer
ellipse (460, 340, 70, 70);
ellipse (340, 340, 50, 50); //eye inner
ellipse (460, 340, 50, 50);

rect(360, 450, 20, 20); //teeth
rect(380, 450, 20, 20);
rect(400, 450, 20, 20);
rect(420, 450, 20, 20);

ellipse (280, 380, 40, 120); //left ears
ellipse (240, 380, 30, 90);
ellipse (210, 380, 15, 60);

ellipse (520, 380, 40, 120); //right ears
ellipse (560, 380, 30, 90);
ellipse (590, 380, 15, 60);

rect(350, 520, 100, 200); //body

strokeWeight(2);
line(340, 580, 150, 370); //left arm
line(150, 370, 180, 190);

strokeWeight(2);
line(460, 580, 650, 470); //right arm
line(650, 470, 480, 190);


}
  

