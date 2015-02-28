
size(500, 500);
smooth();

//crown
strokeWeight(4);
line(100, 100, 200, 200);
line(400, 100, 300, 200);
point(250, 10); //point of reference (middle)
line(250, 10, 100, 100);
line(250, 10, 400, 100);
line(200, 200, 300, 200);
fill(0, 160, 0);
ellipse(250, 10, 15, 15);
ellipse(100, 100, 10, 10);
ellipse(400, 100, 10, 10);
strokeWeight(1);

//head 
strokeWeight(3);
fill(255, 0, 0);
ellipse(250, 250, 300, 300);
strokeWeight(1);
noFill();

//Concentric circle eye left
fill(0, 0, 80);
strokeWeight(13);
ellipse(150, 200, 100, 100);
stroke(0, 160, 0);
fill(0, 0, 255);
strokeWeight(9);
ellipse(150, 200, 50, 50);
noFill();
strokeWeight(4);
ellipse(150, 200, 25, 25);
strokeWeight(10);
//ellipse(150, 200, 10, 10);
strokeWeight(1);
stroke(0);

//eye right
fill(0, 0, 80);
strokeWeight(13);
ellipse(350, 200, 100, 100);
stroke(0, 160, 0);
fill(0, 0, 255);
strokeWeight(9);
ellipse(350, 200, 50, 50);
noFill();
strokeWeight(4);
ellipse(350, 200, 25, 25);
strokeWeight(10);
//ellipse(350, 200, 10, 10);
strokeWeight(1);
stroke(0);

//nose
strokeJoin(BEVEL);
fill(0, 0, 255);
rect(245, 100, 10, 200);


//mouth
fill(200, 0, 0);
strokeWeight(2);
arc(250, 320, 200, 110, 0, PI); //bottom lip, curved.
line(150, 320, 350, 320); //top lip

//shoulders
rect(100, 400, 300, 400);


