
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  background(0);
  size(500, 600);
  smooth();
  noCursor();
  frameRate(1000);
  minim = new Minim(this);
  
  
  
 

  
}

 

 


float a=mouseX-50;
float b=mouseX+30;
float c=0;
float d=0;
float e=0;
float f=0;
float i=0;
float gx=0;
float gy=0;
int hG=0;

float fx=0;
float fy=0;
int hF=0;
float i2=0;

float ex=0;
float ey=0;
int hE=0;
float i3=0;

float dx=0;
float dy=0;
int hD=0;
float i4=0;

float cx=0;
float cy=0;
int hC=0;
float i5=0;

float ax=0;
float ay=0;
int hA=0;
float i6=0;

float bx=0;
float by=0;
int hB=0;
float i7=0;
int WIN=0;

void draw() {
  background(0);
 

 


  
noStroke();
fill(35, 23, 227);
rect(0, 570, 30, 30);
fill(232, 9, 24);
rect(30, 570, 30, 30);
fill(28, 211, 26);
rect(60, 570, 30, 30);
fill(254, 255, 0);
rect(90, 570, 30, 30);
fill(237, 0, 255);
rect(120, 570, 30, 30);
fill(245, 126, 35);
rect(150, 570, 30, 30);
fill(133, 11, 216);
rect(180, 570, 30, 30);

fill(0);
PFont font;
font = loadFont("ArialRoundedMTBold-25.vlw");
textFont(font);
String s = " C  D  E  F  G  A  B";
text(s, 0, 570, 500, 100);

  
  
  
fill(255);
stroke(0);
noStroke();
beginShape();
vertex(a, mouseY-50);
vertex(mouseX, mouseY-10);
vertex(b, mouseY-30);
vertex(mouseX+20, mouseY+10);
vertex(mouseX+25, mouseY+50);
vertex(mouseX-20, mouseY+50);
vertex(mouseX-30, mouseY+10);
vertex(a, mouseY-50);
endShape(CLOSE);



 



strokeWeight(1);
if (keyPressed && key=='g') {
  
  gx=mouseX+c;
gy=mouseY+25;
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(237, 0, 255);
ellipse(gx, gy, 10, 10);
stroke(237, 0, 255);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='f') {
  
  
fx=mouseX+c;
fy=mouseY+25;
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(254, 255, 0);
ellipse(fx, fy, 10, 10);
stroke(254, 255, 0);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='e') {
 
 ex=mouseX+c;
ey=mouseY+25; 
  
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;



noStroke();
fill(28, 211, 26);
ellipse(ex, mouseY+25, 10, 10);
stroke(28, 211, 26);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='d') {
  
  dx=mouseX+c;
dy=mouseY+25;
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(232, 9, 24);
ellipse(dx, mouseY+25, 10, 10);
stroke(232, 9, 24);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='c') {
  
   cx=mouseX+c;
cy=mouseY+25;
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(35, 23, 227);
ellipse(cx, mouseY+25, 10, 10);
stroke(35, 23, 227);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='b') {
  
  bx=mouseX+c;
by=mouseY+25;
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(133, 11, 216);
ellipse(bx, mouseY+25, 10, 10);
stroke(133, 11, 216);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

 

if (keyPressed && key=='a') {
  
  ax=mouseX+c;
ay=mouseY+25;
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;


noStroke();
fill(245, 126, 35);
ellipse(ax, mouseY+25, 10, 10);
stroke(245, 126, 35);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}
 
 
 
if (keyPressed==false) {
 stroke(0);
line(mouseX-5, mouseY+25, mouseX+5, mouseY+25);

fill(255);
ellipse(mouseX-15, mouseY+10, 10, 10);
ellipse(mouseX+8, mouseY+10, 10, 10);
fill(0);
ellipse(mouseX-14, mouseY+10, 5, 5);
ellipse(mouseX+9, mouseY+10, 5, 5);

a=mouseX-50;
b=mouseX+30;

}


if (dist(gx, gy, sgx, sgy)<30) {
hG=1;
}


if (hG == 1) {
  happyG();
}

if (hG == 0) {
  sadG();
}

if(sgx == 0) {
  hG=2;
}

if (hG == 2) {
  gameover();
}

if (frameCount > 2000) {
if (dist(fx, fy, sfx, sfy)<30) {
hF=1;
}


if (hF == 1) {
  happyF();
}

if (hF == 0) {
  sadF();
}

if(sfx == 0) {
  hF=2;
}

if (hF == 2) {
  gameover();
}

}

if (frameCount > 800) {
if (dist(ex, ey, sex, sey)<30) {
hE=1;
}


if (hE == 1) {
  happyE();
}

if (hE == 0) {
  sadE();
}

if(sex == 0) {
  hE=2;
}

if (hE == 2) {
  gameover();
}

}



if (frameCount > 400) {
if (dist(dx, dy, sdx, sdy)<30) {
hD=1;
}


if (hD == 1) {
  happyD();
}

if (hD == 0) {
  sadD();
}

if(sdx == 0) {
  hD=2;
}

if (hD == 2) {
  gameover();
}

}







if (frameCount > 1200) {
if (dist(cx, cy, scx, scy)<30) {
hC=1;
}


if (hC == 1) {
  happyC();
}

if (hC == 0) {
  sadC();
}

if(scx == 0) {
  hC=2;
}

if (hC == 2) {
  gameover();
}

}



if (frameCount > 1600) {
if (dist(ax, ay, sax, say)<30) {
hA=1;
}


if (hA == 1) {
  happyA();
}

if (hA == 0) {
  sadA();
}

if(sax == 0) {
  hA=2;
}

if (hA == 2) {
  gameover();
}

}



if (frameCount > 2400) {
if (dist(bx, by, sbx, sby)<30) {
hB=1;
}



if (hB == 1) {
  happyB();
}

if (hB == 0) {
  sadB();
}

if(sbx == 0) {
  hB=2;
}

if (hB == 2) {
  gameover();
}

if(hbx == 0) {
  WIN=1;
}

if (WIN == 1) {
  win();
}

}
 

 


  
}

 

void keyPressed() {
  
  if (key=='a'){
  player= minim.loadFile("a69.mp3", 1024);
  player.play(); 
  }
  
  if (key=='b'){
 player= minim.loadFile("b71.mp3", 1024);
  player.play(); 
  }
  
  if (key=='c'){
  player= minim.loadFile("c60.mp3", 1024);
  player.play(); 
  }
  
  if (key=='d'){
  player= minim.loadFile("d62.mp3", 1024);
  player.play(); 
  }
  
  if (key=='e'){
  player= minim.loadFile("e64.mp3", 1024);
  player.play(); 
  }

  if (key=='f'){
  player= minim.loadFile("f65.mp3", 1024);
  player.play(); 
  }
  
  if (key=='g'){
  player= minim.loadFile("g67.mp3", 1024);
  player.play(); 
  }
  
    c=0;
    
}

float j=random(0, 500);
float sgx=600+i;
float sgy=j;

void sadG() {

sgx=600+i;
sgy=j;


i=i-1;

  
 noStroke();
fill(237, 0, 255);
ellipse(sgx, sgy, 30, 30);
fill(0);
ellipse(595+i, j-4, 5, 7);
ellipse(605+i, j-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i, j+5, 597+i, j+3.5);
line(597+i, j+3.5, 602+i, j+3.5);
line(603+i, j+3.5, 605+i, j+5);

}

void happyG() {

  i=i-1;
 
 
stroke(0);  
fill(255);
ellipse(600+i, j, 30, 30);
fill(0);
ellipse(595+i, j-4, 5, 7);
ellipse(605+i, j-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i, j+4, 597+i, j+6);
line(597+i, j+6, 602+i, j+6);
line(603+i, j+6, 605+i, j+4.5);
 
}

void gameover() {
  noStroke();
  fill(0);
  rect(0, 0, 500, 600);
  fill(255, 0, 0);
PFont font;
font = loadFont("ArialRoundedMTBold-45.vlw");
textFont(font);
String s = "GAME OVER";
text(s, 100, 200, 500, 100);
  
}

float k=random(0, 500);
float sfx=600+i2;
float sfy=k;

void sadF() { 
sfx=600+i2;
sfy=k;

 
i2=i2-1;

  
noStroke();
fill(254, 255, 0);
ellipse(sfx, sfy, 30, 30);
fill(0);
ellipse(595+i2, k-4, 5, 7);
ellipse(605+i2, k-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i2, k+5, 597+i2, k+3.5);
line(597+i2, k+3.5, 602+i2, k+3.5);
line(603+i2, k+3.5, 605+i2, k+5);
}



void happyF() {
  
 
  i2=i2-1;

strokeWeight(1);
stroke(0);  
fill(255);
ellipse(600+i2, k, 30, 30);
fill(0);
ellipse(595+i2, k-4, 5, 7);
ellipse(605+i2, k-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i2, k+4, 597+i2, k+6);
line(597+i2, k+6, 602+i2, k+6);
line(603+i2, k+6, 605+i2, k+4.5);
}
 












float l=random(0, 500);
float sex=600+i3;
float sey=l;

void sadE() {
sex=600+i3;
sey=l;

 
i3=i3-1;

  
strokeWeight(1);
fill(28, 211, 26);
ellipse(sex, sey, 30, 30);
fill(0);
ellipse(595+i3, l-4, 5, 7);
ellipse(605+i3, l-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i3, l+5, 597+i3, l+3.5);
line(597+i3, l+3.5, 602+i3, l+3.5);
line(603+i3, l+3.5, 605+i3, l+5);
}


void happyE() {

  i3=i3-1;

noStroke();
strokeWeight(1);
stroke(0);  
fill(255);
ellipse(600+i3, l, 30, 30);
fill(0);
ellipse(595+i3, l-4, 5, 7);
ellipse(605+i3, l-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i3, l+4, 597+i3, l+6);
line(597+i3, l+6, 602+i3, l+6);
line(603+i3, l+6, 605+i3, l+4.5);
}




float m=random(0, 500);
float sdx=600+i4;
float sdy=m;

void sadD() {
sdx=600+i4;
sdy=m;

i4=i4-1;
 

  
noStroke();
fill(232, 9, 24);
ellipse(sdx, sdy, 30, 30);
fill(0);
ellipse(595+i4, m-4, 5, 7);
ellipse(605+i4, m-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i4, m+5, 597+i4, m+3.5);
line(597+i4, m+3.5, 602+i4, m+3.5);
line(603+i4, m+3.5, 605+i4, m+5);
}


void happyD() {

  i4=i4-1;

noStroke();
strokeWeight(1);
stroke(0);  
fill(255);
ellipse(600+i4, m, 30, 30);
fill(0);
ellipse(595+i4, m-4, 5, 7);
ellipse(605+i4, m-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i4, m+4, 597+i4, m+6);
line(597+i4, m+6, 602+i4, m+6);
line(603+i4, m+6, 605+i4, m+4.5);
}








float n=random(0, 500);
float scx=600+i5;
float scy=n;

void sadC() {
scx=600+i5;
scy=n;

i5=i5-1;
 

  
noStroke();
fill(35, 23, 227);
ellipse(scx, scy, 30, 30);
fill(0);
ellipse(595+i5, n-4, 5, 7);
ellipse(605+i5, n-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i5, n+5, 597+i5, n+3.5);
line(597+i5, n+3.5, 602+i5, n+3.5);
line(603+i5, n+3.5, 605+i5, n+5);
}


void happyC() {

  i5=i5-1;

noStroke();
strokeWeight(1);
stroke(0);  
fill(255);
ellipse(600+i5, n, 30, 30);
fill(0);
ellipse(595+i5, n-4, 5, 7);
ellipse(605+i5, n-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i5, n+4, 597+i5, n+6);
line(597+i5, n+6, 602+i5, n+6);
line(603+i5, n+6, 605+i5, n+4.5);
}






float o=random(0, 500);
float sax=600+i6;
float say=o;

void sadA() {
sax=600+i6;
say=o;

i6=i6-1;
 

  
noStroke();
fill(245, 126, 35);
ellipse(sax, say, 30, 30);
fill(0);
ellipse(595+i6, o-4, 5, 7);
ellipse(605+i6, o-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i6, o+5, 597+i6, o+3.5);
line(597+i6, o+3.5, 602+i6, o+3.5);
line(603+i6, o+3.5, 605+i6, o+5);
}


void happyA() {

  i6=i6-1;

noStroke();
strokeWeight(1);
stroke(0);  
fill(255);
ellipse(600+i6, o, 30, 30);
fill(0);
ellipse(595+i6, o-4, 5, 7);
ellipse(605+i6, o-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i6, o+4, 597+i6, o+6);
line(597+i6, o+6, 602+i6, o+6);
line(603+i6, o+6, 605+i6, o+4.5);
}






float p=random(0, 500);
float sbx=600+i7;
float sby=p;
float hbx=600+i7;
float hby=p;

void sadB() {
sbx=600+i7;
sby=p;

i7=i7-1;
 

  
noStroke();
fill(133, 11, 216);
ellipse(sbx, sby, 30, 30);
fill(0);
ellipse(595+i7, p-4, 5, 7);
ellipse(605+i7, p-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i7, p+5, 597+i7, p+3.5);
line(597+i7, p+3.5, 602+i7, p+3.5);
line(603+i7, p+3.5, 605+i7, p+5);
}


void happyB() {
  
hbx=600+i7;
hby=p;
  i7=i7-1;

noStroke();
strokeWeight(1);
stroke(0);  
fill(255);
ellipse(hbx, hby, 30, 30);
fill(0);
ellipse(595+i7, p-4, 5, 7);
ellipse(605+i7, p-4, 5, 7);
stroke(0);
strokeWeight(5);
line(595+i7, p+4, 597+i7, p+6);
line(597+i7, p+6, 602+i7, p+6);
line(603+i7, p+6, 605+i7, p+4.5);
}


void win() {
  noStroke();
  fill(0);
  rect(0, 0, 500, 600);
  fill(255);
PFont font;
font = loadFont("ArialRoundedMTBold-45.vlw");
textFont(font);
String s = "YOU WIN! :D";
text(s, 100, 200, 500, 100);
  
}







 


