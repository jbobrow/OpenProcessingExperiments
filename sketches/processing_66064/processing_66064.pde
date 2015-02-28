
size(400,400);
background(249, 233, 217);
noStroke();
//drew the squares
fill(233, 51, 34); //red
rect(40, 40, 200, 200);
fill(246, 207, 102); //top yellow
rect(240, 0, 130, 150);
fill(251, 211, 90); //bottom yellow
rect(0, 300, 40, 100);
fill(0, 0, 0); //black1
rect(40, 240, 100, 100);
fill(0, 0, 0); //black2
rect(140, 330, 110, 50);
fill(40, 13, 154); //blue
rect(243, 300, 128, 80);
fill(233, 51, 34); //bottom red
rect(370, 300, 30, 100);

//drew horrizontal lines (from top to bottom)
stroke (0);
strokeCap (SQUARE);
strokeWeight (6);
line(1, 3, width, 3); //line1
line(10, 40, 370, 40); //line1
line(10, 150, 40, 150); //line2-1
line(240, 150, 370, 150); //line2-2
line(40, 240, 370, 240); //line3
line(10, 300, 400, 300); //line4
line(140, 380, 370, 380); //line5

//drew vertical lines (from left to right)
line(38, 40, 38, 385); //line1
line(100, 10, 100, 40); //line2
line(240, 10, 240, 380); //line3
line(310, 240, 310, 150); //line4
line(370, 10, 370, 390); //line5
line(397, 0, 397, height); //lin6

//done

