
float speedX = 10;
float speed1 = 5;
float pos1 = 200;
float pos2 = 25;
float dir = 0;
float pos3 = 200;
float pos4 = 225;
float speed2 = -5;
float pos5 =(210-150*cos(PI/4));
float pos6 =(210-150*cos(PI/4));
float speed5 =-5/sqrt(2);
float speed6 =-5/sqrt(2);
float pos7 = 200+100*cos(PI/4);
float pos8 = 200-100*cos(PI/4);
float speed7 = -5/sqrt(2);
float speed8 = 5/sqrt(2);
void setup () {
  size (400, 400);
  frameRate(20);
}
void draw () {
  noStroke();
  background (0);
  fill (113, 113, 113);
  ellipse (200, 200, 400, 400);
  fill (227, 48, 48);
  ellipse (pos1, pos2, 20, 20);
  //posX = posX+ speedX;
  //if (posX >=725 || posX<=75) {
  // speedX=-speedX; }

  pos2 = pos2+ speed1;
  if (pos2 <15||pos2>385) {
    speed1=-speed1;
  }

  ellipse (pos3, pos4, 20, 20);
  pos3 = pos3+ speed2;
  if (pos3 <15||pos3>385) {
    speed2=-speed2;
  }

ellipse(pos5,pos6,20,20);
pos5 = pos5+ speed5; 
pos6= pos6 +speed6;
if (pos5 <(210-200*cos(PI/4))||pos5>(190+200*cos(PI/4))) {
 speed5=-speed5;}
if (pos6 <((210-200*sin(PI/4)))||pos6>(190+200*sin(PI/4))) {
  speed6=-speed6;}


ellipse(pos7,pos8,20,20);
pos7 = pos7+ speed7; 
pos8= pos8 +speed8;
if (pos7 <(210-200*cos(PI/4))||pos7>(190+200*cos(PI/4))) {
 speed7=-speed7;}
if (pos8 <((210-200*sin(PI/4)))||pos8>(190+200*sin(PI/4))) {
  speed8=-speed8;}


}
