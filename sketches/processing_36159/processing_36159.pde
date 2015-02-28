
size(500, 800);
background (255, 255, 255);

//face 
fill(232,187,176);
strokeWeight(2);
stroke(232,187,176);
ellipse(250,460,300,300);

//ears
ellipse(100,400,100,100);
ellipse(400,400,100,100);

//hat
fill(119,49,180);
stroke(119,49,180);
triangle(140, 170, 146, 350, 254, 310);

fill(94,203,232);
stroke(94,203,232);
ellipse (140,170,30,30);

quad(142, 330, 240, 280, 280, 310, 146, 350);


//left eye
stroke(255,255,255);
fill(255,255,255);
arc(170, 400, 57, 57, 0, 2*PI);

stroke(0,0,0);
fill(0,0,0);
arc(170, 400, 50, 50, 0, PI/.55);

//right eye
stroke(255,255,255);
strokeWeight(0);
fill(255,255,255);
arc(330, 400, 57, 57, 0, 2*PI);

stroke(0,0,0);
fill(0,0,0);
arc(330, 400, 50, 50, 0, PI/.55);



//mouth
stroke(229,46,80);
fill(229,46,80);
arc(250, 460, 130, 170, 0, PI/1);

//teeth
stroke(255,255,255);
fill(255,255,255);
rect(225, 460, 50, 50);


//moustache
stroke(0,0,0);
fill(0,0,0);
ellipse(226,460,50,50);
ellipse(274,460,50,50);
arc(210, 460, 80, 80, 0, PI/1);
arc(290, 460, 80, 80, 0, PI/1);









                
