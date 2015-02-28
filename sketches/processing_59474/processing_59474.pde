
PFont titleFont; 
PFont scoreFont; 
PFont basicFont;
PFont subf;
PImage fcoin;
PImage pig;
PImage room;
Balls oneBall[]= new Balls[1];
Piggy firstPiggy;
int INTRO = 0;
int RUN_GAME = 1;
int GAME_OVER = 2;
int gameState = INTRO;
float speed = .09;
float gravity = 10;
Scorecount score;


void setup () { 
size(550, 700);
smooth();
fcoin = loadImage("coin_mario.png");
pig = loadImage("piggy.png");
room = loadImage("andysroom.jpg");
subf= createFont ("Arial", 18, true);
titleFont = createFont("Impact", 48);
scoreFont = createFont("14Segment", 24);
basicFont = createFont("Courier", 18);

firstPiggy= new Piggy();
oneBall= new Balls[1];
oneBall[0] = new Balls ();
score= new Scorecount();
}

void draw () {

if (gameState == INTRO) {
intro();
}
else if (gameState == RUN_GAME) {
run_game();
}
else if (gameState == GAME_OVER) {
game_over();
}
}


class Balls {
float ballX;
float ballY;
float w;
float l;
float speed;



Balls () { 
ballX=(random(20,100));
ballY=(random(20,100));
w=25;
l=25;
speed = 3;
}
void displayball () {

image (fcoin, ballX, ballY, l, w);
}
void drop() {
speed +=.01;
ballY +=speed;
if (ballY > height) {
score.catchcoin (ballX);
}


}
}


class Piggy {
float xpaddlepos;
float ypaddlepos;
float paddlewidth;
float paddlelength;
float x;


Piggy () {
paddlewidth=275;
paddlelength=250;

}
void displayPiggy() { 
x += (mouseX-x) * 0.25 ;
xpaddlepos=mouseX;
ypaddlepos=height-85;
image (pig, x, ypaddlepos, paddlewidth, paddlelength);
}

}

class Scorecount {
int score;

Scorecount () {
score=0;
}

void catchcoin(float bx) {
float balldistance = abs (mouseX - bx);

if (balldistance < firstPiggy.paddlewidth) {
score +=1;
Balls tempballs = new Balls();
oneBall = (Balls[])append (oneBall,tempballs);
}
else gameState=GAME_OVER;
}

void showscore() {
text ( "score : " +score, 15, 15);
}
}







void intro() {
background(255, 192, 203);


fill(255);
// draw the title screen
textFont(titleFont);

text("Oinker's Piggy Bank", 50, 50);
textFont(subf);
text("Click anywhere to start", width/2, height/3 * 2);
}

void run_game() {

imageMode(CENTER);
image(room, 200, 350);
for (int i=0; i < oneBall.length; i++ ) {


oneBall[i].displayball();
oneBall[i].drop();
score.showscore();


}
firstPiggy.displayPiggy();
}



void game_over() {
background(255, 192, 203);

fill(0);
textFont(titleFont);
textAlign(CENTER);
text("Game Over", width/2, height/2);
textFont(subf);
text("Click anywhere to play again", width/2, height/3 * 2);


}



void mousePressed() {
if (gameState == GAME_OVER || gameState == INTRO) {
gameState = RUN_GAME;
}
}

