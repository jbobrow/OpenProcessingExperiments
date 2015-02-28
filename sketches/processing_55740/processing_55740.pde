

size(340, 540); 
smooth(); 
strokeWeight(2); 
background(#02142C); 
ellipseMode(RADIUS);
int w = 25;
int h = 20;
int d = 10;
int x = 120;
int y = 240;
int body = 100;
int orange = #F57839;
int black = #000000;
// Antennae
stroke(255);
line(x+20, y/4, x, h+d);
line(x+40, y/4, x+60, h+d);
noStroke();
ellipse(x, h+d, d-7, d-7);
ellipse(x+60, h+d, d-7, d-7);
//Planet
noStroke();
fill(#70A3E8, 200);
ellipse(100, 540, 300, 220);
fill(255);
ellipse(20, 440, 10, 10);
ellipse(80, 520, 5, 4);
ellipse(60, 510, 7, 6);
ellipse(20, 500, 15, 12);
ellipse(35, 480, 6, 9);
ellipse(100, 460, 9, 15);
ellipse(200, 380, 16, 19);
ellipse(170, 400, 9, 8);
ellipse(280, 500, 35, 13);
ellipse(300, 430, 25, 15);
ellipse(400, 600, 6, 7);
ellipse(80, 400, 15, 10);
fill(#042F6A, 80);
ellipse(15, 440, 10, 10);
ellipse(85, 520, 5, 4);
ellipse(65, 510, 7, 6);
ellipse(25, 500, 15, 12);
ellipse(40, 480, 6, 9);
ellipse(105, 460, 9, 15);
ellipse(205, 380, 16, 19);
ellipse(175, 400, 9, 8);
ellipse(285, 500, 35, 13);
ellipse(305, 430, 25, 15);
ellipse(405, 600, 6, 7);
ellipse(85, 400, 15, 10);
//Head
noStroke();
fill(orange);
rect(x, x/2, x/2, x/2);
fill(255);
ellipse(x+h, h*4, d-3, d);
fill(255);
ellipse(x+40, h*4, d-3, d);
fill(black);
ellipse(x+h, h*4+5, d-7, d-7);
ellipse(x+40, h*4+5, d-7, d-7);
//Mouth
stroke(black);
line(x+h, body+10, x+40, body+5);
//Ears
noStroke();
fill(orange);
rect(x-5, body-w, d, d+5);
rect(x+55, body-w, d, d+5);
//Neck
ellipse(x+30, x+d, d, d);
//Arms
fill(255);
ellipse(110, 170, d, d);
ellipse(190, 170, d, d);
fill(orange, 180);
ellipse(100, 180, d, d);
ellipse(200, 180, d, d);
fill(255);
ellipse(90, 190, d, d);
ellipse(210, 190, d, d);
fill(orange, 180);
ellipse(80, 200, d, d);
ellipse(220, 200, d, d);
//Body
noStroke();
fill(orange);
rect(body+13, body+40, body-25, body);
fill(255);
rect(body+20, body+48, body/2+10, body-15);
//Thighs
fill(orange);
rect(x, y, w, h);
rect(x+35, y, w, h);
//Knees
fill(255);
ellipse(x+12, y+30, d, d);
ellipse(x+48, y+30, d, d);
//Calves
fill(orange);
rect(x, y+40, w, h*2);
rect(x+35, y+40, w, h*2);
//Feet
fill(255);
ellipse(x+12, y+80, d*1.5, d/2);
ellipse(x+48, y+80, d*1.5, d/2);


























