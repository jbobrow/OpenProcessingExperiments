
size(400,400);
background(255);

int y = height-150;       // Vertical location of each line
int spacing = 15; // How far apart is each line
int len = 50;     // Length of each line

// Translation of the legs while loop to a for loop.
for (int x = 50; x <= 200; x += spacing) { 
  line(x,y,x,y + len);
}
       

stroke(150);
for (int x = 60; x <= 200; x += spacing-5) { 
  line(x,y,x,y + len);
}

stroke(90, 193, 39);
for (int x = 55; x <= 200; x += spacing+7) { 
  line(x,y,x,y + len);
}

stroke(235, 240, 31);
for (int x = 55; x <= 200; x += spacing+2) { 
  line(x,y,x,y + len);
}

