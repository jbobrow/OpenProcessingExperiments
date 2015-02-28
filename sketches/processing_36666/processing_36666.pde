
size(600,600);// creates a 300x300 pixel sketch: size(width,height);
background(0, 0, 0);
strokeWeight (1);
smooth();// turns on anti-aliasing to make shapes look nicer

fill(198, 95, 12);
rect(110, 60, 375, 600);//hair




fill(255, 200, 150);// right ear
ellipse(450, 300, 60, 80);

fill(255, 200, 150);// right inner ear
ellipse(450, 300, 40, 65);

fill(255, 200, 150);// neck
ellipse(300, 600, 175, 425);

fill(255, 200, 150);// round face
ellipse(300, 300, 300, 425);



fill(198, 95, 12);
rect(110, 60, 375, 130);//hair/bangs

fill(255, 200, 150);// left ear
ellipse(150, 300, 60, 80);

fill(255, 200, 150);// left inner ear
ellipse(150, 300, 40, 65);


 
/************************************************
*        EYES
************************************************/
fill(255);// white of left eye
ellipse(80 + 195, 66 +177, 75, 50);// rings around left eye

fill(21, 120, 152);// left iris
ellipse(80 + 195, 66+168, 31, 31);

fill(255);// white of right eye
ellipse(220 + 180, 66+177, 75, 50);// rings around right eye

fill(21, 120, 152);// right iris
ellipse(220 + 180, 66+168, 31, 31);
 
fill(0);// pupil
ellipse(80 +195,66+160,15,15);// left eye
ellipse(220+180,66+160,15,15);// right eye

fill(255);// reflection
ellipse(83 +195,60+2+160,8,8);// left eye
ellipse(223+180,60+2+160,8,8);// right eye
noFill();
 
/************************************************
*        NOSE
************************************************/
fill(247, 185, 128);// skin color
ellipse(340, 310, 65, 40);


fill(206, 38, 16);// lips
ellipse(340, 400, 85, 50);
fill(255);// teeth
ellipse(340, 400, 70, 19);
line (10, 40, 70, 1);
 
 fill(196, 72, 12);// eyebrow
rect(235, 200, 75, 6);

fill(196, 72, 12);// eyebrow
rect(350, 200, 75, 6);




