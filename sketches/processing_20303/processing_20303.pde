
void setup () {
size (400, 600);
background (255);
smooth();
}
void draw () {
//use a mouse press to run the program

//use two for loops to fill the pattern
for (int x = 5; x<width; x +=5) {
for (int y = 5; y<height; y+=5) {

  fill (random(255),50);//set a random color

ellipse (x, y, random (10), random (10));
noStroke();

//if s is pressed, save a frame
if (key =='s') {
saveFrame();
} 
}
}
}


