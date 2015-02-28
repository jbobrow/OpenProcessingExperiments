
void setup () {

size (600, 600);
background (0);
smooth();

}

void draw () {

//use a mouse press to run the program

//if (mousePressed) {

//use two for loops to fill the pattern
for (int x = 10; x<width+50; x +=10) {

for (int y = 10; y<height+50; y+=20) {
fill (255, random(255),255);//set a random color
rect (x, y, 20,20);
fill (random(200), random(50), random(109));
ellipse (x,y,10,10);
fill (random(200), random(0), random(109));
ellipse (x,y,10,10);
//stroke (random(230,4), random(120,100), random(130,60));
//line (x,y,20,40);
//}
}

}

}
