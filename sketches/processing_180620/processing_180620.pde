
background(0, 255, 206);
size(500, 500);
strokeWeight(4);

/*Les orelles*/

triangle(135,175, 195,135, 100, 60);
triangle(365,175, 305,135, 400,60);

/*El cap i el nas*/

ellipse(250, 250, 300, 250);
fill(0);
triangle(225, 275, 250, 225, 275, 275);
fill(255, 0, 0);
ellipse(250, 257, 20, 20);

/*El bigoti*/

/*Dret*/

line(260, 250, 450, 180);
line(260, 250, 425, 250);
line(260, 250, 450, 330);
line(260, 250, 435, 215);
line(260, 250, 435, 285);

/*Esquerre*/

line(240, 250, 50, 180);
line(240, 250, 75, 250);
line(240, 250, 50, 330);
line(240, 250, 65, 215);
line(240, 250, 65, 285);

/*Els ulls*/

fill(255);
ellipse(200, 140, 90, 65);
ellipse(300, 140, 90, 65);


stroke(0);
strokeWeight(6);

/*Boca + llengua*/

ellipse(250,315, 100, 60);
stroke(255,0,0);
fill(255,0,0);
ellipse(250,324,77,32);


strokeWeight(4);
stroke(0);

/*Samarreta sense color + braços i mans*/

triangle(250, 375, 100, 500, 400, 500);
//line(309, 425, 425, 375);
//line(191, 425, 75, 375);
fill(255);
triangle(309,425, 334,450,425,375);
triangle(191,425,166,450,75,375);

/*Ulls*/

fill(255);
ellipse(425, 375, 50, 50);
ellipse(75, 375, 50, 50);
fill(0);
ellipse(200, 140, 35, 29);
ellipse(300, 140, 35, 29);
fill(255);
ellipse(300,140,15,15);
ellipse(200,140,15,15);

/*Això és la senyera de la samarreta*/

fill(255, 247, 0);
quad(100, 500, 100, 500, 150, 460, 150, 500);
fill(255, 0, 0);
quad(150, 460, 150, 500, 178, 500, 178, 437);
fill(255,247,0);
quad(178, 500, 178, 437, 202, 415, 202, 500);
fill(255,0,0);
quad(202,415,202,500, 235,500, 235, 387);
fill(255,247,0);
quad(235,500,235,387,265, 387, 265,500);
fill(255,0,0);
quad(265,387,265,500,295,500,295,412);
fill(255,247,0);
quad(295,500,295,412,325,437,325,500);
fill(255,0,0);
quad(325,437,325,500,355,500,355,463);
fill(255,247,0);
quad(355,500,355,463,400,500,400,500);

/*La bola del coll*/

fill(0);
//fill(147, 143, 10);
ellipse(250, 380, 20, 20);

/*"Pajarita"*/

fill(0);
triangle(250,380,200,350,200,413);
triangle(250,380,300,350,300,413);

