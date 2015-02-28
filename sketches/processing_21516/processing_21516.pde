
float speed = 2.5;
float y = 200;
void setup () {
size (200, 400);
smooth();
}
void draw () {
 
background (0);
 
//TOP
strokeWeight (10);
stroke(120-y,9+y,250+y);
for (int i =1; i <5; i++) {line (200, 1, y, y);
}
strokeWeight (9.5);
for (int i =-1; i <5; i++) {line (150, 0, y, y);
}

strokeWeight (9);
for (int i =-1; i <5; i++) {line (50, 0, y, y);
}
strokeWeight (8.5);
for (int i =-1; i <5; i++) {line (100, 0, y, y);
}
strokeWeight (8);
for (int i =1; i <5; i++) {line (1, 1, y, y);
}

//LEFT SIDE
strokeWeight (7.5);
for (int i =1; i <5; i++) {line (1, 50, y, y);
}
strokeWeight (7);
for (int i =1; i <5; i++) {line (1, 100, y, y);
}
strokeWeight (6.5);
for (int i =1; i <5; i++) {line (1, 150, y, y);
}
strokeWeight (6);
for (int i =1; i <5; i++) {line (1, 200, y, y);
}
strokeWeight (5.5);
for (int i =1; i <5; i++) {line (1, 250, y, y);
}
strokeWeight (5);
for (int i =1; i <5; i++) {line (1, 300, y, y);
}
strokeWeight (4.5);
for (int i =1; i <5; i++) {line (1, 350, y, y);
}


//BOTTOM
strokeWeight (9.5);
for (int i =1; i <5; i++) {line (1, 400, y, y);
}
strokeWeight (9);
for (int i =-1; i <5; i++) {line (50, height, y, y);
}
strokeWeight (8.5);
for (int i =-1; i <5; i++) {line (100, height, y, y);
}
strokeWeight (8);
for (int i =-1; i <5; i++) {line (150, height, y, y);
}
strokeWeight (7.5);
for (int i =-1; i <5; i++) {line (200, height, y, y);
}


//RIGHT SIDE
for (int i =-1; i <5; i++) {line (y, y, 200, 50);
}
for (int i =-1; i <5; i++) {line (y, y, 200, 100);
}
for (int i =-1; i <5; i++) {line (y, y, 200, 150);
}
for (int i =-1; i <5; i++) {line (y, y, 200, 200);
}
for (int i =-1; i <5; i++) {line (y, y, 200, 250);
}
for (int i =-1; i <5; i++) {line (y, y, 200, 300);
}
for (int i =-1; i <5; i++) {line (y, y, 200, 350);
}

y = y+speed;
;
 
if ((y>width) || (y<0)) {
speed = speed *-1;
}
}

