
float ballx= 250;
float bally= 250;
int x, y, p1, p2;
float ballDirectionX =-2.0;
float ballDirectionY =-2.0;
int player1x,player2x;
int player1y = 50,player2y =50; 
int score1, score2;
import ddf.minim.*;
AudioSample klong, ding, applaus,torpedo;
Minim minim;

void setup() {
  size(500, 500);
frameRate(60);
minim= new Minim(this);
klong = minim.loadSample("klong.mp3");
ding = minim.loadSample("tos-computer-06.mp3");
torpedo = minim.loadSample("tos-photon-torpedo-1.mp3");
applaus = minim.loadSample("applaus.mp3");

}

void draw() {
background(0);
if ((bally <= 10)||(bally>=490)) {
  ballDirectionY = -1.0*ballDirectionY;
  ding.trigger(); }
  float dist1 = bally-player1y;
  float dist2 = bally-mouseY;
  //p1
 if ((ballx==40)&&(dist1>=-4)&&(dist1<=24)) {
  ballDirectionY =  1.0*ballDirectionY; 
  ballDirectionX = -1.0*ballDirectionX;
 klong.trigger(); }
 if ((ballx==40)&&(dist1>=25)&&(dist1<=75)) {
  ballDirectionY = -1.0*ballDirectionY; 
  ballDirectionX = -1.0*ballDirectionX;
 klong.trigger(); }
 if ((ballx==40)&&(dist1>=76)&&(dist1<=103)) {
  ballDirectionY =  1.0*ballDirectionY; 
  ballDirectionX = -1.0*ballDirectionX;
  klong.trigger(); }
  //p2
 if ((ballx==450)&&(dist2>=-4)&&(dist2<=24)) {
  ballDirectionY =  1.0*ballDirectionY; 
  ballDirectionX = -1.0*ballDirectionX;
 klong.trigger(); }
 if ((ballx==450)&&(dist2>=25)&&(dist2<=75)) {
  ballDirectionY = -1.0*ballDirectionY; 
  ballDirectionX = -1.0*ballDirectionX; 
klong.trigger();}
 if ((ballx==450)&&(dist2>=76)&&(dist2<=103)) {
  ballDirectionY =  1.0*ballDirectionY; 
  ballDirectionX = -1.0*ballDirectionX; 
klong.trigger();}
  
ballx = ballx + ballDirectionX;
bally = bally + ballDirectionY;
text(score1,200,55);
text(score2,300,55);
textSize(50);
drawBall(ballx, bally);
drawMittellinie(); 
int grau = (int)(255);
fill(grau);
if (p1 == 's') {
    player1y++; }
if (p1 == 'w') {
    player1y--; }  
if (score1>6) {
  won1(); }
if (score2>6) {
    won2(); }
drawPlayer1(20, player1y);
drawPlayer2(460,mouseY);

if (ballx>520) {
   reset();
score2+=1;
ballDirectionX =-1.0;
ballDirectionY =-1.0;  
}
if (ballx<-20) {
    reset();
score1+=1;
ballDirectionX =-2.0;
ballDirectionY =-2.0;}
}
void reset() {
 torpedo.trigger();
 ballx = 250;
 bally = 250;
 drawPlayer1(20,250);
 drawPlayer2(460,250);
 delay(1000);
 }
 
void won1() {
  background(0);
  textSize(30);
 text("Glückwunsch, Spieler 1, jewonnen!", 10, 250); }
 
 void won2() {
    background(0);
  textSize(30);
 text("Glückwunsch, Spieler 2, jewonnen!", 10, 250); } 


void keyPressed() {
  p1 = key;  }

void keyReleased() {
   p1 = -1; }

void drawPlayer1(int player1x, int player1y) {
  rect (player1x, player1y, 20, 100); }

void drawPlayer2(int player2x, int mouseY) {
rect (player2x, mouseY, 20, 100); }

void drawBall(float ballx,float bally) {
ellipse(ballx,bally, 20, 20); }

void drawMittellinie() {
for (int i = 0; i < 500;i = i+20) {
  rect (255, i, 10, 10);  }
  
}


