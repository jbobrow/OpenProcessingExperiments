
size(640, 480);
background(220, 210, 177);



//black_shapes

noStroke();
smooth();
fill(0);
quad(283, 42, 283, 214, 187, 201, 187, 42);

noStroke();
smooth();
fill(0);
quad(293, 216, 292, 338, 202, 338, 202, 216);

//grey_curved_shapes

fill(170,180,170);
beginShape();
vertex(550,-150);
bezierVertex(350,110,450,330,-100,430); 
bezierVertex(520,488,530,320,950,50);
endShape();
 
smooth();
noStroke();
fill(170,180,170);
triangle(320,0,-10,400,-10,-10); 

smooth();
noStroke();
fill(170,180,170);
triangle(565,373,540,480,360,480); 



//right)grey_quad
noStroke();
smooth();
fill(150, 150, 130);
quad(35,333,145,330,145,430,35,430);

//red_shapes
smooth();
noStroke();
fill(255, 0, 0);
beginShape();
vertex (0, 300);
vertex (125, 300);
vertex (125, 340);
vertex (50, 340);
vertex (50, 400);
vertex (0, 395);
endShape();

smooth();
noStroke();
fill(255, 0, 0);
quad(90, 360, 212, 360, 211, 391, 90, 390);

smooth();
noStroke();
fill(255, 0, 0);
beginShape();
vertex (275, 320);
vertex (390, 323);
vertex (390, 350);
vertex (310, 348);
vertex (310, 410);
vertex (275, 410);
endShape();

smooth();
noStroke();
fill(255, 0, 0);
beginShape();
vertex (550, 0);
vertex (465, 30);
vertex (530, 30);
vertex (650, 0);
endShape();

smooth();
noStroke();
fill(255, 0, 0);
triangle(640, 10, 640, 25, 570, 25);

strokeWeight(10);
stroke(255, 0, 0);
noFill();
strokeCap(SQUARE);
line(310, -10, 350, 15);

strokeWeight(10);
stroke(255, 0, 0);
noFill();
strokeCap(SQUARE);
line(260, -10, 220, 15);

//black_lines
strokeWeight(3);
stroke(0);
noFill();
line(20, 250, 17, 405);

strokeWeight(3);
stroke(0);
noFill();
line(55, 240, 55, 405);

strokeWeight(3);
stroke(0);
noFill();
line(20, 270, 55, 272);

strokeWeight(3);
stroke(0);
noFill();
line(220, 230, 220, 410);

strokeWeight(3);
stroke(0);
noFill();
line(260, 230, 260, 410);

strokeWeight(3);
stroke(0);
noFill();
line(423, 235, 423, 384);

strokeWeight(3);
stroke(0);
noFill();
line(466, 240, 466, 383);


strokeWeight(4);
stroke(0);
noFill();
line(650, 135, -10, 188);

strokeWeight(4);
stroke(0);
noFill();
bezier(660, 250, 640, 260, 205, 300, -10, 300);

strokeWeight(4);
stroke(0);
noFill();
bezier(-10, 450, 200, 450, 640, 430, 650, 430);

//orange_ellipses
smooth();
noStroke();
fill(220, 120, 60);
ellipse(540, 470, 140, 140);

//orange_ellipses
smooth();
noStroke();
fill(220, 120, 60);
ellipse(340, 470, 140, 140);

//blue_quads
smooth();
noStroke();
fill(40, 70, 129);
quad(310,420,380,420,370,437,320,437);
quad(562,437,640,442,640,476,560,470);
quad(80,415,95,430,95,480,80,480);
quad(105,430,120,416,120,480,105,480);






//right)grey_quad
noStroke();
smooth();
fill(150, 150, 130);
quad(532, 313, 638, 312, 636, 408, 529, 408);

//black_bezier
strokeWeight(4);
stroke(0);
noFill();
bezier(-5, 360, 150, 370, 450, 350, 645, 338);


//brown_swirl
strokeWeight(15);
stroke(115, 50, 30);
strokeCap(ROUND);
noFill();
bezier(295, 300, 470, 270, 426, 460, 370, 480);

//black_line
strokeWeight(7);
stroke(0);
noFill();
bezier(-2, 0, 20, 60, 30, 160, -4, 250);

//blue_quad
smooth();
noStroke();
fill(40, 70, 129);
quad(143, 112, 278, 119, 204, 232, 88, 230);

//green_triangle
smooth();
noStroke();
fill(35, 72, 70);
triangle(450, 110, 480, 253, 385, 250);

//yellow_elippse
smooth();
noStroke();
fill(250,195,50);
ellipse(510,250,100,50);

//blue_quad
smooth();
noStroke();
fill(40, 70, 129,200);
quad(445,260,560,260,560,280,445,282);

//light_blue_quad
smooth();
noStroke();
fill(210,225,220,220);
quad(445,225,560,225,560,240,445,242);

//red_bezier
strokeWeight(3);
stroke(255, 0, 0);
noFill();
bezier(-2, 160, 170, 180, 470, 243, 642, 306);

//black_bezier
strokeWeight(7);
stroke(0);
noFill();
bezier(360, -5, 386, 90, 340, 340, 223, 490);

//blue_bezier
strokeWeight(5);
stroke(10, 60, 150);
noFill();
bezier(0, 220, 120, 160, 445, 46, 520, -3);

//green_triangle
smooth();
noStroke();
fill(0,145,108);
triangle(275,225,275,280,233,255);

//yellow_quad
smooth();
noStroke();
fill(245,185,50);
quad(440,25,550,24,550,40,470,40);

//brown_line
strokeWeight(15);
stroke(85,50,40);
strokeCap(SQUARE);
noFill();
line(540,105,642,72);

//dark_red_line
strokeWeight(4);
stroke(140,20,20);
strokeCap(SQUARE);
noFill();
line(530,-10,645,50);
