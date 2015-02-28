
size(500, 500); 
smooth(); 
strokeWeight(2); 
background(204); 


//body top
fill(62, 243, 88);
rect(175, 200, 150, 140);

//shorts
strokeWeight(2);
fill(97, 25, 45);
rect(175, 340, 150, 60);

//belt
line(175, 340, 325, 340);
line(175, 360, 325, 360);

//legs
fill(97, 25, 45);
rect(200, 400, 40, 25);
rect(260, 400, 40, 25);
fill(255);
rect(210, 425, 15, 25);
rect(275, 425, 15, 25);

//shoes
fill(0);
rect(210, 450, 15, 20);
ellipse(208, 463, 30, 15);
rect(275, 450, 15, 20);
ellipse(292, 463, 30, 15);

//Left eye
int Eyeballx = 125;
int Eyebally = 45;
int Pupilx = Eyeballx + 15; 
int Pupily = Eyebally - 20;
int blackx = Pupilx - 4;
int blacky = Pupily + 10;
line(Eyeballx, Eyebally+40, 200, 200); //eyes stick
fill(255); //eyeball white
ellipse(Eyeballx, Eyebally, 100, 100);
fill(8, 30, 247); //blue pupil
ellipse(Pupilx, Pupily, 40, 40);
fill(0); //Eye black
ellipse (blackx, blacky, 10, 10);

//right eye
int Eyeballx2 = 370;
int Eyebally2 = 150;
int Pupilx2 = Eyeballx2 + 5; 
int Pupily2 = Eyebally2 - 5;
int blackx2 = Pupilx2 + 2;
int blacky2 = Pupily2 - 3;
line(Eyeballx2, Eyebally2+10, 300, 200); //eye stick
fill(255);
ellipse (Eyeballx2, Eyebally2, 40, 40); //eyeball white
fill(8, 30, 247); 
ellipse(Pupilx2, Pupily2, 20, 20); //blue pupil
fill (0);
ellipse(blackx2, blacky2, 8, 8); //eye black

//mouth
fill(184, 12, 60);
arc(250, 200, 100, 70, radians(0), radians(180)); 

//teeth
fill(255);
rect(210, 200, 30, 50);
rect(260, 200, 30, 50);

//sponge blobs
fill( 243, 62, 241);
ellipse( 200, 275, 10, 30);
ellipse( 225, 290, 10, 13);
ellipse (210, 305, 15, 12);







