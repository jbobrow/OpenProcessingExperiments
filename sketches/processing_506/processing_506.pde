
float posX=0;
float posY=0;
boolean dig=true;
boolean down=true;

void setup (){
background (179);
size (400, 400);
fill(157,234,237);
stroke (157,234,237);
smooth();
strokeWeight(80);
strokeJoin(ROUND);
rect (100,100,200,200);
smooth ();}

void draw () {
if(mousePressed) {
fill (179);
noStroke();
ellipse(pmouseX, pmouseY, 25, 25);
fill (255,0,0, 55);
stroke(200,0,0, 75);
strokeWeight (5);
ellipse(mouseX, mouseY, 10, 10);
}
}

