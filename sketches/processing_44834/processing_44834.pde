
void setup (){
size (300,300);
smooth ();
strokeWeight(2);
}
void draw (){
rect(40,90, mouseX,mouseY);
ellipse(95,mouseY, 180, mouseY);
rect(mouseX,25, mouseX, 70);
}       
