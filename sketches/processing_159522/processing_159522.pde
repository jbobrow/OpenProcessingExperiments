
//window and settings
size (400, 400);
smooth();

//my kirby
fill(255,188,242);
ellipse(275,200,80,40); //left arm
ellipse(125,200,80,40); //right arm
ellipse(200,200,150,150); //main body
fill(255,2,134);
ellipse(240,210,30,10); //left rosy cheek
ellipse(160,210,30,10); //right rosy cheek
fill(0,0,0);
ellipse(200,250,50,25); //mouth
fill(0,0,0);
ellipse(220,180,20,50); //left eye
ellipse(180,180,20,50); //right eye
fill(255,255,255);
ellipse(220,190,10,20); //left pupil
ellipse(180,190,10,20); //right pupil
fill(255,2,70);
//foot 1
translate(150,275);
rotate(-0.4);
ellipse(0,-10,40,80);
rotate(0.4);
//foot 2
translate(100,0);
rotate(0.4);
ellipse(0,-10,40,80);
