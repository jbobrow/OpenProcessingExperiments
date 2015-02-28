
void setup () {
size (400, 600);
background (255);
smooth();
}
void draw () {
//use a mouse press to run the program
if (mousePressed) {
//use two for loops to fill the pattern
for (int x = 0; x<=width; x +=10) {
for (int y = 0; y<=height; y+=20) {
fill (200, random (255), random(255), random (80,100));//set a random color
noStroke ();
ellipse (x, y, 20, 20);
}
}
if (key =='s') {
saveFrame();
}
}
}

                
                                                
