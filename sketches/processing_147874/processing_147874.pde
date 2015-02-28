
void setup() {
size(400,400);
frameRate(30);
}
void draw() {
background(100);
stroke(255);
fill(frameCount/2);
rectMode(CENTER);
rect(width/2,height/2,mouseX+10,mouseY+10);

fill(255);
ellipse(width/2,height/2,mouseX-150,mouseY-150);

rectMode(CENTER);
rect(width/4, height/2,mouseX-300, mouseY-300);

rectMode(CENTER);
rect(width/2, height/2,mouseX-300, mouseY-300);


}
void keyPressed() {
println(key);
}
