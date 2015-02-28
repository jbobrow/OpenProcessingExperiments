
size(400, 400);
colorMode(HSB, 360, 100, 100);
background(160, 30, 100);
smooth();
 
noFill();
strokeWeight(11);
 
for(int i=0; i<=250; i++)
{
stroke(210, 100-i*0.5, 100, 50);
curve(0, 0, 0, 250+i*10, 500, 0, 500, 250+i*10);
}
 
 
noStroke();
fill(330, 20, 100);
 
beginShape();
vertex(70, 340);
bezierVertex(73, 345, 75, 344, 85, 343);
bezierVertex(77, 340, 79, 337, 78, 338);
bezierVertex(95, 340, 100, 343, 110, 350);
bezierVertex(87, 365, 75, 363, 70, 340);
endShape();
 
beginShape();
vertex(120,  230);
bezierVertex(118, 232, 119, 234, 140, 250);
bezierVertex(138, 246, 139, 240, 140, 225);
bezierVertex(180, 250, 175, 300, 200, 330);
bezierVertex(120, 328, 80, 290, 120, 230);
endShape();
 
beginShape();
vertex(340,  320);
bezierVertex(338, 322, 335, 323, 320, 340);
bezierVertex(345, 343, 357, 341, 360, 340);
bezierVertex(320, 395, 250, 390, 200, 360);
bezierVertex(260, 305, 330, 310, 340, 320);
endShape();
 
beginShape();
vertex(340,  200);
bezierVertex(330, 205, 327, 212, 325, 218);
bezierVertex(340, 213, 345, 208, 357, 198);
bezierVertex(359, 215, 370, 230, 290, 245);
bezierVertex(288, 243, 270, 210, 340, 200);
endShape();
