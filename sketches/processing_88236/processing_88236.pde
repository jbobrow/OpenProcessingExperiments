
//background
size(400,500);
background(129,103,90);

//hair
fill(55,35,28);
ellipse(180,250,200,315);

//head
fill(232,153,123);
strokeWeight(0);
ellipse(180,280,200,300);
//eyebrows
strokeWeight(15);
line (100, 250, 150, 240) ; 
line(205, 240,255, 260) ;

//eyes
strokeWeight (1);
fill (255, 255, 240) ;
ellipse (120, 265, 50, 13) ; 
fill (255, 255, 240) ; 
ellipse (225, 265, 50, 13);
fill (139, 69, 19) ; 
ellipse (120, 265, 8, 8);
fill (139, 69, 19) ; 
ellipse (225, 265, 8, 8);

//noise
strokeWeight(2);
line(180,250,180,330); 
ellipse(180,330,5,5);

//lips
noFill();
bezier(120,370,120,350,180,370,180,370);

bezier(180,370,180,350,240,350,240,370);

bezier(240,350,240,370,120,370,120,350);

//ears
stroke(2);

line(75,300,90,300);
bezier(90,265,75,265,90,300,75,300);


line(275,300,290,300);
bezier(275,265,290,265,275,300,290,300);


 




