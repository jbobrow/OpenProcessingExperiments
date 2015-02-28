
//Cartoon
size(500,500);
//ELMOS HEAD
fill(255,49,49);
strokeWeight(4); 
ellipse (250, 300, 400, 300);
//Right Eye
fill(250,250,250);
ellipse (300,175,120,120);
//Left Eye
fill(250,250,250);
ellipse (195,175,120,120);
//Mouth
fill(0,0,0);
bezier(140, 320,  200, 450, 300, 450,  360, 320);
//Nose
fill(252,187,64);
ellipse (250,270,120,140);
//Left Pupil
fill(0,0,0);
ellipse(200,175,50,50);
//Right Pupil
fill(0,0,0);
ellipse(300,175,50,50);
