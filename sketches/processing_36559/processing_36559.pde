
void setup() {
size(600,600);
}

void draw() {
background(random(255));


stroke(255);
fill(random(255));
rect(mouseX,mouseY,random(-100),random(100));

}
