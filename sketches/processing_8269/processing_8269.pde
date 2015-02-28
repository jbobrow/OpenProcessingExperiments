
//player
float x, y, xVel, yVel;
int w = 40;
boolean left, right;

//sound
import krister.Ess.*;
AudioChannel cnote,dnote,enote,fnote,gnote,anote,bnote,c2note;

//levels
boolean level1;
boolean level2;
boolean level3;
boolean rainbowsong;
int levelcounter;

float gravity = 0.14;
float bounceVel = 6.1;
float maxYVel = 12;
float maxXVel = 4;

//platform
float px,py,pw,ph;
float p2x,p2y,p2w;
float p3x,p3y,p3w;
float p4x,p4y,p4w;
float p5x,p5y,p5w;
float p6x,p6y,p6w;
float p7x,p7y,p7w;
float p8x,p8y,p8w;
float p9x,p9y,p9w;
float p10x,p10y,p10w;
float p11x,p11y,p11w;
float p12x,p12y,p12w;
float p13x,p13y,p13w;
float p14x,p14y,p14w;
float p15x,p15y,p15w;

//notes
float c = 280;//0
float d = 245;//30
float e = 210;//60
float f = 175;//120
float g = 140;//224
float a = 105;//285
float b = 70;//320
float c2 = 35;//0

float sat2,sat3,sat4,sat5,sat6,sat7,sat8,sat9,sat10,sat11,sat12,sat13,sat14;
float fill2,fill3,fill4,fill5,fill6,fill7,fill8,fill9,fill10,fill11,fill12,fill13,fill14;


void setup(){
Ess.start(this);
cnote = new AudioChannel("cnote.wav");
dnote = new AudioChannel("dnote.wav");
enote = new AudioChannel("enote.wav");
fnote = new AudioChannel("fnote.wav");
gnote = new AudioChannel("gnote.wav");
anote = new AudioChannel("anote.wav");
bnote = new AudioChannel("bnote.wav");
c2note = new AudioChannel("c2note.wav");
size(480, 320);
smooth();
colorMode(HSB,360,100,100);

x = w;
levelcounter = 1;
level1 = true;
sat2 = 0;
sat3 = 0;
sat4 = 0;
sat5 = 0;
sat6 = 0;
sat7 = 0;
sat8 = 0;
sat9 = 0;
sat10 = 0;
sat11 = 0;
sat12 = 0;
sat13 = 0;
sat14 = 0;

fill2 = 0;
fill3 = 60;
fill4 = 224;
fill5 = 30;
fill6 = 285;
fill7 = 0;
fill8 = 320;
fill9 = 224;
fill10 = 30;
fill11 = 120;
fill12 = 224;
fill13 = 0;
fill14 = 30;

}


void draw(){
background(140);
fill(0);
translate(-x/1.2,0);

//Ball
x += xVel;
y += yVel;

// wrap around
if ((x > 3000) && (level1 == true)) { level2 = true;
level1 = false;
x = w;
sat2 = 0;
sat3 = 0;
sat4 = 0;
sat5 = 0;
sat6 = 0;
sat7 = 0;
sat8 = 0;
sat9 = 0;
sat10 = 0;
sat11 = 0;
sat12 = 0;
sat13 = 0;
sat14 = 0;
}

if (x < 0){
  if((level1 == true) || (level2 == true)){
   x = 0;
  }else if (rainbowsong == true){
    x = 2900;}
}
if (y > height+w){
  sat2 = 0;
  sat3 = 0;
  sat4 = 0;
  sat5 = 0;
  sat6 = 0;
  sat7 = 0;
  sat8 = 0;
  sat9 = 0;
  sat10 = 0;
  sat11 = 0;
  sat12 = 0;
  sat13 = 0;
  sat14 = 0;
if ((level1 == true) || (level2 == true)){
  x= w;
  y = 0;
}else if (rainbowsong == true){
  x= 2900;
  y = 0;}
}

// horizontal
if (left == true){
xVel -= 0.07;
}
else
if (right == true){
xVel += 0.07;
}
else
if (xVel > 0){
xVel -= 0.03;
}
else {
xVel += 0.03;
}


if (abs(xVel) < 0.01) xVel = 0;
xVel = min(maxXVel, xVel);
xVel = max(-maxXVel, xVel);

// vertical
yVel += gravity;
yVel = min(maxYVel, yVel);
yVel = max(-maxYVel, yVel);

//collide
if(rectCircleIntersect(px,py,pw,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
if((level1 == true) || (level2 == true)){
  cnote.stop();
cnote.play();
}else if(rainbowsong == true){
  gnote.stop();
  gnote.play();}
//note.volume(in %);
}
}

if(rectCircleIntersect(p2x,p2y,p2w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat2 = 90;
if(level1 == true){
cnote.stop();
cnote.play();
}else if(level2 == true){
  gnote.stop();
  gnote.play();
}else if(rainbowsong == true){
  gnote.stop();
  gnote.play();}
}
}

if(rectCircleIntersect(p3x,p3y,p3w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat3 = 90;
if(level1 == true){
enote.stop();
enote.play();
}else if(level2 == true){
  fnote.stop();
  fnote.play();
}else if(rainbowsong == true){
  fnote.stop();
  fnote.play();}
}
}

if(rectCircleIntersect(p4x,p4y,p4w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat4 = 90;
if(level1 == true){
gnote.stop();
gnote.play();
}else if (level2 == true){
  cnote.stop();
  cnote.play();
}else if(rainbowsong == true){
  anote.stop();
  anote.play();}
}
}

if(rectCircleIntersect(p5x,p5y,p5w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat5 = 90;
if(level1 == true){
dnote.stop();
dnote.play();
}else if(level2 == true){
  gnote.stop();
  gnote.play();
}else if(rainbowsong == true){
  fnote.stop();
  fnote.play();}
}
}

if(rectCircleIntersect(p6x,p6y,p6w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat6 = 90;
if((level1 == true) || (level2 == true)){
anote.stop();
anote.play();
}else if(rainbowsong == true){
  cnote.stop();
  cnote.play();}
}
}

if(rectCircleIntersect(p7x,p7y,p7w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat7 = 90;
if(level1 == true){
cnote.stop();
cnote.play();
}else if(level2 == true){
  dnote.stop();
  dnote.play();
}else if(rainbowsong == true){
  c2note.stop();
  c2note.play();}
}
}

if(rectCircleIntersect(p8x,p8y,p8w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat8 = 90;
if((level1 == true) || (level2 == true)){
bnote.stop();
bnote.play();
}else if(rainbowsong == true){
  bnote.stop();
  bnote.play();}
}
}

if(rectCircleIntersect(p9x,p9y,p9w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat9 = 90;
if(level1 == true){
gnote.stop();
gnote.play();
}else if(level2 == true)
{fnote.stop();
fnote.play();
}else if(rainbowsong == true)
{anote.stop();
anote.play();}
}
}

if(rectCircleIntersect(p10x,p10y,p10w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat10 = 90;
if(level1 == true){
dnote.stop();
dnote.play();
}else if(level2 == true){
  cnote.stop();
  cnote.play();
}else if(rainbowsong == true)
{gnote.stop();
gnote.play();}
}
}

if(rectCircleIntersect(p11x,p11y,p11w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat11 = 90;
if(level1 == true){
fnote.stop();
fnote.play();
}else if(level2 == true){
  cnote.stop();
  cnote.play();
}else if(rainbowsong == true){
  bnote.stop();
  bnote.play();}
}
}

if(rectCircleIntersect(p12x,p12y,p12w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat12 = 90;
if((level1 == true) || (level2 == true)){
gnote.stop();
gnote.play();
}else if (rainbowsong == true){
  c2note.stop();
  c2note.play();}
}
}

if(rectCircleIntersect(p13x,p13y,p13w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat13 = 90;
if((level1 == true) || (level2 == true)){
c2note.stop();
c2note.play();
}else if (rainbowsong == true){
  enote.stop();
enote.play();}
}
}

if(rectCircleIntersect(p14x,p14y,p14w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
sat14 = 90;
if(level1 == true){
dnote.stop();
dnote.play();
}else if(level2 == true){
  enote.stop();
  enote.play();
}else if(rainbowsong == true){
  cnote.stop();
  cnote.play();}
}
}

if(rectCircleIntersect(p15x,p15y,p15w,ph,x,y,w/2)){
if (yVel > 0) {
yVel = -bounceVel;
if((level1 == true) || (level2 == true)){
gnote.stop();
gnote.play();
}else if(rainbowsong == true){
  cnote.stop();
  cnote.play();}
}
}

if(level1 == true){
level2 = false;

px = 0;
py = 280;
pw = 150;
ph = 30;

p2x = 200;
p2y = 280;
p2w = 150;

p3x = 450;
p3y = 210;
p3w = 100;

p4x = 660;
p4y = 140;
p4w = 150;

p5x = 720;
p5y = 245;
p5w = 150;

p6x = 940;
p6y = 105;
p6w = 150;

p7x = 1200;
p7y = 280;
p7w = 150;

p8x = 1375;
p8y = 70;
p8w = 150;

p9x = 1500;
p9y = 140;
p9w = 150;

p10x = 1700;
p10y = 245;
p10w = 100;

p11x = 1900;
p11y = 175;
p11w = 100;

p12x = 2100;
p12y = 140;
p12w = 100;

p13x = 2250;
p13y = 35;
p13w = 300;

p14x = 2600;
p14y = 245;
p14w = 100;

p15x = 2800;
p15y = 140;
p15w = 300;}
  

//ball draw
fill(0);
noStroke();
ellipse(x,y,w,w);

//platform1
fill(0);
rect(px,py,pw,ph);
//platform2
fill(fill2,sat2,100);
rect(p2x,p2y,p2w,ph);

//platform3
fill(fill3,sat3,100);
rect(p3x,p3y,p3w,ph);

//platform4
fill(fill4,sat4,100);
rect(p4x,p4y,p4w,ph);

//platform5
fill(fill5,sat5,100);
rect(p5x,p5y,p5w,ph);

//platform6
fill(fill6,sat6,100);
rect(p6x,p6y,p6w,ph);

//platform7
fill(fill7,sat7,100);
rect(p7x,p7y,p7w,ph);

//platform8
fill(fill8,sat8,100);
rect(p8x,p8y,p8w,ph);

//platform9
fill(fill9,sat9,100);
rect(p9x,p9y,p9w,ph);

//platform10
fill(fill10,sat10,100);
rect(p10x,p10y,p10w,ph);

//platform11
fill(fill11,sat11,100);
rect(p11x,p11y,p11w,ph);

//platform12
fill(fill12,sat12,100);
rect(p12x,p12y,p12w,ph);

//platform13
fill(fill13,sat13,100);
rect(p13x,p13y,p13w,ph);

//platform14
fill(fill14,sat14,100);
rect(p14x,p14y,p14w,ph);

//platform15
fill(0);
rect(p15x,p15y,p15w,ph);


if(level2 == true){
 level1 = false;
 
 rect(2500,50,25,10);
triangle(2535,55,2525,45,2525,65);

 p2x = 250;
 p2y = 140;
 p2w = 100;
 fill2 = 224;
 
 p3x = 450;
 p3y = 175;
 p3w = 100;
 fill3 = 120;
 
 p4x = 600;
 p4y = 280;
 p4w = 400;
 fill4 = 0;
 
 p5x = 800;
 p5y = 140;
 p5w = 75;
 fill5 = 224;
 
 p6x = 950;
 p6y = 105;
 p6w = 75;
 fill6 = 285;
 
 p7x = 1250;
 p7y = 245;
 p7w = 100;
 fill7 = 30;
 
 p8x = 1300;
 p8w = 100;

 p9x = 1550;
 p9y = 175;
 p9w = 50;
 fill9 = 120;
 
 p10x = 1700;
 p10y = 280;
 p10w = 100;
 fill10 = 0;
 
 p11x = 1900;
 p11y = 280;
 p11w = 50;
 fill11 = 0;
 
 p12x = 2150;
 p12w = 100;
 
 p13x = 2300;
 p13y = 35;
 p13w = 50;
 fill13 = 0;
 
 p14x = 2475;
 p14y = 210;
 fill14 = 60;
 
  //rainbowbutton
 fill(0,100,100);
 ellipse(2700,15,15,15);
}

if((level2 == true) && (x < 2710) && (x > 2690) &&
(y > 0) && (y < 20)){
  rainbowsong = true;
  y += yVel;
}

if(rainbowsong == true){
 level1 = false;
 level2 = false;
 
  sat2 = 90;
  sat3 = 90;
  sat4 = 90;
  sat5 = 90;
  sat6 = 90;
  sat7 = 90;
  sat8 = 90;
  sat9 = 90;
  sat10 = 90;
  sat11 = 90;
  sat12 = 90;
  sat13 = 90;
  sat14 = 90;

fill(0);
rect(2500,50,25,10);
triangle(2490,55,2500,45,2500,65);
 
 p15y = 280;
 
 p14x = 2550;
 p14y = 280;
 fill14 = 0;
 
 p13x = 2300;
 p13y = 210;
 p13w = 100;
 fill13 = 60;
 
 p12x = 2100;
 p12y = 35;
 p12w = 100;
 fill12 = 0;
 
 p11x = 1950;
 p11y = 70;
 p11w = 50;
 fill11 = 320;
 
 p10x = 1750;
 p10y = 140;
 p10w = 50;
 fill10 = 224;
 
 p9x = 1550;
 p9y = 105;
 p9w = 75;
 fill9 = 285;
 
 p8x = 1400;
 p8y = 70;
 p8w = 100;
 fill8 = 320;

 p7x = 1200;
 p7y = 35;
 p7w = 100;
 fill7 = 0;
 
 p6x = 1000;
 p6y = 280;
 p6w = 100;
 fill6 = 0;
 
 p5x = 800;
 p5y = 175;
 p5w = 50;
 fill5 = 120;
 
 p4x = 600;
 p4y = 105;
 p4w = 100;
 fill4 = 285;
 
 p3x = 450;
 p3y = 175;
 p3w = 50;
 fill3 = 120;
 
 p2x = 250;
 p2y = 140;
 p2w = 100;
 fill2 = 224;
 
 py = 140;
 
 }
}

void keyPressed(){
if ((key == 'a') || (key == 'A')){
left = true;
}
if ((key == 'd') || (key == 'D')){
right = true;
}
if ((key == 'g') || (key == 'G')){
level2 = true;
level1 = false;
}
if ((key == 'e') || (key == 'E')){
level2 = false;
level1 = false;
rainbowsong = true;
}
}

void keyReleased()
{
if ((key == 'a') || (key == 'A')){
left = false;
}
if ((key == 'd') || (key == 'D')){
right = false;
}
}

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) { 
 
  float circleDistanceX = abs(cx - rx - rw/2); 
  float circleDistanceY = abs(cy - ry - rh/2); 
 
  if (circleDistanceX > (rw/2 + cr)) { return false; } 
  if (circleDistanceY > (rh/2 + cr)) { return false; } 
  if (circleDistanceX <= rw/2) { return true; }  
  if (circleDistanceY <= rh/2) { return true; } 
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2); 
  return cornerDistance <= pow(cr, 2); 
} 


