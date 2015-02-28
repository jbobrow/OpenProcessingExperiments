
// UCLA DMA INTERACTIVITY
// 
// Michael Honhongva
// July 3, 2012

size(640, 360);
background(235, 225, 207);
noStroke();
smooth();


// BROWN TRIANGLE, LEFT SIDE
// lowest brown
fill(176, 154, 149);
quad(0, 60, 95, 50, 150, 110, 0, 110);

// left yellow
fill(234, 212, 163);
quad(0, 40, 100, 30, 95, 50, 0, 60);

// black right
fill(30, 28, 30);
quad(100, 30, 95, 50, 150, 110, 173, 110);

// line
fill(184, 169, 144);
quad(0, 40, 100, 30, 100, 29, 0, 39);

// line above blue quad
fill(184, 169, 144);
quad(0, 110, 330, 110, 330, 109, 0, 109);

// LARGE SHAPES
//blue quad
fill(104, 163, 201);
quad(0, 110, 330, 110, 330, 360, 0, 360);

// red quad
fill(250, 56, 51);
quad(245, 240, 640, 240, 640, 360, 245, 360);

// black ellipse
fill(30, 28, 30);
ellipse(451, 110, 368, 368);


// RED + WHITE RIGHT SIDE
// white
fill (208, 208, 209);
beginShape();
vertex(445, 220);
vertex(470, 235);
vertex(525, 230);
vertex(500, 215);
vertex(640, 20);
vertex(640, 0);
vertex(600, 0);
endShape(CLOSE);

// right red diaganol
fill(250, 56, 51);
quad(500, 215, 640, 20, 640, 65, 525, 230);

//line
fill(184, 169, 144);
quad(445, 219, 500, 214, 500, 215, 445, 220);

// HORIZONTAL BARS
// black, left small side
fill(30, 28, 30);
quad(0, 267, 150, 267, 150, 285, 0, 285);

// grey bar beneath L
fill(173, 169, 159);
quad(370, 53, 640, 53, 640, 90, 370, 90);

// yellow L
fill(233, 200, 87);
beginShape();
vertex(445, 40);
vertex(495, 40);
vertex(495, 90);
vertex(640, 90);
vertex(640, 135);
vertex(445, 135);
endShape(CLOSE);


// RED + WHITE LEFT SIDE
// left red bar
fill(250, 56, 51);
quad(0, 222, 420, 222, 420, 230, 0, 230);

// left white bar
fill (208, 208, 209);
quad(0, 230, 420, 230, 420, 250, 0, 250);

// line
fill(184, 169, 144);
quad(0, 250, 420, 250, 420, 252, 0, 252);

