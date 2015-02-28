
//robot v 1
//Chere De Koh

size(720, 720);
background(204);
ellipseMode(RADIUS);

//Neck
noStroke();
fill(#000000);
rect(350,220,15,110);


//Head
fill(#000000);
smooth();
ellipse(350,180,40,40);
quad(310,180,390,180,394,235,308,265);

//base
fill(#000000);
ellipse(360,410,80,20); 
//HELPwanna tilt this 5.81

//torso
fill(#000000);
triangle(320,310,360,410,388,280);

//facial features!!

//eyes
fill(#FFFFFF);
ellipse(310,182,12,12);

fill(#FFFFFF);
ellipse(360,176,12,12);

//nose
fill(#FFFFFF);
triangle(335,198,335,218,300,218);

//mouth smile
fill(#FFFFFF);
triangle(315,230,315,255,354,222);




//bowtie
fill(#FFD700);
quad(340,280,340,310,370,285,370,310);

//eyebrow
noFill();
stroke(#FFFFFF);
strokeWeight(4);
strokeJoin(ROUND);
arc(360, 165, 14,14, 3.4, 5.8);

//buttons
fill(#FFFFFF);
noStroke();
ellipse(340, 320, 5, 5);

