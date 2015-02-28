
int counter;
 
void setup() {
size(450,450);
rectMode(CENTER);
background(200,230,34);
smooth();
}
void draw() {
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);
//quad(250,180,60,400,43,324,mouseX,mouseY);
if(mousePressed){
fill(r,g,b);} 
quad(250,180,60,400,43,324,mouseX,mouseY);
}
 

// This was inspired by Regenica O. Gemino's project: REGENICA GEMINO


