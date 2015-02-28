
// Nema Rao 
// pmrao
// copyright Nema Rao 2013

size (400, 400);
background (240);

//grid vertical
stroke (220);
line (20, 0, 20, 400);
line (40, 0, 40, 400);
line (60, 0, 60, 400);
line (80, 0, 80, 400);
line (100, 0, 100, 400);
line (120, 0, 120, 400);
line (140, 0, 140, 400);
line (160, 0, 160, 400);
line (180, 0, 180, 400);
line (200, 0, 200, 400);
line (220, 0, 220, 400);
line (240, 0, 240, 400);
line (260, 0, 260, 400);
line (280, 0, 280, 400);
line (300, 0, 300, 400);
line (320, 0, 320, 400);
line (340, 0, 340, 400);
line (360, 0, 360, 400);
line (380, 0, 380, 400);
line (400, 0, 400, 400);

// grid horizontal
line (0, 20, 400, 20);
line (0, 40, 400, 40);
line (0, 60, 400, 60);
line (0, 80, 400, 80);
line (0, 100, 400, 100);
line (0, 120, 400, 120);
line (0, 140, 400, 140);
line (0, 160, 400, 160);
line (0, 180, 400, 180);
line (0, 200, 400, 200);
line (0, 220, 400, 220);
line (0, 240, 400, 240);
line (0, 260, 400, 260);
line (0, 280, 400, 280);
line (0, 300, 400, 300);
line (0, 320, 400, 320);
line (0, 340, 400, 340);
line (0, 360, 400, 360);
line (0, 380, 400, 380);

// N left most
strokeWeight (2);
stroke (0, 0, 200, 100);
line (60, 100, 60, 300);
line (65, 100, 65, 300);
line (70, 100, 70, 300);
line (75, 100, 75, 300);
line (80, 100, 80, 300);

// diagonal 1
stroke (0, 0, 200, 100);
strokeWeight (2);
line (60, 100, 160, 300);
line (65, 100, 160, 300);
line (70, 100, 160, 300);
line (75, 100, 160, 300);
line (80, 100, 160, 300);

// diagonal 2
stroke (0, 0, 200, 100);
strokeWeight (2);
line (165, 300, 80, 100);
line (170, 300, 80, 100);
line (175, 300, 80, 100);
line (180, 300, 80, 100);

// N right most 
stroke (0, 0, 200, 100);
strokeWeight (2);
line (180, 100, 180, 300);
line (175, 100, 175, 300);
line (170, 100, 170, 300);
line (165, 100, 165, 300);
line (160, 100, 160, 300);

// R left most 
stroke (0, 120, 20, 140);
strokeWeight (2);
line (200, 100, 200, 300);
line (205, 100, 205, 300);
line (210, 100, 210, 300);
line (215, 100, 215, 300);
line (220, 100, 220, 300);

// R concentric cirlces
fill (255, 255, 0, 30);
noStroke ();
ellipse (250, 150, 90, 90);

// R diagonals
strokeWeight (2);
stroke (0, 0, 200, 90);
line (200, 175, 320, 300);
line (200, 175, 315, 300);
line (200, 175, 310, 300);
line (200, 175, 305, 300);
line (200, 175, 300, 300);

// R concentric circles
fill (0, 0, 200, 80); //blue
noStroke();
ellipse (250, 150, 120, 120);
fill (0, 120, 20, 40); // green
ellipse (250, 150, 100, 100);
ellipse (250, 150, 80, 80);
ellipse (250, 150, 65, 65);
ellipse (250, 150, 50, 50);

// N background rectangle
fill (50, 150, 20, 80);
rect (160, 100, 20, 200);
rect (60, 100, 20, 200);

// R background rectangle
fill (50, 0, 250, 80);
rect (200, 100, 20, 200);

// beige triangles
fill (150, 150, 20, 80);
triangle (80, 100, 80, 300, 180, 300);
triangle (220, 200, 220, 300, 320, 300);


