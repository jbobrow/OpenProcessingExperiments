
int y = 0;
void setup() {
//boksen
size(500,300);
}

void draw() {
//baggrund
background(0,124,255);

//taget
fill(0,0,0);
triangle(30,60,120,60,75,15);

//huset
stroke(0,0,0);
fill(255,0,0);
rect(30,60,90,90);

//dør
fill(0,0,0);
rect(45,90,30,60);

//vindue
 fill(random(0,255),random(0,255),random(0,255));
rect(90,75,20,20);

//græsplæne
fill(0,255,0);
stroke(0,0,0,255);
rect(-1,150,501,300);

//skyer
stroke(0,0,0);
 fill(random(0,255),random(0,255),random(0,255));
ellipse(230,20,120,40);
 fill(random(0,255),random(0,255),random(0,255));
ellipse(300,30,120,40);

//sol
 fill(random(0,255),random(0,255),random(0,255));
ellipse(450,30,50,50);

//tændstiksmand

//hoved
fill(0,0,0);
ellipse(230+y,100,15,15);

//krop
line(230+y,100,230+y,130);

//arme
line(245+y,100,230+y,120);//højre arm
line(215+y,100,230+y,120);//venstre arm

//ben
line(245+y,150,230+y,130);//højre ben
line(215+y,150,230+y,130);//venstre ben
  y=y+1;
}




