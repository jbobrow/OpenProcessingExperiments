
size (500,700);
smooth();
strokeWeight(3);
background(255);


//ears

ellipse(350,130,100,80);
ellipse(350,140,80,60);

ellipse(150,130,100,80);
ellipse(150,140,80,60);


//head


ellipse(250,200,250,210);
ellipse( 200,180,20,20); // left eye
ellipse( 300,180,20,20); //  right eye
ellipse( 250,240,90,60);
ellipse(250,230,25,25); //nose
noFill();
arc(268,242,35,30,0,PI); // right lip
arc(235,242,35,30,0,PI); // left lip

//body

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
endShape();

ellipse(250,380,90,120); //belly


