
//By: Jordan Dozzi
//A mix and addition of sketches from the Processing handbook adding 
//more variables shapes, and mouse interactivity.
// Modulus from p.47-48, Bezier from p.76-77, and mouse interactivity code from week 6 in class examples


void setup() {
size(900, 900);
smooth();
}
void draw() 

{
bez(500);
}

//Creating a bez function, and running a curvature parameter
//Mouse interaction from mouseX and mouseY demonstrates modulus 
//"wobble" and the inverted movements of the ellipses

void bez(float curvature) {
float z = mouseX;
strokeWeight(30);
noFill();

float x = mouseY;
float y = mouseX + mouseY;
float ix = width - mouseX; 
float iy = mouseY - height;
background(50,50,50);
fill(x/3, x/3, x/3, 150);
ellipse(x, height/2, y, y);
noStroke();
fill(y/3, y/3, y/3, 159);
ellipse(ix, height/2, iy, iy);
beginShape();
vertex(250, 650);
bezierVertex(300.0, z-curvature, (y%30)*30.0, ix, 700, 700);
bezierVertex(600.0, 55.0, 85.0, z-curvature, 85.0, z);
bezierVertex(y, z+curvature, 700, iy, 300, 40);
bezierVertex(y%3, (x%9)*10, z-curvature, x-curvature, y-curvature, 500);
endShape();


}






