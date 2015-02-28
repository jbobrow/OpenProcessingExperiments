
//3C
size(880,300);
background(154,192,205);
int x;
int y;
int z;
x=14;
y=50;
z=width/11;
smooth();

//dots
stroke(255);
strokeWeight(width/50);
point(y+z,height/2);
point(y+(2*z),height/2);
point(y+(3*z),height/2);
point(y+(4*z),height/2);
point(y+(6*z),height/2);
point(y+(7*z),height/2);
point(y+(8*z),height/2);
point(y+(9*z),height/2);
point(y+(10*z),height/2);

//cherry stem
stroke(0,139,69);
strokeWeight(width/220);
line(55+(5*z),height/1.95,y+(5*z),height/2.45);
line(32+(5*z),height/2.05,y+(5*z),height/2.45);


noStroke();
//cherry #1
fill(176,23,31);
ellipse(35+(5*z),height/2.05, width/48, width/48);
ellipse(58+(5*z),height/1.95, width/48, width/48);


//cherry #2
fill(220,20,60);
ellipse(32+(5*z),height/2.05, width/48, width/48);
ellipse(55+(5*z),height/1.95, width/48, width/48);


//pacman
noStroke();
fill(255,215,0);
arc(width/11, height/2, width/x, width/x,PI/6,((11*PI)/6));

//pacman eye
noStroke();
fill(0);
ellipse(width/11, height/2.25, width/(6*x), width/(6*x));





