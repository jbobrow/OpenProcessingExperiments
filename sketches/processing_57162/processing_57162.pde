
int option = 1;

void setup() {

size(400, 300);

smooth();

noFill();

}



void draw() {

background(255,219,10);



if (option == 1) {

// Option 1: Stitches

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x-685, y-765, x+555, y+678);

line(x+5, y-5, x-5, y+5);

}

}

} 

else if (option == 2) {

// Option 2: Perspective

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x, y, width/1, height/2);
line(y, x, width/4, height/4);
}

}

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

ellipse(x, y, 650, 530);
ellipse(x, y, 450, 345);
}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs

int count = 120;

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

float s = map(count, 120, 0, 0, TWO_PI*2);

arc(x, y, 514, 514, s, s + PI);


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
line(x + i, y, x + i, y + 2);
}
line(x, y, x + 712, y + 2);
}
}
}
else if (option == 6) {
rect(10, 10 ,25, 25);
}
}



void mousePressed() {

option++;

if (option > 6) option = 1;

}
