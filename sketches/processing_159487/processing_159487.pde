
void setup() {
size(600, 600);
background(0);
}
void draw() { } 
void mouseDragged() { 
rect(mouseX, mouseY, 10, 10);
fill(0, 12);
noStroke();
float angulo = 1.50;
rect(30, 50, width, height);
fill(135,209,208);
angulo = angulo + 1.50;
translate(300, 300);
rotate(angulo);
rect(-1, -1, 100, 100);

}

