
int option = 1;

void setup() {

size(600, 700);

smooth();

noFill();

}




void draw() {

background(224, 201, 201);



if (option == 1) {

// Option 1: Stitches

for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {

line(x-20, y-20, x+20, y+20);

line(x+5, y-5, x-5, y+5);


}

}

} 

else if (option == 2) {

// Option 2: Perspective

for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {

line(x-5, y-5, x+5, y+5);

line(x+100, y-115, x-115, y+100);


}

}

} 

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {

line(x-55, y-55, x+55, y+55);

line(x+40, y-50, x-40, y+50);


}

}

} 

else if (option == 4) {

// Option 4: Rotating arcs

for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {



line(x+40, y-50, x-40, y+50);

line(x+10, y-60, x-10, y+60); 


}

}

} 

else if (option == 5) {

for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {

line(x-2, y-2, x+2, y+2);

line(x+40, y-50, x-40, y+50);

}
}
}


else if (option == 6) {

for (int x = 100; x <= width-100; x += 40) {

for (int y = 100; y <= height-100; y+=40) {

line(x-20, y-20, x+20, y+20);

line(x+1, y-50, x-20, y+50);

}
}
}

else if (option == 7) {

for (int x = 100; x <= width-100; x += 50) {

for (int y = 100; y <= height-100; y+=50) {

line(x-6, y-8, x+6, y+8);


line(x-16, y-76, x+16, y+76);


line(x-1, y-8, x-1, y+8);

}
}
}
}

void mousePressed() {

option++;

if (option > 7) option = 1;

}
