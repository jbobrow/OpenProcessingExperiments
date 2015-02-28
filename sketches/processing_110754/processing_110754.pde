
size(500,500);
smooth();

background(0);

//top
int xpos = 250;
int ypos = 100;

triangle(xpos,ypos-80, xpos+30,ypos+10, xpos-30,ypos+10);

//face
fill(255);
stroke(255);
ellipse(250,400, 530,600);

//eyes
int xpos1 = 130;
int ypos1 = 250;
int xpos2 = 370;

stroke(0);
ellipse(xpos1, ypos1, 100,100);
fill(0);
ellipse(xpos1, ypos1, 70,70);

stroke(0);
fill(255);
ellipse(xpos2, ypos1, 100,100);
fill(0);
ellipse(xpos2, ypos1, 70,70);

//nose
fill(255);
triangle(250,250, 270,320, 230,320);

//mouth
int ypos2 = 400;

fill(0);
triangle(xpos,ypos2-20, xpos+70,ypos2, xpos-70,ypos2);
triangle(xpos,ypos2+70, xpos+70,ypos2, xpos-70,ypos2);



