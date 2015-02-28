
void setup(){
size (900,500);
fill(0,102);
smooth();


}
void draw(){
float weight = dist(mouseX,mouseY,pmouseX,pmouseY);
strokeWeight(weight/10);
rect(mouseX,mouseY,pmouseX,pmouseY);
ellipse(mouseX,mouseY,pmouseX,pmouseY);
triangle(mouseX,mouseY,pmouseX,pmouseY,pmouseX,pmouseY);
}

