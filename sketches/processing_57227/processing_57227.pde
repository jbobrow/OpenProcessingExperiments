
int option = 1;

void setup() {

size(300, 400);

smooth();


}

void draw() {

background(255);



if (option == 1) {

// Option 1: Stitches
int count = 120;

for (int x = 50; x <= width-50; x += 10) {

for (int y = 50; y <= height-50; y+=10) {

float s = map(count, 120, 0, 0, TWO_PI*2);

line (x,y,y,x);

line (s,y,s,x);

fill (s,x,y);
triangle(x, y, 5, 5, s, s + PI);
}

}

}


else if (option == 2) {

// Option 2: Perspective
int count = 120;

for (int x = 50; x <= width-50; x += 10) {

for (int y = 50; y <= height-50; y+=10) {
  
fill (x,0,0);

ellipse( x, y, 10, 10);

count--;

}
}

} 

else if (option == 3) {

// Option 3: Overlapping circles
for (int x = 50; x <= width-50; x += 10) {

for (int y = 50; y <= height-50; y+=10) {

fill (200,y,0);
rect (6+y,6+x,5,5);
rect (x,y,5,5);
}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs
smooth ();

for (int x = 0; x <= width; x += 10) {

for (int y = 0; y <= height; y+=10) {

  fill (x,0,x);
  
ellipse(x,y,12,12);




}

}

} 

else if (option == 5) {

// Option 5: Groups of fiv
for (int x = 0; x <= width; x += 20) {

for (int y = 0; y <= height; y+=20) {

  fill (x,y,10);
  
ellipse(x, y, 20, 20);

fill (0);

ellipse(x,y,10,10);

fill (y,60,x);

rect (x,y,5,5);
}
}
}

else if (option == 6) {
for (int x = 50; x < width-50; x += 20) {
for (int y = 50; y < height-50; y+=20) {
//rect(x-10, y-10, 22, 22);
for (int i = 0; i < 16; i+=4) {
rect(x + i, y, x + i, y + 12);
fill (33,x,y);
ellipse(x, y, 10, 10);
}
}

}

}
}
void mousePressed() {

option++;

if (option > 6) option = 1;

}


