
size(400,400);
smooth();
background(40,153,85);
stroke(185,103,231);
strokeWeight(5);

fill(171,91,216);
//first petal (LEFT)
beginShape();
vertex(200,200);
vertex(150,250);
vertex(10,200);
vertex(150,150);
vertex(200,200);
endShape(CLOSE);

fill(179,84,232);
//2nd petal (TOP)
beginShape();
vertex(200,200);
vertex(150,150);
vertex(200,10);
vertex(250,150);
vertex(200,200);
endShape(CLOSE);

fill(192,84,232);
//3rd petal (RIGHT)
beginShape();
vertex(200,200);
vertex(250,150);
vertex(390,200);
vertex(250,250);
vertex(200,200);
endShape(CLOSE);

fill(202,87,244);
//4th petal (BOTTOM)
beginShape();
vertex(200,200);
vertex(250,250);
vertex(200,390);
vertex(150,250);
vertex(200,200);
endShape(CLOSE);

fill(192,84,232);
//petal inb 1st and 2nd
beginShape();
vertex(150,150);
vertex(80,175);
vertex(80,80);
vertex(175,80);
vertex(150,150);
endShape(CLOSE);

fill(171,91,216);
//petal inb 2nd and 3rd
beginShape();
vertex(250,150);
vertex(320,175);
vertex(320,80);
vertex(225,80);
endShape(CLOSE);

fill(179,84,232);
//petal inb 3rd and 4th
beginShape();
vertex(320,225);
vertex(320,320);
vertex(225,320);
vertex(250,250);
endShape(CLOSE);

fill(192,84,232);
//petal inb 4th and 1st
beginShape();
vertex(175,320);
vertex(80,320);
vertex(80,225);
vertex(150,250);
endShape(CLOSE);

fill(255,243,56);
stroke(255,243,56,160);
strokeWeight(15);
ellipse(200,200,50,50);


