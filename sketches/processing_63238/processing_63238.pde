
void setup() {
 size(500,500);
 colorMode(RGB,1000,1000,1000,1000);
 background(250);
}

void draw() {
 background(mouseX,mouseY,mouseX);
 line(mouseX,mouseY,500,500);
 line(mouseX,mouseY,abs(mouseX-mouseY),abs(mouseY-mouseX));


 strokeWeight(abs(mouseX-pmouseX));

}

void mousePressed() {
 rect(100,100,100,100);
}

