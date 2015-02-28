
void setup(){
 size(600, 200);
 smooth();
 frameRate(7);
background(100);
}

void draw(){
 noStroke();
 fill(150, 10, 10);
ellipse(mouseX, mouseY, 30, 30);
fill(200);
 rect(pmouseX, pmouseY, 30, 30);
stroke(100);
line(mouseX, mouseY, pmouseX, pmouseY);
}
void mousePressed(){
 background(100);
}
