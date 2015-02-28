
//Head
size(500,500);
fill(24,170,25);
noStroke();
ellipse(250,250,250,250);
//Eye
translate(100,150);
fill(255,255,255);
ellipse(150,50,100,100);
pushMatrix();
//Pupil
translate(50,75);
fill(16,125,196);
ellipse(100,-30,50,50);
fill(255,183,75);
//Mouth
arc(88,89, 80, 80, 0, PI+QUARTER_PI, PIE);
//horn
translate(0,-150);
fill(24,170,25);
triangle(30, 75, 58, 20, 86, 75);
//horn2
translate(70,0);
triangle(30, 75, 58, 20, 86, 75);
popMatrix();
//eyelid





