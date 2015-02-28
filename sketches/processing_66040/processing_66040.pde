
//setup screen
size(400, 400);
background(235);
smooth();

//Fill rect setup
noStroke();
rectMode(CORNER);
//Fill Red
fill(237, 28, 36);
rect(43, 54, 204, 200); // +4, -7
rect(370, 296, 28, 105);
//Fill Yellow
fill(255, 242, 0);
rect(247-3, 0, 373-240, 155);
rect(0, 294, 46, 108);
//Fill Blue
fill(33, 64, 154);
rect(247, 298, 376-247, 380-298);
//Fill Black
fill(0);
rect(43, 254, 144-43, 355-254);
rect(144, 355, 247-144, 380-355);

//draw frame line
stroke(0);
strokeWeight(15);
line(0, 0, 400, 0);
line(400, 0, 400, 400);

//from top to bottom, horizontal line
strokeWeight(7);
strokeCap(SQUARE);

line(7, 54, 376, 54); //line 1
line(10, 155, 43, 155); //line 2
line(247, 155, 375, 155); //line 2.5
line(43, 254, 376, 254); //line 3
line(7, 298, 400, 298); //line 4
line(43, 355, 247, 355); //line 5
line(144, 380, 370, 380); //line 6

//from left to right, vertical line
strokeWeight(7);
strokeCap(SQUARE);

line(43, 54, 43, 390); //line 1
line(81, 14, 81, 54); //line 2
line(144, 254, 144, 394); //line 3
line(247, 15, 247, 380); //line 4
line(308, 155, 308, 254); //line 5
line(373, 22, 373, 394); //line 6









