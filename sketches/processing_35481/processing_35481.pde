
void setup () {
size (500, 500);
}

void draw () {
background (9, 98, 142);
float x = mouseX;
float y = mouseY;
fill (122, 119, 240);
ellipse (mouseX, mouseY, 100, 100);

strokeWeight (10);
stroke (245, 126, 35);
line (x+200, y-240, x+100, y-280);
stroke (21, 90, 6);
line (x+240,y- 160, x+160, y-260);
stroke (71, 173, 49);
line (x+200, y-80, x+240, y-260);
stroke (207, 162, 232);
line (x+80, y-60, x+160, y-110);
stroke (250, 28, 69);
line (x+240, y-200, x+160, y-160);
stroke (250, 236, 78);
line (x+ 120, y-200, x+230, y- 320);
stroke (20, 14, 203);
line (x+ 100, y-240, x+220, y- 340);
}

