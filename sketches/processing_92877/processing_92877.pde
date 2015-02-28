
boolean qPressed;
boolean wPressed;
boolean ePressed;
void setup()
{
size (500,500);
background(0);
}
void draw()
{
//make the paint guy red
if(qPressed){
noStroke();
fill(255,0,0);
ellipse(250,250,70,70);

stroke(255,0,0);
line(215,250,250,150);
line(285,250,250,150);

fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);

noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
}


// make the paint guy blue
if(wPressed) {
noStroke();
fill(0,0,255);
ellipse(250,250,70,70);
stroke(0,0,255);
line(215,250,250,150);
line(285,250,250,150);
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
}

//make the paint guy green
if(ePressed){
noStroke();
fill(0,255,0);
ellipse(250,250,70,70);
stroke(0,255,0);
line(215,250,250,150);
line(285,250,250,150);
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
}
else{
noStroke();
fill(255);
ellipse(250,250,70,70);
stroke(255);
line(215,250,250,150);
line(285,250,250,150);
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
}

}

void keyPressed()
{
if (key == 'q'){
qPressed = !qPressed;
}
if (key == 'w') {
wPressed = !wPressed;
}
if (key == 'e') {
ePressed = !ePressed;
}
}
