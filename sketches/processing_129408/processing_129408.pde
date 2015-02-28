
size(500,500);
background(0);
//large ellipse
strokeWeight(15);
stroke(28,100,230);
fill(28,134,255); 
ellipse(250,375,380,350);
//block out bottom half
strokeWeight(1);
stroke(0);
fill(0);
rect(0,350,500,500);
//black circle 1
ellipse(88,350,70,70);
//black circle 2
ellipse(150,350,65,40);
//black circle 3
ellipse(215,350,60,45);
//black circle 4
ellipse(275,350,65,40);
//black circle 5
ellipse(345,350,70,40);
//black circle 6
ellipse(410,350,70,70);
//left ear
fill(28,134,238);
stroke(28,134,238);
triangle(210,220,210,150,280,220);
//right ear
triangle(210,220,280,150,280,220);
//eyes
fill(0);
ellipse(230,200,8,8);
//eye2
ellipse(260,200,8,8);
//mouth
ellipse(245,220,60,20);
//teeth
fill(255,255,255);
triangle(230,210,240,210,235,245);
triangle(247,210,257,210,252,245);
//moon
strokeWeight(10);
stroke(230,230,75,125);
fill(230,230,75,125);
ellipse(115,125,100,100);
//blackoutcircle
fill(0);
stroke(0);
ellipse(145,125,100,100);
//rect
fill(255,255,255,50);
rect(0,0,495,495);

