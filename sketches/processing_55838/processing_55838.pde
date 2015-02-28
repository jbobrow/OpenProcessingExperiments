
size(540, 340); 
smooth(); 
noStroke(); 
background(103, 191, 169); 
ellipseMode(RADIUS);
// Head 
fill(237, 109, 70); 
ellipse(280, 130, 50, 50);
fill(0); 
ellipse(260, 140, 5, 10);
ellipse(300, 140, 5, 10);
fill(255);
ellipse(260, 145, 2, 2);
ellipse(300, 145, 2, 2);
stroke(0);
strokeWeight(4);
line(248, 128, 260, 122);
line(312, 128, 300, 122);
//Antennae
stroke(187, 192, 192);
line(254, 94, 242, 78);
line(302, 94, 312, 78);
noStroke();
fill(0);
ellipse(242, 78, 4, 4);
ellipse(312, 78, 4, 4);
// Body
fill(187, 192, 192);
quad(237, 155, 323, 155, 330, 180, 230, 180);
fill(224, 234, 234);
quad(330, 180, 312, 235, 248, 235, 230, 180);
// Arms
rect(220, 180, 10, 40);
rect(330, 180, 10, 40);
// Legs
rect(248, 235, -10, 40);
rect(312, 235, 10, 40);
arc(228, 275, 20, 20, PI, TWO_PI);
arc(332, 275, 20, 20, PI, TWO_PI);
