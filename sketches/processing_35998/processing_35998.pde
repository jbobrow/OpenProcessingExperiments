
size(800, 650);
noStroke();

int x = 0; 
int y = 0;
int wid = 800;
int hght = 650;
float haloCenterX = wid*.5;
float haloCenterY = hght*.385;

//BACKGROUND
fill(133, 197, 240);
rect(0, 0, 800, 650);
fill(79, 157, 115);
bezier(0, 500, 200, 400, 600, 400, 800, 350);
triangle(800, 350, 800, 500, 300, 437);
fill(76, 175, 98);
quad(0, 400, 800, 500, 800, 650, 0, 650);

//HALO
stroke(240, 215, 22);
strokeWeight(15);
float rad1 = 0;
float rad2 = PI/3;
for(int i = 0; i < 8; i++){
  line(haloCenterX, haloCenterY, haloCenterX+1000*cos(rad1), haloCenterY+1000*sin(rad1));
  line(haloCenterX, haloCenterY, haloCenterX+1000*cos(rad2), haloCenterY+1000*sin(rad2));
  rad1 += (PI/4);
  rad2 += (PI/4);
}
fill(240, 215, 22);
ellipse(haloCenterX, haloCenterY, 400, 400);
fill(240, 146, 22);
ellipse(haloCenterX, haloCenterY, 300, 300);
  

//LLAMA

fill(198, 198, 198);
noStroke();

//NECK
ellipse(haloCenterX, haloCenterY +140, 150, 25);
int a = 0;
int r = 120; int g = 120; int b = 120;
for(int i = 300; i >= 0; i -= 12)
{
  fill(r, g, b, 250);
  ellipse(haloCenterX, haloCenterY + 150 + i, 230 - a, 25);
  a += 3;
  r += 3;
  g += 3;
  b += 3;
}
fill(198, 198, 198);

//HEAD TOP
arc(haloCenterX, haloCenterY - 25, 200, 175, PI, 2*PI);
quad(haloCenterX - 100, haloCenterY - 26, haloCenterX + 100, haloCenterY - 26, haloCenterX + 75, haloCenterY + 125, haloCenterX - 75, haloCenterY + 125);
//HEAD BOTTOM ^
//CHIN BODY
ellipse(haloCenterX, haloCenterY + 125, 150, 75);
//CHIN LINE
noFill();
stroke(150, 150, 150);
strokeWeight(5);
beginShape();
curveVertex(haloCenterX - 60, haloCenterY + 145);
curveVertex(haloCenterX - 60, haloCenterY + 145);
curveVertex(haloCenterX, haloCenterY + 165);
curveVertex(haloCenterX + 60, haloCenterY + 145);
curveVertex(haloCenterX + 60, haloCenterY + 145);
endShape();
noStroke();

//EARS
strokeJoin(ROUND);
strokeCap(ROUND);
stroke(187, 187, 187);
fill(188, 188, 188);
quad(haloCenterX - 90, haloCenterY - 65, haloCenterX - 115, haloCenterY - 125, haloCenterX - 65, haloCenterY - 135, haloCenterX - 35, haloCenterY - 110);
quad(haloCenterX - 115, haloCenterY - 125, haloCenterX - 115, haloCenterY - 225, haloCenterX - 35, haloCenterY - 240, haloCenterX - 65, haloCenterY - 135); 
quad(haloCenterX + 90, haloCenterY - 65, haloCenterX + 115, haloCenterY - 125, haloCenterX + 65, haloCenterY - 135, haloCenterX + 35, haloCenterY - 110);
quad(haloCenterX + 115, haloCenterY - 125, haloCenterX + 115, haloCenterY - 225, haloCenterX + 35, haloCenterY - 240, haloCenterX + 65, haloCenterY - 135); 
noStroke();

fill(100, 100, 100);
quad(haloCenterX - 85, haloCenterY - 85, haloCenterX - 105, haloCenterY - 125, haloCenterX - 80, haloCenterY - 135, haloCenterX - 50, haloCenterY - 110);
quad(haloCenterX - 104, haloCenterY - 120, haloCenterX - 105, haloCenterY - 220, haloCenterX - 50, haloCenterY - 230, haloCenterX - 80, haloCenterY - 130);

quad(haloCenterX + 85, haloCenterY - 85, haloCenterX + 105, haloCenterY - 125, haloCenterX + 80, haloCenterY - 135, haloCenterX + 50, haloCenterY - 110);
quad(haloCenterX + 104, haloCenterY - 120, haloCenterX + 105, haloCenterY - 220, haloCenterX + 50, haloCenterY - 230, haloCenterX + 80, haloCenterY - 130); 



//WHITES
fill(255, 255, 255);
ellipse(haloCenterX - 100, haloCenterY - 25, 75, 75);
ellipse(haloCenterX + 100, haloCenterY - 25, 75, 75);
fill(50, 50, 50);
//LEFT PUPIL:
ellipse(haloCenterX - 110, haloCenterY - 25, 60, 60);
//RIGHT PUPIL:
ellipse(haloCenterX + 110, haloCenterY - 25, 60, 60);
//LIDS
stroke(100, 100, 100);
fill(198, 198, 198);
strokeWeight(3);
arc(haloCenterX - 100, haloCenterY - 25, 90, 75, PI, 2*PI);
line(haloCenterX - 145, haloCenterY - 25, haloCenterX - 55, haloCenterY - 25);
arc(haloCenterX + 100, haloCenterY - 25, 90, 75, PI, 2*PI);
line(haloCenterX + 145, haloCenterY - 25, haloCenterX + 55, haloCenterY - 25);


//NOSE LINES
stroke(100, 100, 100);
strokeWeight(5);
noFill();

beginShape();
curveVertex(haloCenterX - 93, haloCenterY - 63);
curveVertex(haloCenterX - 93, haloCenterY - 63);
curveVertex(haloCenterX - 40, haloCenterY - 50);
curveVertex(haloCenterX - 25, haloCenterY + 30);
curveVertex(haloCenterX - 50, haloCenterY + 75);
curveVertex(haloCenterX - 50, haloCenterY + 75);
endShape();

beginShape();
curveVertex(haloCenterX + 93, haloCenterY - 63);
curveVertex(haloCenterX + 93, haloCenterY - 63);
curveVertex(haloCenterX + 40, haloCenterY - 50);
curveVertex(haloCenterX + 25, haloCenterY + 30);
curveVertex(haloCenterX + 50, haloCenterY + 75);
curveVertex(haloCenterX + 50, haloCenterY + 75);
endShape();

//TOP LIPS
ellipse(haloCenterX - 28, haloCenterY + 95, 55, 60);
ellipse(haloCenterX + 28, haloCenterY + 95, 55, 60);

//BOTTOM LIPS
beginShape();
curveVertex(haloCenterX - 25, haloCenterY + 125);
curveVertex(haloCenterX - 25, haloCenterY + 125);
curveVertex(haloCenterX, haloCenterY + 150);
curveVertex(haloCenterX + 25, haloCenterY + 125);
curveVertex(haloCenterX + 25, haloCenterY + 125);
endShape();

//NOSTRILS
stroke(100, 100, 100);
fill(100, 100, 100);

beginShape();
curveVertex(haloCenterX, haloCenterY + 90);
curveVertex(haloCenterX, haloCenterY + 90);
curveVertex(haloCenterX + 15, haloCenterY + 55);
curveVertex(haloCenterX + 30, haloCenterY + 55);
curveVertex(haloCenterX + 50, haloCenterY + 80);
curveVertex(haloCenterX + 30, haloCenterY + 75);
curveVertex(haloCenterX, haloCenterY + 95);
curveVertex(haloCenterX, haloCenterY + 95);
endShape();

beginShape();
curveVertex(haloCenterX, haloCenterY + 95);
curveVertex(haloCenterX, haloCenterY + 95);
curveVertex(haloCenterX - 15, haloCenterY + 55);
curveVertex(haloCenterX - 30, haloCenterY + 55);
curveVertex(haloCenterX - 50, haloCenterY + 80);
curveVertex(haloCenterX - 30, haloCenterY + 75);
curveVertex(haloCenterX, haloCenterY + 95);
curveVertex(haloCenterX, haloCenterY + 95);
endShape();
                
