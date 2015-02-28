
size(500, 500);
background(220, 220, 200);
smooth();

// lines - light
stroke(0);
strokeWeight(1);
line(730, 0, 800, 10);
line(526, 332, 800, 425);

// rect - white
fill(255, 255, 255, 160);
noStroke();
rect(635, 250, 165, 500);

// quad - peach
fill(225, 180, 150);
noStroke();
quad(0, 10, 0, 75, 800, 140, 800, 75);

// quad - green
fill(0, 130, 95);
stroke(10, 102, 78);
strokeWeight(2);
quad(110, 82, 115, 600, 480, 600, 473, 146);

// quad - pink
fill(207, 87, 127);
noStroke();
quad(368, 170, 390, 383, 800, 305, 800, 110);

// claws
fill(10, 30, 80);
noStroke();
triangle(195, 535, 158, 587, 215, 555);
beginShape();
vertex(275, 505);
bezierVertex(275, 505, 340, 470, 260, 405);
vertex(340, 470);
endShape();

// lines - black
stroke(0);
strokeWeight(8);
line(0, 335, 775, 600);
line(0, 375, 800, 457);
line(145, 250, 705, 300);
line(150, 103, 800, 355);

// quad - blue
fill(33, 46, 92);
noStroke();
quad(9, 30, 20, 525, 167, 520, 160, 23);

// triangle - purple - bottom left corner
fill(60, 40, 78);
noStroke();
triangle(0, 520, 0, 600, 105, 600);

// lines brown
stroke(70, 33, 30);
strokeWeight(26);
line(0, 475, 790, 600);
stroke(95, 62, 43);
strokeWeight(40);
line(350, 0, 800, 100);

// triangle - red
fill(170, 55, 60, 240);
noStroke();
triangle(580, 560, 515, 600, 600, 600);

// line - blue
stroke(33, 46, 92);
strokeWeight(10);
line(157, 107, 294, 597);
line(700, 0, 800, 500);

// line - blue - long
stroke(37, 80, 165);
strokeWeight(10);
line(0, 175, 800, 90);

// line - black - bottom left
stroke(0);
strokeWeight(8);
line(0, 550, 165, 600);

// line - light blue - bottom left
stroke(77, 154, 197);
strokeWeight(25);
line(0, 510, 20, 600);

// cross: red
fill(170, 55, 60);
noStroke();
beginShape();
vertex(0, 0);
vertex(40, 0);
vertex(35, 50);
vertex(130, 50);
vertex(130, 90);
vertex(35, 90);
vertex(35, 150);
vertex(0, 150);
endShape();

//save("crop.tif");

