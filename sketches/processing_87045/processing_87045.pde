
size(500,500);
smooth();
background(255);

//head
strokeWeight(10);
quad(100,80,400,80,400,450,100,450);

//left_eyebrow
noFill();
strokeWeight(15);
stroke(0);
strokeCap(SQUARE);
line(150,50,225,120);

//left_eye
noStroke();
fill(0);
ellipse(190,150,75,75);

noStroke();
fill(255);
ellipse(190,140,45,45);

//right_eyebrow
noFill();
strokeWeight(15);
stroke(0);
strokeCap(SQUARE);
line(265,120,340,50);

//right_eye
noStroke();
fill(0);
ellipse(300,150,75,75);

noStroke();
fill(255);
ellipse(300,140,45,45);

//nose
noFill();
strokeWeight(10);
stroke(0);
strokeCap(SQUARE);
beginShape();
vertex (222,150);
vertex(222,325);
vertex(275,325);
endShape();

//mouth
noStroke();
fill(0);
ellipse(250,375,75,75);
