

/*@pjs preload="apple.png,apple_1.png,apple_2.png,apple_3.png,apple_4.png,apple_5.png";*/

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
int a = 0;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int aspeed = 0;
int bspeed = 0;
int cspeed = 0;
int dspeed = 0;
int espeed = 0;
int xspeed = 0;
int yspeed = 0;
int x2speed = 0;
int y2speed = 0;
int x3speed = 0;
int y3speed = 0;
int x4speed = 0;
int y4speed = 0;
int x5speed = 0;
int y5speed = 0;
int zspeed = 0;
int ospeed = 0;
int x = -166;
int y = 5;
int x2 = -166;
int y2 = 80;
int x3 = -166;
int y3 = 155;
int x4 = -166;
int y4 = 230;
int x5 = -166;
int y5 = 305;
int v = 0;
int vspeed = 0;
int qspeed = 0;
int x6 = 0;
int x6speed = 0;
int z = 500;
int o =0;
int t = 0;
int q = 0;
int R = 0;
int G = 0;
int B = 0;
int R2 = 0;
int G2 = 0;
int B2 = 0;
int R3 = 0;
int G3 = 0;
int B3 = 0;
int R4 = 0;
int G4 = 0;
int B4 = 0;
int R5 = 0;
int G5 = 0;
int B5 = 0;

void setup() {
  size(450, 450);
  tint(0, 0, 0);
  img = loadImage("apple.png");
  img2 = loadImage("apple_1.png");
  img3 = loadImage("apple_2.png");
  img4 = loadImage("apple_3.png");
  img5 = loadImage("apple_4.png");
  img6 = loadImage("apple_5.png");
  frameRate(30);
  smooth();
  rectMode(CENTER);
  textSize(48);
}





void draw(){
  background(255);
  
  
//first convair
  fill(0, 44); 
  for(int i= -500; i<500; i+=20){ 
    quad(a+i, 25, a+i+25, 25, a+i+15, 55, a+i-10, 55);
  }
  fill(255);
  noStroke();
  quad(217, 23, width, 23, width, 57, 205, 57);
  fill(255, 0);
  stroke(255);
  strokeWeight(5);
  arc(210, 30, 15, 15, -PI/2, PI/6);
  strokeWeight(1);
  stroke(0);
  arc(210, 30, 10, 10, -PI/2, PI/6);
  fill(255);
  line(215, 30, 205, 55);
  rect(100, 55, 200, 10);
  for(int i= 0; i<=200; i+=25){
    ellipse(i, 55, 10, 10);
  }
//second convair
  fill(0, 44);
  for(int i= -500; i<500; i+=20){ 
    quad(b+i, 100, b+i+25, 100, b+i+15, 130, b+i-10, 130);
  }
  fill(255);
  noStroke();
  quad(217, 98, width, 98, width, 132, 205, 132);
  fill(255, 0);
  stroke(255);
  strokeWeight(5);
  arc(210, 105, 15, 15, -PI/2, PI/6);
  strokeWeight(1);
  stroke(0);
  arc(210, 105, 10, 10, -PI/2, PI/6);
  fill(255);
  line(215, 105, 205, 130);
  rect(100, 130, 200, 10);
  for(int i= 0; i<=200; i+=25){
    ellipse(i, 130, 10, 10);
  }
//third convair  
  fill(0, 44);
  for(int i= -500; i<500; i+=20){ 
    quad(c+i, 175, c+i+25, 175, c+i+15, 205, c+i-10, 205);
  }
  fill(255);
  noStroke();
  quad(217, 173, width, 173, width, 207, 205, 207);
  fill(255, 0);
  stroke(255);
  strokeWeight(5);
  arc(210, 180, 15, 15, -PI/2, PI/6);
  strokeWeight(1);
  stroke(0);
  arc(210, 180, 10, 10, -PI/2, PI/6);
  fill(255);
  line(215, 180, 205, 205);
  rect(100, 205, 200, 10);
  for(int i= 0; i<=200; i+=25){
    ellipse(i, 205, 10, 10);
  }
//forth convair  
  fill(0, 44);
  for(int i= -500; i<500; i+=20){ 
    quad(d+i, 250, d+i+25, 250, d+i+15, 280, d+i-10, 280);
  }
  fill(255);
  noStroke();
  quad(217, 248, width, 248, width, 282, 205, 282);
  fill(255, 0);
  stroke(255);
  strokeWeight(5);
  arc(210, 255, 15, 15, -PI/2, PI/6);
  strokeWeight(1);
  stroke(0);
  arc(210, 255, 10, 10, -PI/2, PI/6);
  fill(255);
  line(215, 255, 205, 280);
  rect(100, 280, 200, 10);
  for(int i= 0; i<=200; i+=25){
    ellipse(i, 280, 10, 10);
  }
//fifth convair  
  fill(0, 44);
  for(int i= -500; i<500; i+=20){ 
    quad(e+i, 325, e+i+25, 325, e+i+15, 355, e+i-10, 355);
  }
  fill(255);
  noStroke();
  quad(217, 323, width, 323, width, 357, 205, 357);
  fill(255, 0);
  stroke(255);
  strokeWeight(5);
  arc(210, 330, 15, 15, -PI/2, PI/6);
  strokeWeight(1);
  stroke(0);
  arc(210, 330, 10, 10, -PI/2, PI/6);
  fill(255);
  line(215, 330, 205, 355);
  rect(100, 355, 200, 10);
  for(int i= 0; i<=200; i+=25){
    ellipse(i, 355, 10, 10);
  } 
//last convair  
  fill(0, 44);
  for(int i= 1150; i>-50; i-=20){ 
    quad(-v+i, 400, -v+i+25, 400, -v+i+15, 430, -v+i-10, 430);
  }
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(225, 430, 450, 10);
  for(int i= 0; i<=450; i+=25){
    ellipse(i, 430, 10, 10);
  }
//img  
  tint(R,G,B);
  image(img2, x, y, 249*2/3, 60*2/3);
  tint(R2,G2,B2);
  image(img3, x2, y2, 249*2/3, 60*2/3);
  tint(R3,G3,B3);
  image(img4, x3, y3, 249*2/3, 60*2/3);
  tint(R4,G4,B4);
  image(img5, x4, y4, 249*2/3, 60*2/3);
  tint(R5,G5,B5);
  image(img6, x5, y5, 249*2/3, 60*2/3);
  tint(0, 255, 0);
  image(img, 10-v, 380, 249/7, 300/7);
  tint(255, 0, 0);
  image(img, 90-v, 380, 249/7, 300/7);
  tint(0, 0, 255);
  image(img, 170-v, 380, 249/7, 300/7);
  tint(255, 255, 0);
  image(img, 250-v, 380, 249/7, 300/7);
  tint(0, 255, 255);
  image(img, 330-v, 380, 249/7, 300/7);
  tint(255, 0, 255);
  image(img, 410-v, 380, 249/7, 300/7);
  tint(0,0,0);
  image(img, 900-v, 380, 249/7, 300/7);
  
  stroke(0);
  strokeWeight(1);
  fill(0);
  text("Apple",740-o,415+q);

 
  a = a + aspeed;
  if (a > 500) {
    a = 0;
  }
  b = b + bspeed;
  if (b > 500) {
    b = 0;
  }
  c = c + cspeed;
  if (c > 500) {
    c = 0;
  }
  d = d + dspeed;
  if (d > 500) {
    d = 0;
  }
  e = e + espeed;
  if (e > 500) {
    e = 0;
  }
  v = v + vspeed;
  if (v > 800) {
    v = 0;
  }  
  o = o + ospeed;
  if (o > 800) {
    o = 0;
  }  
  x = x + xspeed;
  y = y + yspeed;
  x2 = x2 + x2speed;
  y2 = y2 + y2speed;
  x3 = x3 + x3speed;
  y3 = y3 + y3speed;
  x4 = x4 + x4speed;
  y4 = y4 + y4speed;
  x5 = x5 + x5speed;
  y5 = y5 + y5speed;
  q = q + qspeed;
  z = z + zspeed;
  
//if  
  if (x == 200 && y == 5){
    yspeed = 2;
  }
  if (x == 209 && y == 11) {
    yspeed = 0;
  }
  if (x==275 && y==11){
    t=450;
    xspeed = 0;
  }
  if (x2 == 200 && y2 == 80){
    y2speed = 2;
  }
  if (x2 == 209 && y2 == 86) {
    y2speed = 0;
  }
  if (x2==275 && y2==86){
    t=900;
    x2speed = 0;
  }
  if (x3 == 200 && y3 == 155){
    y3speed = 2;
  }
  if (x3 == 209 && y3 == 161) {
    y3speed = 0;
  }
  if (x3==275 && y3==161){
    t=1350;
    x3speed = 0;
  }
  if (x4 == 200 && y4==230){
    y4speed = 2;
  }
  if (x4 == 209 && y4==236) {
    y4speed = 0;
  }
  if (x4==275 && y4==236){
    t=1800;
    x4speed = 0;
  }
  if (x5 == 200 && y5 == 305){
    y5speed = 2;
  }
  if (x5 == 209 && y5 == 311) {
    y5speed = 0;
  }
  if (x5==275 && y5==311){
    t=2250;
    x5speed = 0;
  }
  if(x==275 && x2==275 && x3==275 && x4==275 && x5==275){
    aspeed=0;
    bspeed=0;
    cspeed=0;
    dspeed=0;
    espeed=0;
    yspeed=2;
    y2speed=1;
    y4speed=-1;
    y5speed=-2;
    vspeed=3;
    ospeed=3;
  }
  if(y==81 && y2==121 && y3==161 && y4==201 && y5==241){
    yspeed=0;
    y2speed=0;
    y4speed=0;
    y5speed=0;
  }
  if(o==450){
    vspeed=0;
    ospeed=0;
    qspeed=-1;
  }
  if(q==-65){
    qspeed=0;
    vspeed=3;
  }
  if(v==501){
    vspeed=0;
  }
}


void mouseClicked(){
//first parts   
  if((mouseX>=10-v+t && mouseX<=46-v+t && mouseY>=380 && mouseY<=423)
      ||(mouseX>=90-v+t && mouseX<=126-v+t && mouseY>=380 && mouseY<=423)
      ||(mouseX>=170-v+t && mouseX<=206-v+t && mouseY>=380 && mouseY<=423)
      ||(mouseX>=250-v+t && mouseX<=286-v+t && mouseY>=380 && mouseY<=423)
      ||(mouseX>=330-v+t && mouseX<=366-v+t && mouseY>=380 && mouseY<=423)
      ||(mouseX>=410-v+t && mouseX<=446-v+t && mouseY>=380 && mouseY<=423)){
    
    aspeed = 3;
    xspeed=3;
    if(mouseX>=10-v && mouseX<=46-v && mouseY>=380 && mouseY<=423){  
      R=0;
      G=255;
      B=0;
    }
    if(mouseX>=90-v && mouseX<=126-v && mouseY>=380 && mouseY<=423){  
      R=255;
      G=0;
      B=0;
    }
    if(mouseX>=170-v && mouseX<=206-v && mouseY>=380 && mouseY<=423){  
      R=0;
      G=0;
      B=255;
    }
    if(mouseX>=250-v && mouseX<=286-v && mouseY>=380 && mouseY<=423){  
      R=255;
      G=255;
      B=0;
    }
    if(mouseX>=330-v && mouseX<=366-v && mouseY>=380 && mouseY<=423){  
      R=0;
      G=255;
      B=255;
    }
    if(mouseX>=410-v && mouseX<=446-v && mouseY>=380 && mouseY<=423){  
      R=255;
      G=0;
      B=255;
    }
  }
//second parts  
  if((mouseX>=10-v+t-450 && mouseX<=46-v+t-450 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=90-v+t-450 && mouseX<=126-v+t-450 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=170-v+t-450 && mouseX<=206-v+t-450 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=250-v+t-450 && mouseX<=286-v+t-450 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=330-v+t-450 && mouseX<=366-v+t-450 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=410-v+t-450 && mouseX<=446-v+t-450 && mouseY>=380 && mouseY<=423)){
    
    bspeed = 3;
    x2speed = 3;
    
    if(mouseX>=10-v && mouseX<=46-v && mouseY>=380 && mouseY<=423){  
      R2=0;
      G2=255;
      B2=0;
    }
    if(mouseX>=90-v && mouseX<=126-v && mouseY>=380 && mouseY<=423){  
      R2=255;
      G2=0;
      B2=0;
    }
    if(mouseX>=170-v && mouseX<=206-v && mouseY>=380 && mouseY<=423){  
      R2=0;
      G2=0;
      B2=255;
    }
    if(mouseX>=250-v && mouseX<=286-v && mouseY>=380 && mouseY<=423){  
      R2=255;
      G2=255;
      B2=0;
    }
    if(mouseX>=330-v && mouseX<=366-v && mouseY>=380 && mouseY<=423){  
      R2=0;
      G2=255;
      B2=255;
    }
    if(mouseX>=410-v && mouseX<=446-v && mouseY>=380 && mouseY<=423){  
      R2=255;
      G2=0;
      B2=255;
    }
  }
//third parts 
  if((mouseX>=10-v+t-900 && mouseX<=46-v+t-900 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=90-v+t-900 && mouseX<=126-v+t-900 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=170-v+t-900 && mouseX<=206-v+t-900 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=250-v+t-900 && mouseX<=286-v+t-900 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=330-v+t-900 && mouseX<=366-v+t-900 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=410-v+t-900 && mouseX<=446-v+t-900 && mouseY>=380 && mouseY<=423)){
    
    cspeed = 3;
    x3speed=3;
    if(mouseX>=10-v && mouseX<=46-v && mouseY>=380 && mouseY<=423){  
      R3=0;
      G3=255;
      B3=0;
    }
    if(mouseX>=90-v && mouseX<=126-v && mouseY>=380 && mouseY<=423){  
      R3=255;
      G3=0;
      B3=0;
    }
    if(mouseX>=170-v && mouseX<=206-v && mouseY>=380 && mouseY<=423){  
      R3=0;
      G3=0;
      B3=255;
    }
    if(mouseX>=250-v && mouseX<=286-v && mouseY>=380 && mouseY<=423){  
      R3=255;
      G3=255;
      B3=0;
    }
    if(mouseX>=330-v && mouseX<=366-v && mouseY>=380 && mouseY<=423){  
      R3=0;
      G3=255;
      B3=255;
    }
    if(mouseX>=410-v && mouseX<=446-v && mouseY>=380 && mouseY<=423){  
      R3=255;
      G3=0;
      B3=255;
    }
  
  }
//forth parts  
  if((mouseX>=10-v+t-1350 && mouseX<=46-v+t-1350 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=90-v+t-1350 && mouseX<=126-v+t-1350 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=170-v+t-1350 && mouseX<=206-v+t-1350 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=250-v+t-1350 && mouseX<=286-v+t-1350 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=330-v+t-1350 && mouseX<=366-v+t-1350 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=410-v+t-1350 && mouseX<=446-v+t-1350 && mouseY>=380 && mouseY<=423)){
     
    dspeed = 3;
    x4speed=3;
    if(mouseX>=10-v && mouseX<=46-v && mouseY>=380 && mouseY<=423){  
      R4=0;
      G4=255;
      B4=0;
    }
    if(mouseX>=90-v && mouseX<=126-v && mouseY>=380 && mouseY<=423){  
      R4=255;
      G4=0;
      B4=0;
    }
    if(mouseX>=170-v && mouseX<=206-v && mouseY>=380 && mouseY<=423){  
      R4=0;
      G4=0;
      B4=255;
    }
    if(mouseX>=250-v && mouseX<=286-v && mouseY>=380 && mouseY<=423){  
      R4=255;
      G4=255;
      B4=0;
    }
    if(mouseX>=330-v && mouseX<=366-v && mouseY>=380 && mouseY<=423){  
      R4=0;
      G4=255;
      B4=255;
    }
    if(mouseX>=410-v && mouseX<=446-v && mouseY>=380 && mouseY<=423){  
      R4=255;
      G4=0;
      B4=255;
    }
  
  }
//fifth parts  
  if((mouseX>=10-v+t-1800 && mouseX<=46-v+t-1800 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=90-v+t-1800 && mouseX<=126-v+t-1800 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=170-v+t-1800 && mouseX<=206-v+t-1800 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=250-v+t-1800 && mouseX<=286-v+t-1800 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=330-v+t-1800 && mouseX<=366-v+t-1800 && mouseY>=380 && mouseY<=423)
      ||(mouseX>=410-v+t-1800 && mouseX<=446-v+t-1800 && mouseY>=380 && mouseY<=423)){
  
    espeed = 3;
    x5speed=3;
    if(mouseX>=10-v && mouseX<=46-v && mouseY>=380 && mouseY<=423){  
      R5=0;
      G5=255;
      B5=0;
    }
    if(mouseX>=90-v && mouseX<=126-v && mouseY>=380 && mouseY<=423){  
      R5=255;
      G5=0;
      B5=0;
    }
    if(mouseX>=170-v && mouseX<=206-v && mouseY>=380 && mouseY<=423){  
      R5=0;
      G5=0;
      B5=255;
    }
    if(mouseX>=250-v && mouseX<=286-v && mouseY>=380 && mouseY<=423){  
      R5=255;
      G5=255;
      B5=0;
    }
    if(mouseX>=330-v && mouseX<=366-v && mouseY>=380 && mouseY<=423){  
      R5=0;
      G5=255;
      B5=255;
    }
    if(mouseX>=410-v && mouseX<=446-v && mouseY>=380 && mouseY<=423){  
      R5=255;
      G5=0;
      B5=255;
    }
  }
  if(mouseX>=900-v && mouseX<=936-v && mouseY>=380 && mouseY<=423){
    a = 0;
    b = 0;
    c = 0;
    d = 0;
    e = 0;
    aspeed = 0;
    bspeed = 0;
    cspeed = 0;
    dspeed = 0;
    espeed = 0;
    xspeed = 0;
    yspeed = 0;
    x2speed = 0;
    y2speed = 0;
    x3speed = 0;
    y3speed = 0;
    x4speed = 0;
    y4speed = 0;
    x5speed = 0;
    y5speed = 0;
    zspeed = 0;
    ospeed = 0;
    x = -166;
    y = 5;
    x2 = -166;
    y2 = 80;
    x3 = -166;
    y3 = 155;
    x4 = -166;
    y4 = 230;
    x5 = -166;
    y5 = 305;
    v = 0;
    vspeed = 0;
    qspeed = 0;
    x6 = 0;
    x6speed = 0;
    z = 500;
    o =0;
    t = 0;
    q = 0;
    R = 0;
    G = 0;
    B = 0;
    R2 = 0;
    G2 = 0;
    B2 = 0;
    R3 = 0;
    G3 = 0;
    B3 = 0;
    R4 = 0;
    G4 = 0;
    B4 = 0;
    R5 = 0;
    G5 = 0;
    B5 = 0;
  }
}


