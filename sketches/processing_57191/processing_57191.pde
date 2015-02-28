
int option = 1;

void setup() {

size(400, 300);

smooth();

noFill();

}



void draw() {

background(255);



if (option == 1) {

// Option 1: Stitches

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x-5, y-5, x+5, y+5);

line(x+5, y-5, x-5, y+5);

}

}

}

else if (option == 2) {

// Option 2: Perspective

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

line(x, y, width/2, height/2);

}

}

}

else if (option == 3) {

// Option 3: Overlapping circles

for (int x = 50; x <= width-50; x += 20) {

for (int y = 50; y <= height-50; y+=20) {

ellipse(x, y, 40, 40);

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
}
line(x, y, x + 12, y + 12);
}
}
}

else if (option == 6) {
  
for (int x = 50; x < width-50; x += 20) {
for (int y = 50; y < height-50; y+=20) {
rect(x-10, y-10, 22, 22);
for (int i = 0; i < 16; i+=4) {
line(x-9, y-5, x+10, y+9);
line(x+9, y-5, x-10, y+9);
}
}
}
}

else if (option == 7) {
  for (int x = 5; x < width-5; x += 10) {
    for (int y = 5; y < height-5; y += 5) {
      line(x, y, x + 10, y + 10);
    }
  }
}

else if (option == 8) {
  for (int x = 5; x < width-5; x +=10) {
    for (int y = 5; y < height-5; y +=10) {
    ellipse(x, x, 40, 40);
    line(x, y, x + 10, y + 10);
    ellipse(x+60, x, 40, 40);
    ellipse(x+120, x, 40, 40);
    ellipse(x+240, x, 40, 40);
    ellipse(x+180, x, 40, 40);
    ellipse(x+300, x, 40, 40);
    ellipse(x+360, x, 40, 40);
    ellipse(x-60, x, 40, 40);
    ellipse(x-120, x, 40, 40);
    ellipse(x-180, x, 40, 40);
    ellipse(x-240, x, 40, 40);
    ellipse(x-300, x, 40, 40);
    ellipse(x+410, x, 40, 40);
  }
  }
}

else if (option == 9) {
  for (int x = 5; x < width-5; x +=10) {
    for (int y = 5; y < height-5; y +=10) {
    ellipse(x, x, 40, 40);
    ellipse(x+60, x, 40, 40);
    ellipse(x+120, x, 40, 40);
    ellipse(x+240, x, 40, 40);
    ellipse(x+180, x, 40, 40);
    ellipse(x+300, x, 40, 40);
    ellipse(x+360, x, 40, 40);
    ellipse(x-60, x, 40, 40);
    ellipse(x-120, x, 40, 40);
    ellipse(x-180, x, 40, 40);
    ellipse(x-240, x, 40, 40);
    ellipse(x-300, x, 40, 40);
    ellipse(x+410, x, 40, 40);
    
    }
  }
}

else if (option == 10) {
  
  for (int x = 5; x < width-5; x +=10) {
    for (int y = 5; y < height-5; y +=10) {
      ellipse (x,y,40,10);
    }
  }
}

else if (option == 11) {
  
  for (int x = 50; x < width-50; x +=20) {
    for (int y = 50; y < height-50; y +=20) {
      ellipse (x,y,40,10);
    }
  }
}

else if (option == 12) {
  
  for (int x = 50; x < width-50; x +=20) {
    for (int y = 50; y < height-50; y +=20) {
      ellipse (x,y,10,40);
    }
  }
}



else if (option == 13) {
  
  for (int x = 50; x < width-50; x +=20) {
    for (int y = 50; y < height-50; y +=20) {
      ellipse (x,y,40,10);
      ellipse (x,y,10,40);
    }
  }
}

}



void mousePressed() {

option++;

if (option > 13) option = 1;

}

