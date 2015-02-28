
void setup() {
size(800,500);
strokeWeight(2);
smooth();
}
 
void draw() {
  background(200);
  robot(50,25,200,3);
  robot(230,70,230,10);
  robot(400,30,300,20);
}
   
   
void robot (int x, int y, int neckh, int eye) {
  pushMatrix();
  translate(x,y);
 
// Antennae
stroke(255);
line(140,60,120,30);
line(160,60,180,30);
noStroke();
ellipse(120, 30, 3, 3);
ellipse(180, 30, 3, 3);

 
//Head
noStroke();
fill(#F57839);
rect(120, 60, 60, 60);
fill(255);
ellipse(140, 80, eye+7, eye+10);
fill(255);
ellipse(160, 80, eye+7, eye+10);
fill(#000000);
ellipse(140, 85, eye+3, eye+3);
ellipse(160, 85, eye+3, eye+3);
//Mouth
stroke(#000000);
line(140,105,160,105);
//Ears
noStroke();
fill(#F57839);
rect(115,75,10,15);
rect(175,75,10,15);
//Neck
ellipse(150,130,10,10);
//Arms
fill(255);
ellipse(110,170,10,10);
ellipse(190,170,10,10);
fill(#F57839,180);
ellipse(100,180,10,10);
ellipse(200,180,10,10);
fill(255);
ellipse(90,190,10,10);
ellipse(210,190,10,10);
fill(#F57839, 180);
ellipse(80,200,10,10);
ellipse(220,200,10,10);
//Body
noStroke();
fill(#F57839);
rect(113, 140, 75, 100);
fill(255);
rect(120,148,60,85);
//Thighs
fill(#f57839);
rect(120, 240, 25, 20);
rect(155, 240, 25, 20);
//Knees
fill(255);
ellipse(132,270,10,10);
ellipse(168,270,10,10);
//Calves
fill(#f57839);
rect(120, 280, 25, 40);
rect(155, 280, 25, 40);
//Feet
fill(255);
ellipse(132,320,17,5);
ellipse(168,320,17,5);
popMatrix();
}


