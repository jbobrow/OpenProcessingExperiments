
void setup () {
size (400, 600);
background (0);
smooth();
}
void draw () {
//use a mouse press to run the program

//use two for loops to fill the pattern
for (int x = 200; x<width; x +=30) {
for (int y = 5; y<height; y+=5) {

  fill (random(80), random(10), random(90),50);//set a random color
rect (x, y, random (10), random (10));
noStroke();


//if s is pressed, save a frame
if (key =='s') {
saveFrame();
} 
}
}
}


