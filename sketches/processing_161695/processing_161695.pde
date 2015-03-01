
int s = 0;
int c1 = 330;
int c2 = 410;
int c3 = 240;
float balloonColor1 = random(0,255);
float balloonColor2 = random(0,255);
float balloonColor3 = random(0,255);
void setup() {
  size(1000, 500);
}

void draw() {
  background(48, 245, 250); // Sky Blue Background
  
  noStroke();
fill(255, 255, 255);
ellipse(c1, 160, 300, 80);
ellipse(c1, 150, 120, 120);
ellipse(c2, 116, 120, 120);
ellipse(c3, 140, 120, 40);
  c1 = c1 + 1;
  c2 = c2 + 1;
  c3 = c3 + 1;
 
  noStroke();
  fill(81, 216, 42);
  rect(0, 400, 1000, 375); // Grass/Ground
  
  noStroke();
  fill(244, 245, 10);
  ellipse(0,0, 250, 250);
 
 fill(0,0,0); //Head
 ellipse(240, 290, 50, 50);
  
 fill(#FA97EF); //Bubble Gum
ellipse(260,300,s,s);
s = s + 1;
if (s > 45) 
  s = 0;
 
 stroke(2); //Body
 strokeWeight(5);
 line(235,300,235,375);
 
 stroke(2); //Left Leg
 strokeWeight(5);
 line(235,375,220,420);
 
 stroke(2); //Right Leg
 strokeWeight(5);
 line(235,375,255,420);
 
 stroke(2); //Right Arm
 strokeWeight(5);
 line(235,335,255,345);
 
stroke(2); //Right forearm
strokeWeight(5);
line(255,345,275,325);

 stroke(2); //Left Arm
 strokeWeight(5);
 line(235,335,215,350);
 
 stroke(2); //Left Forearm
 strokeWeight(5);
 line(215,350,235,360);
 
 stroke(#F0A749); // Balloon String
 strokeWeight(3);
 line(275,325,310,210);
 
 stroke(.2); //Ballloon
 fill(balloonColor1,balloonColor2,balloonColor3);
 ellipse(303,210,50,60);
 
 stroke(2); //Fist
 strokeWeight(6);
 ellipse(275,325,7,7);
}




