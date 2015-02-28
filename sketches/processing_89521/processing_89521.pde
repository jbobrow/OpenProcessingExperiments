
size(500,500);
background(53,237,232);

beginShape();
vertex(250, 350);
vertex(200, 375);
vertex(200, 360);
vertex(150, 350);
vertex(250, 350);
endShape(); //Left Wing

beginShape();
vertex(250, 350);
vertex(300, 375);
vertex(300, 360);
vertex(350, 350);
vertex(250, 350);
endShape(); //Right Wing

beginShape(TRIANGLES);
fill(70,173,58);
noStroke();
vertex(250,300);
vertex(220,400);
vertex(275,400);
endShape();

ellipseMode(CENTER);
noStroke();
fill(203,201,127);
ellipse(250,155,250,300); //Face

noStroke();
fill(191,187,62);
triangle(200, 150, 250, 200, 300, 150); //Nose

ellipseMode(RADIUS);
noStroke();
fill(255);
ellipse(150,100,30,30); //Left eye white

ellipseMode(CENTER);
fill(100);
ellipse(150, 100,30,30);//Left eye pupil

ellipseMode(RADIUS);
fill(255);
ellipse(350,100,30,30); //Right eye white

ellipseMode(CENTER);
fill(100);
ellipse(350,100,30,30); //Right eye pupil

ellipseMode(CORNER);
fill(255);
ellipse(148,87,20,20); //Left eye effect

ellipseMode(CORNER);
fill(255);
ellipse(350,87,20,20); //right eye effect

beginShape();
vertex(200, 250);
vertex(250, 260);
vertex(300, 250);
endShape(); //Mouth
