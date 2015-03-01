

background (127,200,219);

for (int i = 0; i < 100; i += 2) {
stroke(0-i);
line(i, 0, i, 200);
stroke(102,122,227,125-i);

}
stroke(246,31,160,20);
strokeWeight(25);
for (int y = 20; y <= 85; y += 5) 

{
if (y <= 50) {
line(20, y, 60, y);
line(70, y, 100, y);
line(0, y-20, 20, y);
} else {
line(y, 40, y, 80);
line(y, 0, y, 30);
line(y,80, y-20, 100);
}
}


