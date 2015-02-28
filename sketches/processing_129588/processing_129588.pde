
size(400,400);
background(141,182,205);

//assignment 3a
fill(139,131,134);
stroke(184,134,11);
strokeWeight(6);
int x = 200;
rect(x-40,x-150,80,80);
noFill();
stroke(139,101,8);
rect(x-45,x-155,90,90);

//assignment 3b
int y = 100;
fill(139,131,134);
stroke(139,101,8);
strokeWeight(6);
rect(x-30,y+55,y-40,x);
strokeWeight(.5);
stroke(139,131,134);
fill(139,101,8);
rect(x-55,y+35,y+10,y-80);
rect(x-55,x+155,y+10,y-90);

//assignment 3c
fill(x+40,x+40,x+40,x+40);
stroke(y-85,y-85,y-85,x+40);
strokeWeight(.04*y);
ellipse(x,y-10,y-33,y-33);
strokeWeight(.005*y);
line(204,122,168,95);
line(191,120,174,72);
point(x,y-10);
stroke(x+55,x+15,y-100,x+30);
strokeWeight(.05*y);
line(x,y+70,x+80,x+y+10);
fill(x+55,x+15,y-100,x+45);
ellipse(x+80,x+y+10,y-65,y-65);

