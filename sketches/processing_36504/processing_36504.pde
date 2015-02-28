
size(300,300);// creates a 300x300 pixel sketch: size(width,height);
smooth();// turns on anti-aliasing to make shapes look nicer

/************************************************
*        EYES
************************************************/
fill(250, 200, 0);// eye color
strokeWeight (3);
stroke(255, 0, 0);// eye outline 
bezier(55, 123, 30, 200, 120, 200, 140, 165);// left eye
bezier(245, 123, 270, 200, 180, 200, 160, 167);// right eye

/*LEFT EYE*/
fill(0, 220, 255, 100);// eye color
noStroke ();
ellipse (100, 150, 10, 10);
ellipse (80, 170, 10, 10);
ellipse (120, 170, 10, 10);
ellipse (90, 180, 10, 10);
ellipse (105, 165, 10, 10);
/*RIGHT EYE*/
ellipse (200, 150, 10, 10);
ellipse (220, 170, 10, 10);
ellipse (180, 170, 10, 10);
ellipse (210, 180, 10, 10);
ellipse (195, 165, 10, 10);

/************************************************
*        mouth
************************************************/
noFill ();
strokeWeight (2);
stroke (0, 0, 0, 180);
bezier (10, 270, 40, 150, 150, 270, 150, 170);// left moustache 1
bezier (10, 250, 40, 150, 150, 270, 150, 170);// left moustache 2
bezier (10, 290, 40, 150, 150, 270, 150, 170);// left moustache 3
bezier (20, 300, 40, 150, 150, 270, 150, 170);// left moustache 4
bezier (150, 170, 150, 270, 270, 150, 290, 270);// right moustache 1
bezier (150, 170, 150, 270, 270, 150, 290, 250);// right moustache 2
bezier (150, 170, 150, 270, 270, 150, 290, 290);// right moustache 3
bezier (150, 170, 150, 270, 270, 150, 280, 300);// right moustache 4

fill(0, 20, 0);// mouth color
noStroke();
ellipse (150, 350, 200, 300);

/* TEETH */
fill (255, 255, 255);
triangle (90, 270, 60, 320, 70, 350);
triangle (120, 250, 80, 320, 100, 350);
triangle (140, 260, 90, 350, 150, 370);
triangle (160, 260, 210, 350, 150, 370);
triangle (180, 250, 220, 320, 200, 350);
triangle (210, 270, 240, 320, 230, 350);


/************************************************
*        NOSE
************************************************/
fill(255, 0, 0);// skin color
noStroke();
ellipse(150,190,20,55);
ellipse(150,205,60,30);
fill(100, 0, 0);// skin color
ellipse(135,210,15,10);// left nostril
ellipse(165,210,15,10);// right nostril

/************************************************
*        CHEEKS
************************************************/
noFill ();
strokeWeight (1);
stroke (0, 0, 0);
bezier(30, 100, 30, 30, 70, 30, 150, 30);// left forehead
bezier(150, 30, 230, 30, 270, 30, 270, 100);// right forehead
bezier(50, 150, 10, 200, 70, 220, 100, 200);// left cheek 1
bezier(60, 150, 20, 180, 70, 220, 100, 190);// left cheek 2
bezier(250, 150, 290, 200, 230, 220, 200, 200);// right cheek 1
bezier(240, 150, 280, 180, 230, 220, 200, 190);// right cheek 1

/************************************************
*        BIG HORN
************************************************/
fill(255, 255, 255);// HORN color
stroke (100, 100, 100);
strokeWeight (1);
triangle(55, 9, 110, 100, 85, 100);// left horn 1
triangle(55, 9, 85, 100, 75, 100);// left horn 2
triangle(245, 9, 190, 100, 215, 100);// right horn 1
triangle(245, 9, 215, 100, 225, 100);// right horn 2

/************************************************
*        LITTLE HORN
************************************************/
triangle(40, 90, 35, 103, 50, 112);// left horn 1
triangle(60, 95, 50, 112, 70, 123);// left horn 2
triangle(90, 80, 70, 123, 90, 135);// left horn 3
triangle(100, 105, 90, 135, 110, 147);// left horn 4
triangle(120, 130, 110, 147, 130, 158);// left horn 5
triangle(260, 90, 265, 103, 250, 112);// right horn 1
triangle(240, 95, 250, 112, 230, 123);// right horn 2
triangle(210, 80, 230, 123, 210, 135);// right horn 3
triangle(200, 105, 210, 135, 190, 147);// right horn 4
triangle(180, 130, 190, 147, 170, 158);// right horn 5

/* EYEBROW */
stroke (255, 0, 0);
strokeWeight (3);
line (0, 81, 150, 170);// eyebrow left 1
line (300, 81, 150, 170);// eyebrow right 1
line (30,110, 150, 170);// eyebrow left 2
line (270,110, 150, 170);// eyebrow right 2

/* ZITS*/
noStroke ();
fill (255, 0 ,0);
ellipse (150, 50, 5, 5);
ellipse (160, 30, 5, 5);
ellipse (170, 55, 5, 5);
ellipse (165, 35, 5, 5);
ellipse (145, 60, 5, 5);
ellipse (140, 58, 5, 5);
ellipse (180, 70, 5, 5);
ellipse (150, 66, 5, 5);
ellipse (140, 20, 5, 5);
ellipse (130, 50, 5, 5);
ellipse (150, 150, 5, 5);
ellipse (145, 140, 5, 5);
ellipse (127, 118, 5, 5);
ellipse (160, 110, 5, 5);
ellipse (90, 170, 5, 5);
ellipse (210, 170, 5, 5);








