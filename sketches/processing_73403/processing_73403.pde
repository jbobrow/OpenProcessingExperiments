
void setup(){
size(350,350); }
void draw(){
background(230);
smooth();
noFill();
stroke(0,0,255);
strokeWeight(5);
ellipse(70,70,50,50);

stroke(0);
strokeWeight(5);
ellipse(125,70,50,50);

stroke(255,0,0);
strokeWeight(5);
ellipse(mouseX,mouseY,50,50);

stroke(255,255,0);
strokeWeight(5);
ellipse(100,90,50,50);

stroke(0,255,0);
strokeWeight(5);
ellipse(155,90,50,50);
}



