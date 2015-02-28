
size(500, 500);
smooth();

background(154, 201, 250);

//crown 
strokeWeight(4);
line(100, 100, 200, 200);
line(400, 100, 300, 200);
point(250, 10); //point of reference (middle)
line(250, 10, 200, 300); //crown stripes
line(250, 10, 300, 300);//crown stripes
line(250, 10, 100, 100);
line(250, 10, 400, 100);
line(200, 200, 300, 200);
fill(255, 250, 18);
ellipse(250, 10, 15, 15);
ellipse(100, 100, 10, 10);
ellipse(400, 100, 10, 10);
strokeWeight(1);

//head 
strokeWeight(3);
fill(25, 210, 100);
ellipse(250, 250, 300, 300);
strokeWeight(1);
noFill();

//Concentric circle eye left
fill(0, 0, 80, 160);
strokeWeight(6);
ellipse(150, 200, 100, 100);
stroke(255, 250, 18);
fill(100, 0, 255, 160);
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
fill(0, 0, 80, 160);
strokeWeight(6);
ellipse(350, 200, 100, 100);
stroke(255, 250, 18);
fill(100, 0, 255, 160);
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
strokeWeight(3);
strokeJoin(BEVEL);
fill(100, 0, 255, 160);
rect(245, 100, 10, 200);


//mouth
strokeJoin(ROUND);
fill(25, 210, 140);
strokeWeight(4);
arc(250, 320, 200, 110, 0, PI); //bottom lip, curved.
line(150, 320, 350, 320); //top lip
 
 //inner mouth

fill(255, 0, 0);
arc(250, 330, 160, 70, 0, PI);
line(170, 330, 330, 330);

//shoulders
rect(75, 400, 350, 400);

fill(100, 0, 255, 160);
strokeWeight(3);
strokeJoin(BEVEL);
rect(150, 400, 200, 400);


