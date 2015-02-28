
// Josh Newby jnewby@andrew.cmu.edu copyright Josh Newby 2013 Pittsburgh PA
// This program makes Jim Robert's head and face look around with respect to the mouse cords. 
// clicking the mouse makes his face speed off.

float x, y, wd, ht, easingCoefficient;

void setup()
{
size (400, 400);

x = 40;
y = 80;
wd = 320;
ht = 280;

noFill( );
smooth();
ellipseMode(CENTER);
 
  easingCoefficient = .05;
}

void draw()
{
  background(10, 20, 30);
  fill(40, 90, 60);
  noStroke();
  ellipse (mouseX, mouseY, 1.75 * wd, 1.75 * ht);
  noFill();
  stroke(30, 60, 40);
  figure (x, y, wd, ht);

  
  float dx = mouseX - x - .5 * wd;
  float dy = mouseY - y - .5 * ht;
  
  
  x = x + ( dx * easingCoefficient );
  y = y + ( dy * easingCoefficient );
  
    if (mousePressed == true)
 {
  x = x * 1.1;
  y = y * 1.2;
 }
}

// Jim Roberts' Face
void figure (float fx , float fy, float fwd, float fht)
{

// straigt lines on glasses
line(x + .0625 * wd, y, x + .9375 * wd, y);
line(x + 7 * .0625 * wd, y + .0714 * ht, x + 9 * .0625 * wd, y + .0714 * ht);
line(x + .0625 * wd, y, x + .0626 * wd, y + 2 * .0714 * ht);
line(x + 7 * .0625 * wd, y, x + 7 * .0626 * wd, y + 2 * .0714 * ht);
line(x + 9 * .0625 * wd, y, x + 9 * .0626 * wd, y + 2 * .0714 * ht);
line(x + 15 * .0625 * wd, y, x + 15 * .0626 * wd, y + 2 * .0714 * ht);

// left lens curve
beginShape();
curveVertex(x + .5 * .0625 * wd, y);
curveVertex(x + .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 2 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 4 * .0625 * wd, y + 4 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 7 * .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 7.5 * .0625 * wd, y);
endShape();

// right lens curve
beginShape();
curveVertex(x + 8.5 * .0625 * wd, y);
curveVertex(x + 9 * .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 12 * .0625 * wd, y + 4 * .0714 * ht);
curveVertex(x + 14 * .0625 * wd, y + 3.5 * .0714 * ht);
curveVertex(x + 15 * .0625 * wd, y + 2 * .0714 * ht);
curveVertex(x + 15.5 * .0625 * wd, y);
endShape();

strokeWeight(6);

// nose curves
beginShape();
//curveVertex(x + 8 * .0625 * wd, y + 4 * .0714 * ht);
curveVertex(x + 7 * .0625 * wd, y + 5 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 8 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 9 * .0625 * wd, y + 5 * .0714 * ht);
//curveVertex(x + 8 * .0625 * wd, y + 4 * .0714 * ht);
endShape();

beginShape();
curveVertex(x + 7 * .0625 * wd, y + 5.5 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 5 * .0714 * ht);
curveVertex(x + 5 * .0625 * wd, y + 6 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 7 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

beginShape();
curveVertex(x + 9 * .0625 * wd, y + 5.5 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 5 * .0714 * ht);
curveVertex(x + 11 * .0625 * wd, y + 6 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

// mustache
line(x, y + 13 * .0714 * ht, x + wd, y + 13 * .0714 * ht);
beginShape();
curveVertex(x, y + 16 * .0714 * ht);
curveVertex(x, y + 13 * .0714 * ht);
curveVertex(x + 2 * .0625 * wd, y + 9 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

beginShape();
curveVertex(x + wd, y + 16 * .0714 * ht);
curveVertex(x + wd, y + 13 * .0714 * ht);
curveVertex(x + 14 * .0625 * wd, y + 9 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 7 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 7 * .0714 * ht);
endShape();

//mouth
beginShape();
curveVertex(x + 5 * .0625 * wd, y + 15 * .0714 * ht);
curveVertex(x + 6 * .0625 * wd, y + 14.5 * .0714 * ht);
curveVertex(x + 8 * .0625 * wd, y + 14 * .0714 * ht);
curveVertex(x + 10 * .0625 * wd, y + 14.5 * .0714 * ht);
curveVertex(x + 11 * .0625 * wd, y + 15 * .0714 * ht);
endShape();

}
