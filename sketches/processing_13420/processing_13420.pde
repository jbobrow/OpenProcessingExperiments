
void setup(){
size(600, 140);
background(250,200,160);

}



void draw(){
stroke(255, random(200), random(200));
ellipse(600, 70, mouseX, mouseY);
ellipse(0, 70, mouseX, mouseY);
ellipse(300, 0, mouseX, mouseY);
ellipse(300, 140, mouseX, mouseY);


}
