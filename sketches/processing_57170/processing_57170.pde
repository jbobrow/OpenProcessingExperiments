
int option = 1;

void setup() {

size(500, 500);

smooth();



}

void draw() {

background(202,255,90);

if (option == 1) {

// Option 1: Stitches

for (int x = 50; 
x <= width-50; 
x += 100) {

for (int y = 50;
y <= height-50;
y+=60) {
fill (208,90,255);
ellipse(x-5, y-5, 40, 40);
noStroke();
fill (90,255,245);
ellipse(x+5, y-5,40, 40);

}

}

} 

else if (option == 2) {

// Option 2: Perspective

for (int x = 50; 
x <= width-50; 
x += 5) {

for (int y = 50;
y <= height-50;
y+=100) {
  
stroke(0);
line(x, y, width/2, height/2);

}

}

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 50; 
x <= width-50; 
x += 100) {

for (int y = 50;
y <= height-50;
y+=60) {
noStroke();
fill(103,90,255);
ellipse(x, y, 5, 5);

}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs

int count = 120;

for (int x = 50;
x <= width-50;
x += 20) {

for (int y = 50;
y <= height-50;
y+=20) {

float s = map(count, 160, 0, 0, TWO_PI*2);
stroke (90,127,255);
fill (255,90,129);
arc(x, y, 20, 20, s, s + PI);

count--;

}

}

} 

else if (option == 5) {

// Option 5: Groups of fiv
for (int x = 50;
x < width-50;
x += 80) {
  
for (int y = 50;
y < height-50; 
y+=80) {
  
//rect(x-10, y-10, 22, 22);
for (int i = 0; i < 25; i+=5) {
fill (255,137,90);
rect(x + i, y, 20,20);
fill (108,255,251);
rect (x+i,y+i,30,30);
fill (252,255,108);
rect (x-i, y-i, 40,40);
}

}
}
}
else if (option == 6) {
fill( 252,238,76);
ellipse(250, 250 ,200, 200);
noStroke();
fill(0);
ellipse (250,270,80,80);
ellipse (220,200,30,30);
ellipse (280,200,30,30);
}
}

void mousePressed() {

option++;

if (option > 6) option = 1;

}
