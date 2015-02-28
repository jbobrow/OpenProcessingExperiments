
size(400,400);

for (int y = 0; y < 400; y += 10) {
for (int x = 0; x < 400; x += 10) {
ellipse (x,y, 10, 10);
rect(x, y, 100, 100);
line(x, y, x+10, y+10);
line(x+10, y, x, y+10);


} 
}


