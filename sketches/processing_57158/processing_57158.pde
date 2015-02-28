
int option = 1;

void setup() {

size(400, 300);

smooth();

noFill();

}



void draw() {

background(123);



if (option == 1) {

// Option 1: Stitches

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x-5, y-9, x+2, y+7);

line(x+2, y-9, x-5, y+7);
line(x+6, y-34, x-23, y+56);
line(x+90, y+23, x-56, y-89);
line(x+12, y-4, x+7, y+34);

}

}

} 

else if (option == 2) {

// Option 2: Perspective

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x, y, width/2, height/2);
line(x, y, width/6, height/6);
line(x, y, width/19, height/19);
line(y, x, width/-34, height/-34);
line(y, x, width/78, height/78);
}

}

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 50; x <= width-50; x += 20) {

for (int y = 90; y <= height-50; y+=30) {
ellipse(x, 90, 78, 56);
ellipse(x, 78, 40, 40);
ellipse(x,65,34,67);
ellipse(y, 89, 200, 78);
ellipse(y,189,234,78);
ellipse(x,76,123,134);
ellipse(x, 200,200,200);
ellipse(x,300,300,300);
ellipse(y,600,600,500);
ellipse(x,489,23,56);
}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs

int count = 120;

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

float s = map(count, 120, 0, 0, TWO_PI*2);

arc(x, y, 14, 14, s, s + PI);
arc(x,y, 34, 34, s, s + PI);
arc(x, y, 56, 56, s, s + PI);
arc(x, y, 89, 89, s, s + PI);
arc(x, y, 109, 109, s, s + PI);
arc(x, y, 200, 200, s, s + PI);
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
line(x + i, y, x + i, y + 12);
line(x + i, y, x + i, y + 56);
line(x + i, y, x + i, y + 98);
line(x, y ,78,89);
line(x, y ,200, 200);
line(x, y, 189, 189);
}
line(x, y, x + 12, y + 12);
line(x, y, x + 45, y + 45);
line(x, y, x + 78, y + 78);

}
}
}
else if (option == 6) {
rect(90, 50 ,25, 95);
rect(43, 56, 89, 34);
rect(78, 90, 79, 65);
rect(99,98,96,68);
rect(198,78,87,69);
rect(98,23,56,78);
rect(500,500,500,500);
}
}



void mousePressed() {

option++;

if (option > 6) option = 1;

}
