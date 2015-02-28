
void setup() {

size(480,480) ;

smooth() ;

}

void draw() {

if (mousePressed) {

fill(255,0,0);

} else {

fill(mouseX,0,mouseY);

}

ellipse(mouseX, mouseY, 100,100);

}


