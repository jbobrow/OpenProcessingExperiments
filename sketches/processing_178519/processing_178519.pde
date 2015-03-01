
void setup  () {
size(500,500);

}

void draw () {
if (mousePressed){

rect(mouseX,mouseY,mouseY,mouseX);
ellipse(50,60,mouseX,mouseY);
fill(mouseX,mouseY,mousePressed);
ellipse(185,60,mouseX,mouseY);
ellipse(50,60,mouseX,mouseY);
ellipse(185,60,50,50);}
}
