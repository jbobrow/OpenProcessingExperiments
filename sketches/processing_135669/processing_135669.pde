
void setup(){
size (400, 400);
smooth();
noStroke();
}

void draw(){
background (0);
fill(255);
ellipse(200,200,mouseY, mouseX);


fill(102,51, 102);
ellipse(mouseY, mouseX, mouseX/2, mouseY/2);

fill(51, 0,51);
rect(mouseX,mouseY, 60, 200);

}
