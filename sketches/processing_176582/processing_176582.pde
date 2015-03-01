
void setup  () {
size(500,500);

}

void draw () {
if (mousePressed){

rect(mouseY,mouseX,mouseY,mouseX);
ellipse(50,60,90,90);
fill(mouseX,mouseY,mouseY);
ellipse(185,60,mouseX,mouseY);
ellipse(50,60,50,50);
ellipse(185,60,50,50);}
}
