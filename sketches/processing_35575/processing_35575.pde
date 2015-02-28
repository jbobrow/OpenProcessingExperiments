
void setup() {
size(500, 500);
smooth();
background(229,250,73);
frameRate(40);
}
void draw(){
stroke(mouseX,0,mouseY);
float distance=dist(pmouseX,pmouseY,mouseX,mouseY);
float maxStroke=15;
strokeWeight(maxStroke-constrain(distance,0,maxStroke));
line(pmouseX,pmouseY,mouseX,mouseY);
}
void mouseClicked(){
ellipseMode(CENTER);
fill(mouseY,229,mouseX);
noStroke();
ellipse(mouseX,mouseY,25,25);
}
void keyPressed(){
background(229,250,73);
}     
