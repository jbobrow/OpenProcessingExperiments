
Cell [] [] board;
int player = 0; //0 = player1
int win = 0; //1 = player1, 2 = gegner
int game = 0; //1 = game started
int full = 9;
int pcwahl;


void setup(){
size(1000,600);
PFont font;
}

void draw() {
if(game == 0) {
background(30,200,0);
font = loadFont("ArialMT-48.vlw");
textFont(font);
textSize(60);
fill(255);
text("Klicke Enter um zu spielen!",50,250);
}}

 



void keyPressed(){

if(game == 0) {
if(key == ENTER) {
game =1;
}}
if(game == 1) {
background(20,40,220);
 }


if(key == '1'){
background(30,200,0);
fill(200,200,200);
noStroke();
smooth();
ellipse(300,300,450,265);
}

if(key == '2'){
background(30,200,0);
fill(255,255,255);
noStroke();
rect(100,200,300,200);
}

if( key == '3'){
background(30,200,0);
fill(200,200,200);
noStroke();
triangle(250,260,250,210,700,500);
triangle(250,360,250,430,700,100);
noFill();
stroke(0,0,235);
strokeWeight(30);
ellipse(150,240,200,100);
ellipse(200,400,100,100);
fill(0,0,0);
noStroke()
ellipse(375,310,35,35);
}}

if(key==1){
if( key==2)
if(key == 3)



pcwahl=random(4,6);

if(pcwahl == 4){
fill(200,200,200);
noStroke();
smooth();
ellipse(700,300,300,165);
}

if(pcwahl == 5){
fill(255,255,255);
noStroke();
rect(600,200,300,200);
}}
}


