
size(250, 250);
background(18, 154, 232);
smooth();

//cen, cenR1, cenL1 main midlines
line(40, 35, 170, 170);
line(30, 35, 180, 190);
line(29, 45, 161, 180);

//cen L2
line(33, 60, 150, 180);
line(55, 40, 168, 157);

//2_top_circles
ellipseMode(CENTER);
noStroke();
fill(136, 32, 423, 80);
ellipse(65, 30, 8, 8);
ellipse(22, 70, 8, 8);
ellipse(74, 45, 7, 7);
ellipse(36, 78, 7, 7);

//main_LRG_ellipse
noStroke();
fill(224, 203, 10, 50);
ellipse(175, 187, 150, 150);
ellipse(175, 187, 135, 135);
fill(224, 203, 10, 170);
ellipse(175, 187, 115, 115);
fill(224, 13, 10, 170);
ellipse(175, 187, 100, 100);
fill(224, 203, 10, 100);
ellipse(175, 187, 90, 90);
ellipse(175, 187, 60, 60);
fill(224, 13, 10, 170);
ellipse(175, 187, 40, 40);
fill(245, 237, 7, 190);
ellipse(175, 187, 20, 20);

//rectangle
noStroke();
fill(7, 245, 209, 100);
//mainrec
rect(120, 130, 20, 20);
//recfade1
rect(110, 120, 15, 15);
//recfade3
rect(100, 110, 10, 10);

//curves
noStroke();
fill(250, 5, 5, 30);
bezier(55, 40, 150, 40, 50, 20, 168, 157);
bezier(33, 60, 40, 150, 20, 50, 150, 180);




