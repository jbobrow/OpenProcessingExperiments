
void setup () {
size (400, 600);
background (255);
smooth();
noStroke();
}
void draw () {
for (int x = 0; x<width; x +=10) {
for (int y = 0; y<height; y+=40) {
fill (200, random(255), random(255),20);//set a random color
rect (x, y, 20, 100);
}
}
}

