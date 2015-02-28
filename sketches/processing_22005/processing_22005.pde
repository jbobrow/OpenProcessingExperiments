
float r1 = 150; // radius value
float r = 50; // radius value
float theta = 0;
void setup () {
size (400, 400);
background (255);
smooth();
}
void draw () {
// polar to cartesian conversion
noStroke ();
fill (0, 20);
rect (0, 0, width, height);
float x = r*cos(theta); //add random values to jitter
float y = r* sin (theta); //add random values to jitter
//draw an ellipse at x, y
noStroke ();
int s = second(); // call the second value
stroke(map (s, 0, 59, 0, 255), 120, 240-map(s, 0, 59, 0, 240)); // map the second value change color over time
noFill();
strokeWeight (.5);
ellipse (width/2+x-75 , height/2 + y, 50, 50);
ellipse (width/2+x+75 , height/2 + y, 50, 50);
ellipse (width/2+x+75 , height/2 + y-50, 50, 50);
ellipse (width/2+x+75 , height/2 + y+50, 50, 50);
ellipse (width/2 +x, height/2 + y, 50, 50);
ellipse (width/2+x-75 , height/2 + y+50, 50, 50);
ellipse (width/2+x-75 , height/2 + y-50, 50, 50);
float x1 = r1*cos(theta); //add random values to jitter
float y1 = r1* sin (theta); //add random values to jitter
ellipse (width/2 +y1, height/2 + x1, 50, 50);
stroke(map (s, 0, 59, 0, 255), 120, 240-map(s, 0, 59, 0, 240)); // map the second value change color over time
noFill();
strokeWeight (.5);
ellipse (width/2 +x1, height/2 + y1, 50, 50);
//increment the angle
theta += .05; //increase this value to go faster
}
                
