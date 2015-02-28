
size(400, 565);
background(20);
smooth();

// ....ushiro.... //
for(int y = 0; y < 210; y += 2) {
  stroke(240-y);
  if(y < 50) {
    line(120,y, width,y);
  } else if(y < 120) {
    line(205,y, width,y);
  } else {
    line(305,y, width,y);
  }
}

// ....kaidan.... //
stroke(240);
fill(50);
rect(0, 0, 120, 50);
rect(55, 50, 150, 70);
rect(125, 120, 180, 90);
rect(211, 210, 220, 110);
rect(312, 320, 260, 130);

// ....maru.... //
noStroke();
fill(230);
ellipse(100, 35, 30, 30);
ellipse(165, 70, 45, 45);
ellipse(280, 170, 20, 20);
ellipse(200, 195, 30, 30);
ellipse(300, 250, 50, 50);

// ....sankaku shiro.... //
fill(240);
triangle(0, height, width, height, 0, 50);

// ....sankaku aka.... //
fill(240, 0, 0);
triangle(45, 440, 60, 455, 70, 380);
triangle(70, 440, 110, 420, 100, 350);
triangle(40, 380, 80, 370, 100, 300);
triangle(25, 360, 40, 350, 20, 280);
triangle(20, 430, 40, 420, 50, 390);
triangle(30, 300, 60, 320, 45, 200);
triangle(70, 320, 75, 250, 90, 240);
triangle(110,440, 150,430, 185,320);
triangle(105,360, 115,410, 140,300);

// ....to.... //
fill(20);
rect(40, 450, 80, 115);


