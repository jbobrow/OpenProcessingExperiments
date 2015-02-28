
//LS Bonus. Music. Time. OVERLAPPED FIXED!!!
// To do:
//        Figure out combined click events
//Notes: Sligght loophole: LSB can be revoked if HP is not EXACTLY 15.
//For example, if Player 1 get LSB and Player 2 has 20HP and gets hit, final HP for P2 is 5, but P2 does not acquire LSB 
int player1 = 100;
int player2 = 100;
int t;
import ddf.minim.*;
Minim minim;
AudioSample start;
AudioSample hit;
AudioSample lsb;

void setup()
{
  size(700,750);
  minim = new Minim(this);
  hit = minim.loadSample("hit.wav", 2048);
  lsb = minim.loadSample("lsb.wav", 2048);
  start = minim.loadSample("start.wav", 2048);
}

//Damage System
void mouseReleased()
{
  int dmg1=5;
  int dmg2=5;
  int laststand=3;
//Laststand bonus for Player 1
if (player1>=15){
  dmg2=5;
}else{
  dmg2*=laststand;
}
//Laststand bonus for Player 2
if (player2>=15){
  dmg1=5;
}else{
  dmg1*=laststand;
}

if (player1 == 15){
  lsb.trigger();
}
if (player2 == 15){
  lsb.trigger();
}
if (mouseButton == LEFT) {
  player1=player1-dmg1;
  hit.trigger();
}

if (mouseButton == RIGHT) {
  player2=player2-dmg2;
    hit.trigger();
}


}
void draw()
{ 
    background(0);
//Health Bars
fill(255);
    // Player 1 background
    rect(-1,-1,350,750);
    // Player 1 background
    rect(675,-1,25,player2*7.5);
fill(0);
    rect(0,0,25,player1*7.5);
    
//Set text font
  textSize(32);
  PFont test;
  test = loadFont("test.vlw");
  textFont(test);
//Scoreboard text for Player 1
    text("Player 1", 70, 40);
    text("HP", 120, 150);
    //Variable health
    text(player1,120,200);
//Scoreboard text for Player2
fill(255);
    text("HP", 470, 150);
    text("Player 2", 400, 40);
    //Variable health
    text(player2,470,200);
//Timer
int m=millis();
int s=m/1000;
int t=121-s;
fill(255,0,0);
text(t,320,175);
if (s==1){
  start.trigger();
  
}
//Win parameters
  //Player 2
if (player1<=0) {
  fill(0);
  rect(0,0,700,750);
  textSize(72);
fill(255);
 text("PLAYER 2 WINS",50,200) ;
}
  //Player 1
if (player2<=0) {
  fill(255);
  rect(0,0,700,750);
  textSize(72);
fill(0);
 text("PLAYER 1 WINS",50,200) ;
}
}




