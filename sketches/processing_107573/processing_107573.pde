
int click=0;
float birthX;
float birthY;
float restoreX = 3;
float restoreY = 7;

void setup(){
size(250,250);
smooth();

birthX=width/2;
birthY=height/2;
}

void draw(){
background(255,0,255);
birthX = birthX + restoreX;
if (birthX > width) {
restoreX = -restoreX;
}
if (birthX < 0) {
restoreX = -restoreX;
}

birthY = birthY + restoreY;
if (birthY > height) {
restoreY = -restoreY;
}
if (birthY < 0) {
restoreY = -restoreY;
}

noFill();
stroke(0, random(255), 0);
ellipse(birthX, birthY, 5, 5);
stroke(random(255), 0, random(255));
ellipse(birthX, birthY, 4, 4);
stroke(random(255), 0, 0);
ellipse(birthX, birthY, 3, 3);
stroke( 0, 0, random(255));
ellipse(birthX, birthY, 2, 2);
stroke( random(255), random(255), 0);
ellipse(birthX, birthY, 1, 1);


fill(255);
textAlign(CENTER,CENTER);
text(click,width/2,height/2);
}

void mousePressed(){
click= click+1;
}









