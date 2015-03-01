
//Variables are declared at the top of the program.
int circleX, circleY;
 
int x, y;
 
//This is a setup function:
void setup() {
 
size(1000, 1000);
 
smooth(8);
background(#1BDB1C);
 
}
 
//This is a draw function:
void draw() {
 
x = mouseX;
 
y = mouseY;
 
quadCircle(250, 250, x, 186, 175, 144, 56);
 
quadCircle(750, 250, x, 175, 199, 144, 56);
 
quadCircle(250, 750, x, 186, 97, 175, 199);
 
quadCircle(750, 750, x, 186, 65, 144, 199);
quadCircle(750, 750, x, 186, 65, 144, 199);
}
 
void quadCircle(int circleX, int circleY, int size, int red, int green, int blue, int alpha) {
 
fill(#FFFFFF);
 
line(circleX, circleY, size, size);
 
ellipse(circleX + size/4, circleY + size/4, size/4, size/4);
 
ellipse(circleX + size/4, circleY - size/4, size/4, size/4);
 
ellipse(circleX - size/4, circleY - size/4, size/4, size/4);
 
ellipse(circleX - size/4, circleY + size/4, size/4, size/4);
ellipse(circleX - size/4, circleY + size/4, size/4, size/4);
}
