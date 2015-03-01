
size(300,300);
//strokeWeight(.3);
noStroke();
for (int y = 0; y < 300; y += 10) {
for (int x = 0; x < 300; x += 10) {
fill((x * 1.2), y + 100);
ellipse(x,y,35,10);
//rect(x, y, 50, 10);
}
}


