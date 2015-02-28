
size (500,700);
smooth();
strokeWeight(3);
background(255);


//body
fill(238,240,186);
beginShape();
curveVertex(200,298);
curveVertex(200,298);
curveVertex(100,295);
curveVertex(100,350);
curveVertex(180,360);
curveVertex(150,550);
curveVertex(220,550);
curveVertex(220,470);
curveVertex(250,470);
curveVertex(245,550);
curveVertex(310,550);
curveVertex(320,360);
curveVertex(400,320);
curveVertex(400,250);
curveVertex(300,298);
curveVertex(300,298);
endShape(CLOSE);


fill(255);
ellipse(250,380,90,120); //belly

//ears
fill(238,240,186);
ellipse(350,130,100,80);
fill(250,207,223);
ellipse(350,140,80,60);

fill(238,240,186);
ellipse(150,130,100,80);
fill(250,207,223);
ellipse(150,140,80,60);


//head

fill(238,240,186);
ellipse(250,200,250,210);
fill(0);
ellipse( 195,180,20,20); // left eye
ellipse( 305,180,20,20); //  right eye
fill(255);
ellipse( 250,240,90,60);
fill(0);
ellipse(250,230,25,25); //nose
noFill();
arc(268,242,35,30,0,PI); // right lip
arc(235,242,35,30,0,PI); // left lip

stroke(240,63,63);
line(175,220,170,240);
line(180,220,175,240);
line(185,220,180,240);

line(325,220,320,240);
line(330,220,325,240);
line(335,220,330,240);




