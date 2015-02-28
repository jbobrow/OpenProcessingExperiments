
size(640, 360);
smooth();
noStroke();

// top shape
fill(13, 19, 28);
beginShape();
vertex(0, 174);
vertex(0, 0);
vertex(640, 0);
vertex(640, 174);
vertex(597, 174);
vertex(597, 121);
vertex(53, 121);
vertex(53, 174);
endShape(CLOSE);

// bottom shape
int x = 597;
int y = 174;
int a = 640;
int b = 360;
int c = 205;
int d = 53;
int e = 0;

fill(23, 0, 0);
beginShape();
vertex(e, y);
vertex(e, b);
vertex(a, b);
vertex(a, y);
vertex(x, y);
vertex(x, c);
vertex(d, c);
vertex(d, y);
endShape(CLOSE);

// middle shape
fill(255);
stroke(255);
strokeWeight(6);
strokeJoin(BEVEL);
rect(53, 121, 544, 84);

// mid-line
strokeWeight(2);
line(0, 174, 640, 174);

// white lines
strokeWeight(3);
strokeCap(SQUARE);

line(72, 0, 72, 360); 
line(99, 16, 99, 299);
line(176, 74, 176, 265);
line(192, 103, 192, 168); 
line(245, 91, 245, 281);
line(287, 205, 287, 339);
line(320, 86, 320, 224);
line(345, 110, 345, 260);
line(360, 200, 360, 241);
line(376, 98, 376, 282);
line(409, 40, 409, 256);
line(490, 65, 490, 322); 
line(547, 200, 547, 249); 

// triangles
noStroke();
fill(255);
triangle(54, 160, 54, 174, 40, 174);
triangle(99, 100, 132, 147, 99, 147);
triangle(409, 74, 446, 121, 409, 121);
triangle(447, 205, 489, 205, 489, 258);
triangle(597, 174, 610, 174, 589, 197);

// structure
stroke(51, 34, 39);
strokeCap(SQUARE);
strokeWeight(5);

line(72, 118, 72, 208); 
line(100, 125, 100, 153); 
line(109, 125, 109, 188); 
line(176, 149, 176, 187);
line(176, 193, 176, 203);
line(245, 118, 245, 159);
line(287, 136, 287, 159);
line(287, 182, 287, 208);
line(320, 182, 320, 200);
line(360, 165, 360, 203); 
line(376, 133, 376, 184); 
line(411, 125, 411, 164);
line(419, 125, 419, 200);
line(428, 186, 428, 200); 
line(443, 127, 443, 136); 
line(443, 148, 443, 186); 
line(443, 192, 443, 200); 
line(454, 136, 454, 186); 
line(466, 136, 466, 210); 
line(479, 200, 479, 210); 
line(490, 126, 490, 135); 
line(547, 150, 547, 199); 

// circles

int r = 6;

fill(51, 34, 39);
noStroke();
ellipse(192, 168, r, r);
ellipse(245, 168, r, r);
ellipse(245, 176, r, r);
ellipse(287, 168, r, r);
ellipse(320, 168, r, r);
ellipse(345, 168, r, r);
ellipse(376, 127, r, r);
ellipse(490, 147, r, r);
ellipse(490, 168, r, r);
