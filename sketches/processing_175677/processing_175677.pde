
Cell [] [] board;
int player = 0; //0 = player1
int win = 0; //1 = player1, 2 = gegner
int game = 0; //1 = game started
int full = 9;
int pc ;

void setup() {  
size(1000,600);
PFont font;
}

void draw() {
if(game == 0) {
background(20,40,220);
font = loadFont("ArialMT-48.vlw");
textFont(font);
textSize(70);
fill(255);
text("Klicke Enter zum Starten!",50,250);
}}


void keyPressed() {


if(game == 0) {
if(win == 0) {
if(key == ENTER) {
game =1;
win =0;
}}}
if(game == 1) {
background(20,40,220);


if(key == '1') {
fill(180,180,180);
noStroke();
ellipse(300,300,200,200);
}

if(key == '2') {
smooth();
noFill();
stroke(250,0,0);
strokeWeight(10);
ellipse(200,200,100,100);
ellipse(200,300,100,100);
noStroke();
fill(200,200,200);
triangle(350,250,350,210,550,180);
triangle(350,290,350,250,550,320);
fill(250,0,0);
triangle(220,250,255,210,255,290);
triangle(245,220,350,250,350,290);
triangle(245,240,245,217,350,290);
triangle(350,250,350,210,250,290);
triangle(250,293,250,270,350,210);
}

if(key == '3') {
noStroke();
fill(255,250,250);
rect(150,200,250,150);


}}}




if(key == '1') {
pc = random(4,6);
}
if(key == '2') {
pc = random(4,6);
}
if(key == '3') {
pc = random(4,6);
}

if(pc == 4) {
fill(180,180,180);
noStroke();
ellipse(400,300,200,200);
}

if(pc == 5) {
noStroke();
fill(255,250,250);
rect(550,200,250,150);
}






