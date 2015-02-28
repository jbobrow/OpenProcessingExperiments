
size(400,400);
background(255);
smooth();

int y = height;       // Vertical location of each line
int spacing = 25; // How far apart is each line
int len = 200;     // Length of each line

// Translation of the legs while loop to a for loop.
for (int x = 50; x <= width; x += spacing) { 
  line(width-x,height-y,x,y + len);
}
       

stroke(150, 125);
for (int x = 60; x <= width; x += spacing-5) { 
  line(width-x,height-y,x,y + len);
}

stroke(55, 125);
for (int x = 55; x <= width; x += spacing+7) { 
  line(width-x,height-y,x,y + len);
}

stroke(235, 240, 31, 125);
for (int x = 55; x <= width; x += spacing+2) { 
  line(width-x,height-y,x,y + len);
}

