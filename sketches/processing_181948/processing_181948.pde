
size(500,500);
background(0);
stroke(255); 
fill(255);
pushMatrix();
rotate(-1/PI);
rect(100,440,125,20);
popMatrix();
triangle(200, 365, 250, 395, 200, 425);
triangle(275, 365, 225, 395, 275, 425);

ellipseMode(CENTER);
ellipse(250,275,200,160);
fill(255);
rotate(-2/PI);
arc(100, 355, 60, 450, PI, TWO_PI);
rotate(3/PI);
arc(350, 150, 50, 450, PI, TWO_PI);
fill(0);
ellipseMode(CENTER);
ellipse(265,175,30,30);



