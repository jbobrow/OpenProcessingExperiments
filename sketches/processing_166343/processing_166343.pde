
size(500, 500);
background(230);

//neck
fill(210);
stroke(190);
rect(160, 350, 180, 150);

//ears
ellipse(50, 230, 60, 90);
ellipse(450, 230, 60, 90);
fill(190);
noStroke();
ellipse(50, 240, 20, 40);
ellipse(450, 240, 20, 40);

//head
fill(210);
stroke(160);
ellipse(250, 250, 400, 400);

//nose
noStroke();
fill(150);
ellipse(250, 270, 50, 90);
ellipse(250, 285, 80, 40);
fill(160);
ellipse(250, 290, 30, 30);

//eye white
fill(255);
stroke(200);
strokeWeight(2);
ellipse(170, 220, 80, 50);
ellipse(330, 220, 80, 50);

//eye black
fill(0);
noStroke();
ellipse(330, 220, 48, 48);
ellipse(170, 220, 48, 48);

//mouth
stroke(90);
strokeWeight(1);
fill(100);
ellipse(250, 370, 100, 70);
fill(120);
noStroke();
ellipse(250, 370+17.5, 80, 35);

//blush
fill(202);
ellipse(140, 280, 90, 50);
ellipse(140+2*110, 280, 90, 50);

//eyebrows
stroke(90);
strokeWeight(3);
line(130, 180, 170+20, 145);
line(330+40, 180, 330-20, 145);

//hat
noStroke();
fill(0);
rect(100, 10, 300, 100);
rect(70, 100, 360, 10);

//collar
fill(0);
rect(140, 470, 220, 30);
fill(255);
rect(200, 470, 100, 30);

//Reflections
ellipseMode(CORNER);
fill(255);
ellipse(315, 205, 5, 5); 
ellipse(155, 205, 5, 5); 
rect(105, 15, 5, 85);
