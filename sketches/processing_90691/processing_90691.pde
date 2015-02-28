
size(400,400);

beginShape();
quad(60,70,150,40,160,180,100,180); 
// 1D outline
endShape();

color c1 = #F7DD70;
// main filler
noStroke();
fill(c1);
quad(60,70,150,40,160,180,100,180);
// fill 1D shape

color c2 = #CE1723;
//right eye red
stroke(c2);
noFill();
ellipse(133,80,15,13);
//outline right eye red

color c3 = #CE1723;
//left eye red
stroke(c2);
noFill();
ellipse(96,89,23,27);
//outline left eye red

color c4 = #4598DE;
//right eye blue pupil
stroke(c4);
fill(c4);
ellipse(134,80,4,3);

color c5 = #4598DE;
//left eye blue pupil
stroke(c5);
fill(c5);
ellipse(93,89,5,4);

color c6 = #4598DE;
//smile blue
noFill();
