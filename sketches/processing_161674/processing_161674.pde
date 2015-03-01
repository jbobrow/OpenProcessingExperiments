
size(1180, 500);
background(255);
smooth();
fill(55);
stroke(1);
for (int y = 10; y <= height+10; y += 50) {
 for (int x = 0; x <= width-10; x += 10) {
    ellipse(x, y, 100, 1);
 // Draw a line to the center of the display
 
 line(x, y, 2170, 300);
 }
}

