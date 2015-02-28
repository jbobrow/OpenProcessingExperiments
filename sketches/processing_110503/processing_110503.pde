

import ddf.minim.*;

Minim minim;
AudioSample bounce;

float x = 100, y = 100;
float xSpeed = random(3,4);
float ySpeed = random(3,4);

boolean repeat = true;

int ins1 = 256;
int ins2 = 0;
int ins3 = 0;
int ins4 = 0;
int ins5 = 0;

float red = random(128,255);
float green = random(128,255);
float blue = random(128,255);

boolean start = false;
float c = 10, d = 10;
float cSpeed = random(2,4);
float dSpeed = random(2,4);

int life = 10, score = 0;

float a = 200;
float aSpeed = random(2,4) ;
float b = 0;

float r1x = 500;
float r1xSpeed = random(2,4) ;
float r1y = 200;

float r2x = -300;
float r2xSpeed = random(2,4) ;
float r2y = 300;

float r3x = -300;
float r3xSpeed = random(2,4) ;
float r3y = 100;

PImage img;


void setup() {

size(500, 500);
noStroke(); 
noCursor();
img = loadImage("green.png");

minim = new Minim(this);
bounce = minim.loadSample("bgmusic.mp3");

bounce.trigger();

}

void draw() { 

if (keyPressed) {

if ( key == 'p' || key == 'P'){  
start = true;
}
}

else {

fill( 0, 32);
rect( 0, 0, width, height);

fill( 0, 32);
image ( img, 0 , 0);

fill( 255,0,0,64);
rect( 0, height - 25, width, 25);
fill (255,162,206);
textSize (13);
text ("- Your Life point will be deducted if your ball hits this area -", 50 ,height-10);
/*
if ( repeat == true ){
for ( int i = 0 ; i < 10 ; i++){
float bgcolor1 = random(0,255);
float bgcolor2 = random(0,255);
float bgcolor3 = random(0,255);
float bgpos = random(0,500);
float bgsize = random(10,500);
float alp = random(1,15);

fill(bgcolor1, bgcolor2, bgcolor3, alp);
noStroke(); 
ellipse( bgpos , bgpos, bgsize , bgsize );
println(i);

}

}
*/

//instructions

textSize( 15 );
fill ( 255 , ins1);
text ("Hello! Welcome to this game.", 130, 200);
text ("This is a game using bouncing ball to hit a target.", 80, 220);
text ("There are a total of 4 levels in this game and ", 80, 240);
text ("instructions will be provided in the game for reference.", 60, 260);
text ("Use your mouse to control the bar.", 130, 280);
fill ( 255,0,0 , ins1);
text ("If you are ready, click on the screen and press P to start.", 40, 300); 

}

if ( start == true ){

fill( 0, 64);
rect( 0, 0, width, height);

if (score < 5 ){
ins1 = 0;
ins2 = 128;

}
if (score >=5 && score < 10){
ins2 = 0;
ins3 = 128;

}

if (score >=10 && score <15){
ins3 = 0;
ins4 = 128;

}

if ( score >=15){
ins4 = 0;
ins5 = 128; 

}

//instructions

fill ( 255 , 252, 20, ins2);
textSize( 17 );
text ("Level 1 - Hit the stationary target", 80, 190);
fill ( 255 , ins2);
textSize( 15 );
text ("Try to make the ball hitting onto the marked area. ", 80, 220);
text ("Every success hit will earn you 1 score. ",80, 240);
text ("You may promote to Level 2 if you earn to 5 score. ",80, 260);

fill ( 140 , 255, 63, ins3);
textSize( 17 );
text ("Level 2 - Hit the moving target", 80, 190);
fill ( 255 , ins3);
textSize( 15 );
text ("Try to make the ball hitting onto the marked area. ", 80, 220);
text ("Every success hit will earn you 1 score. ", 80, 240);
text ("You may promote to Level 3 if you earn to 10 score. ", 80, 260);

fill ( 63, 255, 244 , ins4);
textSize( 17 );
text ("Level 3 - Pass through the barriers and Hit the target", 30, 190);
textSize( 15 );
fill ( 255 , ins4);
text ("Try to make the ball hitting onto the marked area. ", 70, 220);
text ("Every success hit will earn you 1 score. ", 70, 240);
text ("You may promote to Level 4 if you earn to 15 score. ", 70, 260);

fill ( 199, 0, 0 , ins5);
textSize( 17 );
text ("Level 4 - Hit the moving target USING TWO BALLS", 20, 190);
fill ( 255 , ins5);
textSize( 15 );
text ("Try to make the balls hitting onto the marked area. ", 20, 220);
text ("Every success hit will earn you 1 score. ", 20, 240);
text ("This is the last level, try to see how long you can hold on(: ", 20, 260);

//moving rect
fill( red, green, blue ,0);
stroke( red, green, blue );
rect( a, b, 100, 30);

noStroke();
fill( red, green, blue);
rect( a-4, b, 4, 30);

fill( red, green, blue);
rect( a+100, b, 4, 30);

textSize( 13 );
fill( red, green, blue);
text( "Hit this Area!", a+ 10 , b+20);

// Level 1

if ( score >= 5 ){

a = a + aSpeed;

}

if (a < 0 || a > width-108) {
aSpeed = -aSpeed;
}

//get the score

if ( x >= (a-4) && x <= (a+104) && y < 5){
score++;
red = random(0,255);
green = random(0,255);
blue = random(0,255);
}

if ( c >= a && x <= (a+100) && d < 5){
score++;
red = random(0,255);
green = random(0,255);
blue = random(0,255);
}

// bouncing ball
for ( int i = 0 ; i < 15 ; i++){
float bgcolor1 = random(128,255);
float bgcolor2 = random(128,255);
float bgcolor3 = random(128,255);


fill(bgcolor1, bgcolor2, bgcolor3);
noStroke(); 
ellipse(x, y, 10, 10);

}

x = x + xSpeed;
y = y + ySpeed;

//bar
fill(255,255);
rect (mouseX, 430, 50, 10);

//rebounce of ball

if ( y > 430 && y < 435 && x > mouseX && x < (mouseX + 50)) {
ySpeed = -ySpeed;
}

//life & score

textSize ( 16 );
fill(255,255,0);
text("Life: "+life,10,15);
text("Score: "+score,10,30);

//rebounce when touching the wall
if (x > width-5 || x < 5) {
xSpeed = -xSpeed;
}
if (y > width-5 || y < 5) {
ySpeed = -ySpeed;
}

//deduction of life

if (y > width-5 || d > width-5 ){
life--; 
}

if ( life == 0 ){
life--; 

noLoop();

fill(0,0,0,128);
rect(0,0,width,height);
fill(255,128,0);
textSize(40);
text("GAME OVER-",220,250);
textSize(13);
text("Your final score is "+score ,240, 300);
text("Press S to restart the game.",240, 320);

}

// create another ball (level 4)

if ( score >= 15){
fill(255,128,0);
ellipse(c, d, 10, 10);

c = c + cSpeed;
d = d + dSpeed;

}

if ( d > 430 && d < 435 && c > mouseX && c < (mouseX + 50)) {
dSpeed = -dSpeed;

}

if (c > width-5 || c < 5) {
cSpeed = -cSpeed;
}
if (d > width-5 || d < 5) {
dSpeed = -dSpeed;
} 

//moving barrier (level 3)

if (score >=10 ) { 

////////1

fill ( 255, 0 , 0);
rect ( r1x, r1y, 300 , 10);

r1x = r1x - r1xSpeed;

if ( r1x < 200 || r1x > 500){

r1xSpeed = -r1xSpeed;
}

if ( y > r1y && y < (r1y + 10) && x > r1x && x < (r1x + 300)) {
ySpeed = -ySpeed;

}

if ( d > r1y && d < (r1y + 10) && c > r1x && c < (r1x + 300)) {
dSpeed = -dSpeed;

}

//////2
fill ( 255, 0 , 0);
rect ( r2x, r2y, 300 , 10);

r2x = r2x + r2xSpeed;

if ( r2x < -300 || r2x > 0){

r2xSpeed = -r2xSpeed;
}

if ( y > r2y && y < (r2y + 10) && x > r2x && x < (r2x + 300)) {
ySpeed = -ySpeed;

}

if ( d > r2y && d < (r2y + 10) && c > r2x && c < (r2x + 300)) {
dSpeed = -dSpeed;

}

//////3
fill ( 255, 0 , 0);
rect ( r3x, r3y, 300 , 10);

r3x = r3x + r3xSpeed;

if ( r3x < -300 || r3x > 0){

r3xSpeed = -r3xSpeed;
}

if ( d > r3y && d < (r3y + 10) && c > r3x && c < (r3x + 300)) {
dSpeed = -dSpeed;

}

if ( y > r3y && y < (r3y + 10) && x > r3x && x < (r3x + 300)) {
ySpeed = -ySpeed;

}

}

}

}

void keyReleased() {
if ( key == 's' || key == 'S') {
loop();
score = 0;
life = 10;
a = 200;
ins1 = 0;
ins2 = 0;
ins3 = 0;
ins4 = 0;
ins5 = 0;
}
}

