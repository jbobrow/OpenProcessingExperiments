
int angulo=0;

void setup() {
size (500,500);
background(0);
noFill();
smooth();
strokeWeight(3);
stroke(255);
angulo=0;
}

void draw() {
angulo+=1;
background(0);
pushMatrix();
translate(250,250);
ellipse(0,0,50,50);
pushMatrix();
rotate (radians(angulo));
ellipse(150,150,20,20);
popMatrix();
rect(-10,-10,20,20);
popMatrix();
} 
