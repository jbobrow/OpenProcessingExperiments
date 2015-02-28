
void setup() {
size(500,500);
}

void draw() {
background(255);
translate(width/2, height/2);
// Minuten
pushMatrix();
rotate(radians(240+minute()*6)); 
fill(255);
stroke(113,169,173);
strokeWeight(5);
ellipse(120,120,50,50);
popMatrix();
// Stunden
pushMatrix();
rotate(radians(240+hour()*30)); 
fill(255);
stroke(70,70,70);
strokeWeight(5);
ellipse(135,135,20,20);
popMatrix();
// Sekunden
noStroke();
fill(180,180,180);
ellipse(0,0,40+290/60*second(),40+290/60*second());
fill(255);
ellipse(0,0,40,40);
}
