
int option = 1;

void setup() {

size(400, 300);

smooth();

noFill();

}



void draw() {

background(94,255,3);



if (option == 1) {

// Option 1: Stitches

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x-90, y-5, x+90, y+5);

line(x+5, y-90, x-5, y+90);



}

}

} 

else if (option == 2) {

// Option 2: Perspective

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x, y, width/2, height/89);
ellipse(x,y,98,89);
}

}

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

ellipse(x, y, 460, 460);

}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs

int count = 120;

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

float s = map(count, 120, 0, 0, TWO_PI*2);

arc(x, y, 314, 314, s, s + PI);
arc(x, y, 89, 89, s, s + PI);
arc(x, y, 56,57,s,s + PI);
arc(y, x, 12, 34, s, s + PI);

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
line(x + i, y, x + i, y + 132);
}
line(x, y, x + 2, y + 432);
line(y, x, x + 4, y + 567);
line(y, x, x + 7, y - 87);
line(x, y, y +76, x + 97);
}
}
}
else if (option == 6) {
rect(160, 10 ,625, 625);
rect(160, 45, 768, 87);
rect(190, 76, 23, 90);
}
}



void mousePressed() {

option++;

if (option > 6) option = 1;

}
