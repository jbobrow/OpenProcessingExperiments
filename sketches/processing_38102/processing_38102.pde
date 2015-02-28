
// homework 1
// copyright Paul Bracchitta August 2011 Pittsburgh, PA 15221
size(400, 400);
 
background(24, 13, 81);
noStroke();
 
color oj = color(255, 100, 38);
color white = color(255, 255, 255);
color green = color(80, 220, 49);
color blue = color(24, 13, 81);
color whiteoj = blendColor(oj, white, OVERLAY);
color whitegreen = blendColor(green, white, OVERLAY);
color whiteblue = blendColor(blue, white, OVERLAY);
 
fill(255, 100, 38);
rect(0, 40, 400, 110);
// ^P line
 
fill(80, 220, 49);
rect(0, 200, 400, 150);
// ^B line
 
fill(whiteblue);
rect(135, 0, 75, 400);
fill(24, 13, 61);
// end A line
 
 
fill(whiteoj);
rect(135, 40, 75, 110);
 
fill(whitegreen);
rect(135, 200, 75, 150);
 
 
//begin letter construction
 
fill(240, 0, 75);
ellipse(95, 95, 110, 110);
rect(40, 40, 40, 200);
fill(24, 13, 81);
rect(80, 40, 10, 120);
//End P
 
fill(19, 225, 245);
rect(135, 210, 75, 80);
ellipse(172.5, 210, 75, 75);
fill(whiteblue);
rect(167.5, 230, 10, 60);
// End A
 
fill(250, 230, 0);
ellipse(325, 234, 70, 70);
ellipse(325, 307, 85, 85);
rect(275, 200, 40, 150);
fill(24, 13, 81);
rect(315, 200, 10, 150);
// End B
 
//save("hw1.jpg");
