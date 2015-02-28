
//LS Bonus. Music.
// To do: Limit LSB trigger to once
//        Figure out combined click events
int player1 = 100;
int player2 = 100;
import ddf.minim.*;
Minim minim;
AudioSample start;
AudioSample hit;
AudioSample lsb;

void setup()
{
  background(0);
  size(700,750);
  minim = new Minim(this);
  hit = minim.loadSample("hit.wav", 2048);
  lsb = minim.loadSample("lsb.wav", 2048);
  start = minim.loadSample("start.wav", 2048);
}
void keyReleased() {
 start.trigger();
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
    text("Player 1", 100, 30);
    text("HP", 120, 150);
    //Variable health
    text(player1,120,200);
//Scoreboard text for Player2
fill(255);
    text("HP", 470, 150);
    text("Player 2", 450, 30);
    //Variable health
    text(player2,470,200);
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


