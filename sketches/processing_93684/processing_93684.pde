
void setup(){
size(200, 200);
background(0);
}
 
void draw(){
fill(mouseX,144, mouseY, 2);
stroke(0, mouseX, mouseY, 20);
ellipse(mouseX, mouseY, 20, 20);

}
