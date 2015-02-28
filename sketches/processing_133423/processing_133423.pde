
void setup() {
background(0, 120, 130);
size(500, 400);
}
void draw(){
strokeWeight(5);
stroke(0);
ellipse(250, 200, 200, 200);
strokeWeight(15);
stroke(map(mouseX, mouseY, mouseX/2), 0, 2);
line(width/2, height/2, mouseX, mouseY);
}
