
float theta=radians(random(30, 65));

float twistiness = 15;
float strokeW= 7;
void setup() {
size(500, 500);
}
void draw() {
background(0,191,255);
//theta=map(sin(frameCount*0.05), 0,100, 0, 2*PI);
translate(width/2, height);
branch(100);
}


void branch(float len) {


  organicLine(0,0,0,-len,strokeW,twistiness);
//line(0, 0, 0, -len);


translate(0, -len);
//if (len<=10) {
stroke(255,random(50,100),random(30,180),random(30,80));
//fill(82, 161, 255, 80);
//ellipse(0, 0, 9, 9);
//}
if (len >10) { // no inf. loop
pushMatrix();
rotate(-theta*.95);
branch(len*.6);
popMatrix();
pushMatrix();
rotate(-theta*.4);
branch(len*.65);
popMatrix();
pushMatrix();
rotate(theta*.3);
branch(len*.7);
popMatrix();
pushMatrix();
rotate(theta*.75);
branch(len*.65);
popMatrix();
}

}



void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
strokeCap(ROUND);
strokeWeight(strokeW);
float numSections = 10;
float cx = x2-x1*2; // change in x
float cy = y2-y1; // change in y
float nx1 = x1; // first x
float ny1 = y1; // first y
for (int i = 1; i <= numSections; i++) {
float nx2 = x1 + i/numSections * cx+random(-5,5); //add variation here
float ny2 = y1 + i/numSections * cy +random(-3,3); //and here
line(nx1, ny1, nx2, ny2);

nx1 = nx2;
ny1 = ny2;
}
}


