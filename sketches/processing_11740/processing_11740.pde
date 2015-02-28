
/**
Reddit Alien from http://www.reddit.com/
Created by Jon Scheiber using Processing
September 7th, 2010
http://ic.sunysb.edu/stu/jscheiber/
*/

void setup()
{
size (300, 400); // 300 pixels wide, 400 pixels high.
smooth(); //tuns on anti-aliasing
}

void draw()
{
background(200, 230, 255); // change canvas color to light blue
stroke(0);
strokeWeight(6); // change stroke weight to 6

fill(255); // make fill color white
ellipse(110, 242, 50, 80); // left arm
ellipse(190, 242, 50, 80); // right arm

arc(115, 329, 50, 40, PI, TWO_PI-PI/2); // left foot 1
arc(115, 329, 50, 40, TWO_PI-PI/2, TWO_PI); // left foot 2

arc(185, 329, 50, 40, PI, TWO_PI-PI/2); // right foot 1
arc(185, 329, 50, 40, TWO_PI-PI/2, TWO_PI); // right foot 2

ellipse(150, 250, 90, 160); // body

ellipse(75, 125, 40, 40); // left ear
ellipse(225, 125, 40, 40); // right ear

line(150, 100, 170, 50); // antenna 1
line(170, 50, 210, 60); // antenna 2
ellipse(220, 65, 30, 30); // antenna bulb

ellipse(150, 150, 170, 110); // head

noFill(); // turn off fill for smile
strokeWeight(6); // change stroke weight back to 6
arc(150, 175, 60, 15, PI/2, PI); // smile left
arc(150, 175, 60, 15, 0, PI/2); // smile right

line(90, 330, 210, 330); // foot line

fill(255, 69, 0); // change fill color to red
noStroke(); // change stroke weight to 0
ellipse(120, 140, 30, 30); // left eye
ellipse(180, 140, 30, 30); // right eye
}

