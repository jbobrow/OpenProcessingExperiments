
int option = 1;

void setup() {

size(400, 300);

smooth();

noFill();

}



void draw() {

background(255,167,220);



if (option == 1) {

// Option 1: Stitches

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x-5, y-500, x+5, y+5);

line(x+5, y-5, x-5, y+5);

}

}

} 

else if (option == 2) {

// Option 2: Perspective

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x, y, width/100, height/2);
line(x, y, width/899, height/208);
line(y, x, width/990, height/180);

}

}

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

ellipse(x, y, 80, 170);

}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs

int count = 120;

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

float s = map(count, 120, 0, 0, TWO_PI*2);

arc(x, y, 654, 314, s, s + PI);

count--;

}

}

} 

else if (option == 5) {

// Option 5: Groups of fiv
for (int x = 50; x < width-50; x += 20) {
for (int y = 50; y < height-50; y+=20) {
//rect(x-10, y-10, 22, 22);
for (int i = 0; i < 16; i+=4) {
line(x + i, y, x + i, y + 512);
ellipse(x, y, 67, 543);
}
line(x, y, x + 312, y + 612);
}
}
}
else if (option == 6) {
rect(56, 10 ,25, 25);
rect(56, 10, 78, 45);

}
}



void mousePressed() {

option++;

if (option > 6) option = 1;

}
