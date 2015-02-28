
 
size(300, 300);
background(255);
 
float x = 70;
 
for (int y = 40; y <= width-40; y = y + 3) {
  line(x, y, x+50, y);
}
 
x = 200;
 
for (int y = 10; y <= width-40; y = y + 3) {
  line(x, y, x+10, y);
}


