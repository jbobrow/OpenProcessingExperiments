
void setup() {
size(500, 500);
background(255);
}

float R = random(0, 255);
float G = random(0, 255);
float B = random(0, 255);
 


void draw() {
strokeWeight(18);
stroke(R,G,B, 90,50);
point(mouseX,mouseY);



fill(R,G,B,90,50);
ellipse(mouseX+100,mouseY+100,7,7);
fill(R,G,B,90,50);
ellipse(mouseX-100,mouseY-100,5,5);



}


void keyPressed() {

background(255);
}


void mousePressed()
{
  R = random(0, 255);
  G = random(0, 255);
  B = random(0, 255);
};


