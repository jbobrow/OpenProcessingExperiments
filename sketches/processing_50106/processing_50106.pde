
size(500, 500);
background(229, 219, 194);
smooth();

// brown quad1
noStroke();
fill(173, 152, 145);
quad(35,240, 220,190, 340,275, 35,385);

// brown quad 2
noStroke();
fill(173, 152, 145);
quad(0,250, 35,240, 35,385, 0,360);

// yellow quad
stroke(175);
fill(239, 225, 170);
quad(35,385, 340,275, 340,300, 35,410);

// small gray quad
noStroke();
fill(52);
quad(0,360, 35,385, 35,410, 0,385);

// blue quad
noStroke();
fill(136, 176, 216);
quad(0,0, 125,0, 195,275, 0,323);

// black quad
noStroke();
fill(0);
quad(0,120, 500,5, 500,20, 0,140);

// white quad
stroke(150);
fill(243, 238, 225);
quad(0,160, 500,45, 500,65, 0,183);

// red quad
noStroke();
fill(217, 49, 45);
quad(0,183, 500,65, 500,75, 0,190);

// small white quad
stroke(200);
fill(243, 238, 225);
quad(225,240, 425,190, 435,195, 235,245);

// small red quad
noStroke();
fill(217, 49, 45);
quad(235,245, 435,195, 435,200, 235,250);

// very small white quad
noStroke();
fill(243, 238, 225);
quad(225,240, 235,245, 235,250, 225,245);

// gray triangle
noStroke();
fill(52);
triangle(150,370, 240,335, 265,455);

// white vertical quad
stroke(200);
fill(243, 238, 225);
quad(240,335, 255,330, 280,450, 260,455);

// corner red quad
noStroke();
fill(217, 49, 45);
quad(350,395, 500,375, 500,500, 405,500);


