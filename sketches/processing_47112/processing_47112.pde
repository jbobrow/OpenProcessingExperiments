
void setup(){
size (900,500);
fill(0,102);
smooth();


}
void draw(){
float weight = dist(mouseX,mouseY,10,pmouseY);
strokeWeight(weight/300);
rect(mouseX,mouseY,10,pmouseY);
ellipse(mouseX,mouseY,10,pmouseY);
}

