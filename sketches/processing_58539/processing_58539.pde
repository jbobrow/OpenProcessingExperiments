
background(255);
size(400, 400);
smooth();
//body
fill(0);
//head and neck
ellipse(200, 150, 80, 60);
rect(195, 170, 10, 20);
//torso
ellipse(200, 205, 70, 40);
rect(165, 205, 70, 20);
ellipse(200, 225, 70, 40);
//legs and arms
strokeWeight(12);//make these lines less round
line(190, 220, 185, 263);
line(210, 220, 215, 263);
line(172, 200, 145, 220);
line(229, 200, 255, 220);
//bandana
noFill();
stroke(200, 100, 65);
//bezier(170, 140, 230, 180, 170, 180, 230, 140);
curve(173, 100, 170, 140, 230, 140, 227, 100);
//eyes
strokeWeight(10);
stroke(255, 255, 255);
point(185, 145);
point(215, 145);
strokeWeight(7);
stroke(0, 0, 0);
point(186, 145);
point(214, 145);

