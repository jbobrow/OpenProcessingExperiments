
size(2560, 1440);
background(168, 161, 234);
strokeWeight(10);

//right ear
fill(74,111,216);
ellipse(2000,900,190,370);

//left ear
fill(74,111,216);
ellipse(1150,750,170,350);

//face
fill(108, 146, 255);
ellipse(1500, 1000, 1000, 1000);

//Right eye
fill(255, 255, 255);
ellipse(width/2+500, height/2, 300, 300);
fill(0, 0, 0);
ellipse(width/2+500, height/2+30, 100, 100); //droopy pupil
//rightblush
fill(234,170,170);
ellipse(1900,950,300,100);


//Left eye
fill(255, 255, 255);
ellipse(width/2-130, height/2, 200, 200);
fill(0, 0, 0);
ellipse(width/2-130, height/2, 50, 50); //centered pupil
//leftblush
fill(234,170,170);
ellipse(1000,850,150,50);


//mouth
noFill();
ellipse(1250,1300,250,400);
fill(196, 2, 2);
ellipse(1250,1300,250,400);

//arc(1250, 1100, 500, 500, 0, PI+QUARTER_PI, CHORD);

//left hand 
fill(74,111,216);
ellipse(width/2-500, height/1, 500, 500);
ellipse(width/2-300, height/1-100, 100,200);//thumb

//right hand
fill(74,111,216);
ellipse(width/2+500, height/1, 500, 500);
ellipse(width/2+300, height/1-100, 100,200);//thumb

//nose
fill(74,111,216);
ellipse(1250,900,150,90);

//halo
stroke(255,249,59);
strokeWeight(30);
fill(168, 161, 234);
ellipse(1500,200,700,90);

//left eyebrow
stroke(0,0,0);
strokeWeight(15);
line(1000,575,1250,475);

//right eyebrow
stroke(0,0,0);
strokeWeight(20);
line(1700,400,2000,600);
