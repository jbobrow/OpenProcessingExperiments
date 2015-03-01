

///variables


//////HEAD
int headplace;
headplace = 225;
int headplace2;
headplace2 = 250;

////Neck to attatch to body
int neckbody;
neckbody = headplace2+149;


////NOSE
int movenosedown; 
movenosedown = 150;
int movenoseright; 
movenoseright = 60;
float makenosebigger;
makenosebigger = .8;
float makenosebigger2;
makenosebigger2 = 1.2;

////////////EYE VARIABLES
///colorforeye
int eyecenter;
eyecenter = #a1fcff;

//locationforlefteye
int locrighteye;
locrighteye = 150;

//locationforrighteye
int loclefteye;
loclefteye = 315;
int loclefteye2;
loclefteye2 = 150;

///sizeforeye
int sizeye;
sizeye = 75;
int sizeye2;
sizeye2 = 50;



///setting up
size (600, 700);
background(#9ff9ff);

///Hair. Note had trouble controlling Bezier lines. 
fill(#380fd2, 75);
stroke(#380fd2);
bezier(headplace, headplace/2, headplace2/8, headplace2/8, 80, 75, 30, 75);
fill(#380fd2);
bezier(100, 500, 6, 0, 100, 75, 30, 75);
fill(#380fd2);


///////head
noStroke();
fill (#d20f8c, 50);
ellipse (headplace, headplace2, 300, 300);
fill(#380fd2, 25);
ellipse (headplace-40, headplace2+25, 200, 179);


////neck
fill(#380fd2);
rect(headplace, headplace2+149, 20, 50, 300);


///////////////EYES
//left eye
fill(255, 255, 255);
noStroke();
ellipse(loclefteye, loclefteye2, 250-sizeye, 200-sizeye2);
fill(eyecenter);
noStroke();
ellipse(loclefteye, loclefteye2, 200-sizeye, sizeye2);
fill(0, 0, 0);
ellipse(loclefteye, loclefteye2, sizeye-55, sizeye2);

//right eye
fill(255, 255, 255);
noStroke();
ellipse(locrighteye, locrighteye, 200-sizeye, 150-sizeye2);
fill(eyecenter);
noStroke();
ellipse(locrighteye, locrighteye, 150-sizeye, sizeye2);
fill(0, 0, 0);
ellipse(locrighteye, locrighteye, sizeye-60, sizeye2);


//////////////Nose
fill(0);
beginShape ();
vertex (1 * makenosebigger2+ movenoseright, 200 *makenosebigger + movenosedown);
vertex (110* makenosebigger2 + movenoseright, 120*makenosebigger+ movenosedown);
vertex (135 * makenosebigger2+ movenoseright, 20*makenosebigger+ movenosedown);
vertex (135 * makenosebigger2+ movenoseright, 180*makenosebigger+ movenosedown);
endShape (); 

/////mainbody
fill(0);
beginShape ();
vertex (headplace, (neckbody)+50);
vertex (headplace +15, (neckbody)+50);
vertex (headplace + 35, (neckbody) + 50);
vertex (headplace- 50, (neckbody) + 75);
vertex (headplace + 100, (neckbody) + 100);
vertex (headplace - 125, (neckbody) + 125);
vertex (headplace + 150, (neckbody) + 150);
vertex (headplace - 175, (neckbody) + 175);
vertex (headplace - 200, (neckbody) + 200);
endShape();

beginShape ();
vertex (headplace, (neckbody)+50);
vertex (headplace -15, (neckbody)+50);
vertex (headplace - 35, (neckbody) + 50);
vertex (headplace+ 50, (neckbody) + 75);
vertex (headplace - 100, (neckbody) + 100);
vertex (headplace + 125, (neckbody) + 125);
vertex (headplace + 200, (neckbody) + 200);
endShape();


///Idea for legs
/*fill(#380fd2);
rect(150, 565, 20, 100, 300);*/

/////Legs 

////Left leg
fill(#380fd2);
line(100, 565, 150, 600);
line(100, 650, 150, 685);
strokeWeight (15);
fill(#380fd2);
bezier(150, 565, 200, 600, 50, 650, 100, 685);

///Right leg
fill(#380fd2);
//Lines used to guide Bezier line
/*line(100, 565, 150, 600);
line(100, 650, 150, 685);*/
strokeWeight (15);
fill(#380fd2);
bezier(225, 565, 275, 600, 225, 650, 275, 685);

//lines used to guide bezier line
/*line(300, 485, 450, 485);
line(350, 250, 500, 250);*/
strokeWeight (5);
fill(#380fd2);
bezier(300, 485, 450, 485, 350, 250, 500, 250);

///lollipop stick
fill(#019759);
rect (475, 250, 15, 200, 300);

///lollipop candy
fill (#fa0035);
ellipse (482, 200, 100, 100);
fill (#4700fa, 75);
ellipse (482, 200, 75, 75);
fill (#fa7600, 75);
ellipse (482, 200, 50, 50);
fill (#00b6fa, 75);
ellipse (482, 200, 30, 30);
fill (#fa007c);
ellipse (482, 200, 15, 15);






