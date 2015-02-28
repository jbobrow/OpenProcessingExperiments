
int x = -540;
int y = -50;
float q;
float e;
float t;
float g;
int n = 0;
int c = 0;
PImage PANDA;
PImage Monster;

void setup(){
  size(500,500);
PANDA = loadImage("PANDA.jpg");
Monster = loadImage("Monster.jpg");
}
void draw(){
  
 
 
  
   if (mousePressed && (mouseButton == LEFT)) {
    fill(26,59,103);
  } else {
    fill(44,181,242);}
    rect(0,0,500,500);
  
  if (x > 540) {
    x = -540; }
    
   x = x + 4;
   
 if (y > 540) {
   y = -140; }
     
   y = y + 2;
   
  stroke(0,0,0);
  fill(8,152,66);
  rect(0,120,500,500);

  fill(139,147,147);
  rect(0,170,500,100);
  
  if (mousePressed && (mouseButton == LEFT)) {
    fill(250,255,15);
    noStroke();
    ellipse(415+x,200,70,38);
    fill(250,255,15,100);
    triangle(390+x,200,450+x,200,350+x,170);
    stroke(0);
  }
  
   //hjul
  fill(0,0,0);
  ellipse(130+x,200,15,15);
  ellipse(110+x,200,15,15);
  ellipse(270+x,200,15,15);
  ellipse(290+x,200,15,15);
  ellipse(345+x,200,15,15);
  
  fill(180,16,47);
  rect(100+x,140,200,60);
  fill(77,100,178);
  rect(305+x,150,50,50);
  fill(165,234,237);
  rect(330+x,160,25,20);
  
 

 fill(250,250,250);
  rect(20,215,40,15);
  rect(100,215,40,15);
  rect(180,215,40,15);
  rect(260,215,40,15);
  rect(340,215,40,15);
  rect(420,215,40,15);
  
  frameRate(50);
  q = random(-10,0);
  e = random(-10,0);
  t = random(-30,0);
  g = random(0,30);
  frameRate(60);
  // hoved
  fill(240,156,65);
  ellipse(100+y,350,30,30);
  //krop
  line(100+y,365,100+y,410);
  //ben
  line(100+y,410,85+y,440+q);
  //ben
  line(100+y,410,115+y,440+e);
  //arm
  line(100+y,365,80+y+g,400);
  //arm
  line(100+y,365,120+y+t,400);
  

  
  //hus
  fill(80,34,11);
  rect(270,300,10,30);
  fill(255,226,3);
  
  rect(200,350,110,110);
  fill(80,34,11);
  triangle(200,350,255,300,310,350);
  //dør og vinduer
  fill(255,137,10);
  rect(230,410,25,50);
  fill(64,238,252);
  rect(210,370,25,25);
  rect(270,370,25,25);

  
  
  //sol
 if (mousePressed && (mouseButton == LEFT)) {
    fill(142,167,161);
    } else {
    fill(250,255,15);
 
}
  ellipse(40,40,40,40);
    
 if (mousePressed && (mouseButton == LEFT)) {
   fill(250,255,15);
   noStroke();
  triangle(105,30,100,40,110,40);
  triangle(100,33,110,33,105,43);
  
  triangle(155,60,150,70,160,70);
  triangle(150,63,160,63,155,73);
  
  triangle(175,20,170,30,180,30);
  triangle(170,23,180,23,175,33);
  
  triangle(255,60,250,70,260,70);
  triangle(250,63,260,63,255,73);
  
  triangle(405,70,400,80,410,80);
  triangle(400,73,410,73,405,83);
  
  triangle(355,30,350,40,360,40);
  triangle(350,33,360,33,355,43);
  
  triangle(455,10,450,20,460,20);
  triangle(450,13,460,13,455,23);
  
  fill(26,59,103);
  ellipse(47,42,34,34);
  
  
}
noStroke();
fill(124,124,124,150-c);
ellipse(274,275+n,10+c,10+c);
n = n - 2;
c = c + 1;

if (n < -360){
 n = 10;
 
 if (c > 150){
   c=10;
}
}
image(PANDA,110+x,145,180,50);
image(Monster, 265,410,38,38);
}
