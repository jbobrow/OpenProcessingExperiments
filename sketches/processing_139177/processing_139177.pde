

size (600,600);
background (60);
ellipseMode(CENTER);
rectMode(CENTER);

// x=move left to right
// ny=move up and down
int x = 300;
int ny = 200;

//Bottom Circles
noFill();
stroke(39, 169, 225, 95);
strokeWeight(5);
ellipse(x+7, ny+297, 117, 21);
ellipse(x+7, ny+311, 104, 21);
ellipse(x+7, ny+324, 80, 21);

//white background body
int y = 0;
fill(255); 
noStroke();
beginShape();
vertex(x+156, ny+45+y);
vertex(x+169, ny+45+y);
bezierVertex(x+207, ny+68+y, x+169, ny+95+y, x+170, ny+96+y);
bezierVertex(x+100, ny+150+y, x+79, ny+291+y, x+7, ny+291+y);
bezierVertex(x-65, ny+291+y, x-86, ny+150+y, x-156, ny+96+y);
bezierVertex(x-194, ny+68+y, x-156, ny+45+y, x-156, ny+45+y);
endShape();

//Left Arm
fill (39, 169, 225);
stroke (240, 176, 28);
strokeWeight(3);
ellipse(x-165, ny+233, 36, 36);
fill (27, 117, 187);
noStroke();
rect(x-165, ny+146, 17, 173);
ellipse(x-165, ny+233, 17, 17);

//Shoulder circles
fill (27, 117, 187);
stroke (240, 176, 28);
strokeWeight(5);
ellipse(x+170, ny+60, 83, 83);
ellipse(x-156, ny+60, 83, 83);

//yellow body
y = y-8;
fill(240, 176, 28);
noStroke();
beginShape();
vertex(x+156, ny+45+y);
vertex(x+169, ny+45+y);
bezierVertex(x+207, ny+68+y, x+169, ny+95+y, x+170, ny+96+y);
bezierVertex(x+100, ny+150+y, x+79, ny+291+y, x+7, ny+291+y);
bezierVertex(x-65, ny+291+y, x-86, ny+150+y, x-156, ny+96+y);
bezierVertex(x-194, ny+68+y, x-156, ny+45+y, x-156, ny+45+y);
endShape();


//Body rect block
noStroke();
fill(21, 75, 135);
rect(x+7, ny+32, 326, 10);

//Neck & head
noStroke();
fill(210, 210, 210);
rect(x+7, ny-35, 13, 145); 
rect(x+7, ny-98, 145, 40);
//Right arm
ellipse(x+180, ny+127, 50, 50 );
ellipse(x+180, ny+187, 18, 18 );
//right arm middle
fill (27, 117, 187);
stroke (240, 176, 28);
strokeWeight(3);
ellipse(x+180, ny+163, 30, 30);

//Left eye
fill(255);
noStroke();
ellipse(x-65, ny-98, 125, 125);

fill (27, 117, 187);
stroke(21, 75, 135);
strokeWeight(8);
ellipse(x-65, ny-98, 91, 91);

fill(210, 210, 210);
noStroke();
ellipse(x-65, ny-98, 77, 30);

//wire
noFill();
stroke(21, 75, 135);
strokeWeight(4);
beginShape();
vertex(x+52, ny-99);
bezierVertex(x+51, ny-99, x+16, ny-109, x+29, ny-56);
bezierVertex( x+42, ny-3, x-24, ny-44, x-12, ny-7);
bezierVertex(x, ny+30, x+65, ny-18, x+48, ny+30);
endShape();

//neck cover
noStroke();
fill(210, 210, 210);
rect(x+7, ny+7, 13, 35);

//Right eye
fill(255);
noStroke();
ellipse(x+78, ny-98, 70, 70);

fill (27, 117, 187);
stroke(21, 75, 135);
strokeWeight(5);
ellipse(x+78, ny-98, 40, 40);

//chest rectangles
for (int i = ny+60; i < ny+265; i += 24) {
  fill (39, 169, 225);
  stroke(255);
  strokeWeight(3);
  rect(307, i,  200-(i-ny)/1.5, 12);
}






