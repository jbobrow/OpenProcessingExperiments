
void setup() {
    size(500,400);
}

void draw() {
background(113,178,229);
stroke(17,116,30);
fill(9,186,86);

ellipse(150, 250, 50, 160);
ellipse(350, 250, 50, 160);
ellipse(250, 225, 200, 250);
ellipse(250, 100, 150, 150);
rect(110, 280, 50, 50);
rect(340, 280, 50, 50);

ellipse(175,275,50,160);
ellipse(325,275,50,160);
if (mousePressed) {
stroke(24,131,42);
fill(9,186,86);
ellipse(220,30,40,40);
ellipse(290,30,40,40);
} else{

stroke(7,7,7);
fill(244,237,237);
ellipse(220,30,40,40);
ellipse(290,30,40,40);

stroke(7,7,7);
fill(4,4,4);
ellipse(220,30,20,20);
ellipse(290,30,20,20);
}

}

