
size (400, 400);
smooth ();
background (255, 255, 255);

//j
stroke (146, 160, 237);
strokeWeight (10);
float x, y;
x = 100;
y = 100;
point (x + 150, y);
point (x +150, y + 100);
point (x+150, y+ 160);
point (x+140, y+195);
point (x+100, y+200);
point (x+80, y+180);
point (x+80, y + 150);

//m
stroke (237, 146, 146);
point (x-80, y+100);
point (x-40, y+20);
point (x, y+100);
point (x+40, y+20);
point (x+80, y+100);

//h
stroke (164, 222, 157);
point (x + 180, y);
point (x+180, y+200);
point (x+220, y+140);


//j.curve
stroke (146, 160, 237);
strokeWeight(30);
beginShape ();
curveVertex (x + 150, y);
curveVertex (x + 150, y);
curveVertex (x +150, y + 100);
curveVertex (x+150, y+ 160);
curveVertex (x+140, y+195);
curveVertex (x+100, y+200);
curveVertex (x+80, y + 150);
curveVertex (x+80, y+180);
endShape();

//m.curve
stroke (237, 146, 146);
strokeWeight (30);
beginShape ();
curveVertex (x-80, y+100);
curveVertex (x-80, y+100);
curveVertex (x-70, y+80);
curveVertex (x-60, y+60);
curveVertex (x-40, y+20);
curveVertex (x, y+100);
curveVertex (x+40, y+20);
curveVertex (x+60, y+60);
curveVertex (x+80, y+100);
curveVertex (x+80, y+100);
endShape ();

//h.curve
stroke (164, 222, 157);
strokeWeight (30);
beginShape ();
curveVertex (x + 190, y);
curveVertex (x + 190, y);
curveVertex (x+190, y+200);
curveVertex (x+200, y+190);
curveVertex (x+210, y+170);
curveVertex (x+225, y+160);
curveVertex (x+250, y+170);
curveVertex (x+270, y+210);
curveVertex (x+270, y+210);
endShape ();

fill (252, 194, 196);
strokeWeight (5);
bezier (350, 355, 330, 320, 370, 320, 350, 355);
bezier (350, 355, 330, 390, 370, 390, 350, 355);
bezier (350, 355, 315, 335, 315, 375, 350, 355);
bezier (350, 355, 385, 335, 385, 375, 350, 355);

saveFrame("hw2_mijinh.jpg");


 

