
void setup() {
 size(500,500);

 background(0);
 smooth();

}

void draw() {
//  pushMatrix();
// fill(255,35);
// rect(0,0,500,500);
 stroke(0);
 translate(mouseX,mouseY);
ellipseMode(CENTER);
fill(255,50);
ellipse(0,0,250,250);
fill(0,70);
ellipse(0,0,200,200);
//fill(255,70);
//ellipse(0,0,150,150);
fill(0,90);
ellipse(0,0,100,100);
//fill(255,70);
//ellipse(0,0,50,50);
//popMatrix();
stroke(255);
fill(0);
triangle(-125,-152,0,0,125,125);
}
