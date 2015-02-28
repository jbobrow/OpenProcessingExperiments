
size(800, 800);

// 1

strokeWeight(5);
fill(0, 155, 25);

beginShape();
vertex(100, 400);
vertex(250, 230);
vertex(350, 400);
vertex(190, 550);
vertex (280, 550);
endShape(CLOSE);

//ojo iz
strokeWeight(2);
fill(255);
ellipse(200, 350, 20, 25);

noStroke();
fill(0);
ellipse(205, 350, 10, 12);

//ojo der
stroke(0);
strokeWeight(2);
fill(255);
ellipse(250, 350, 25, 30);

noStroke();
fill(0);
ellipse(255, 350, 10, 15);


// 2
stroke(0);
strokeWeight(6);
fill(25, 0, 100);
ellipse(500, 350, 100, 100);
ellipse(500, 480, 200, 200);

fill(232, 97, 0);
beginShape();
vertex(490, 350);
vertex(505, 352);
vertex(498, 510);
endShape(CLOSE);

stroke(0);
strokeWeight(2);
fill(255);
ellipse(480, 330, 20, 25);
noStroke();
fill(0);
ellipse(480, 330, 10, 12);

stroke(0);
strokeWeight(2);
fill(255);
ellipse(510, 330, 20, 25);

noStroke();
fill(0);
ellipse(510, 330, 10, 12);
