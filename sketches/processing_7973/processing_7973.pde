
float a;
float b;
float p;
float q;

float r;
float g;
float bl;

PImage dryer;
PImage dye1;
PImage dye2;
PImage dye3;
PImage dye4;
PImage bleach;
PImage shine;

PFont font;

float eye;

void setup() {
  dryer = loadImage("hairdryer.png");
  dye1 = loadImage("dye.png");
  dye2 = loadImage("dye2.png");
  dye3 = loadImage("dye3.png");
  dye4 = loadImage("dye4.png");
  bleach = loadImage("bleach.png");
  shine = loadImage("shine.png");
  font = loadFont("Tahoma-Bold-30.vlw");
  textFont(font);
  
  size(640,480);
  cursor(dryer,12,50);
  
  r = 255;
  g = 255;
  bl = 255;

}

void draw(){
 
  background(160,190,210);
  smooth();
  
  noStroke();
  fill(240,200,200);
  rect(40,-10,235,40);
  fill(200,240,200);
  rect(290,-10,120,30);
  fill(180,130,180);
  textAlign(CENTER);
  text("Beauty Parlor",155,16);
  
  fill(126,55,22);
  stroke(0);
  strokeWeight(1);
  ellipse(610,-30,200,240);
  fill(180,200,210);
  ellipse(610,-30,175,210);
  
  fill(95,16,16);
  ellipse(300,300,340,100);
  fill(165,84,0);
  ellipse(300,300,300,80);
  fill(118,193,21);
  ellipse(300,300,260,60);
  fill(69,118,160);
  ellipse(300,300,220,40);
  
  image(shine,530,-50);
  image(dye1,535,120);
  image(dye2,445,120);
  image(dye3,490,120);
  image(dye4,400,120);
  image(bleach,30,120);
  
  stroke(0);//legs
  strokeWeight(20);
  line(350,250,360,290);
  line(320,250,305,290);
  line(250,250,260,290);
  line(235,250,220,290);
  
  noStroke();//body
  fill(r,g,bl);
  ellipse(280,212,120,80);
  
  ellipse(298+p,174+p,a,a);
  ellipse(352+p,210+p,a,a);
  
  stroke(0);
  strokeWeight(10);//ears
  line(330,155,map(mouseX,0,width,338,315),map(mouseX,0,width,140,155));
  line(map(mouseX,0,width,300,285),map(mouseX,0,width,155,165),310,165);
  
 strokeWeight(2);//head
 fill(r,g,bl);
 ellipse(340,180,70,55);
  
  eye = map(mouseX,0,width,5,9);
  
  noStroke();
  fill(0);//eyes
  ellipse(325,170,eye,eye);
  ellipse(345,168,eye,eye);
  
   a = map(mouseX,0,width,30,90);
   b = map(mouseX,0,width,10,70);
  
   p = (random(-.5,1));
   q = (random(-.5,1));
     if(mouseX > 420){
    p = 0;
    q = 0;}
    
    if(mouseX > 540){
      fill(r,g,bl);
      ellipse(340,180,a,a);
      ellipse(222,230,a,a);
      ellipse(362,234,a,a);
      ellipse(235,176,a,a);
      ellipse(276,155,b,b);
      ellipse(322,258,b,b);
      ellipse(232,254,b,b);
    }
  
  fill(r,g,bl);//fur
  ellipse(216+p,212+p,b,b);
  ellipse(280+q,170+p,b,b);
  ellipse(262+p,177+q,a,a);
  ellipse(238+p,187+p,a,a);
  ellipse(230+q,202+p,a,a);
  ellipse(228+p,224+p,a,a);
  ellipse(240+p,236+p,a,a);
  ellipse(252+p,248+p,b,b);
  ellipse(268+q,245+p,a,a);
  ellipse(288+q,245+q,a,a);
  ellipse(310+q,242+q,a,a);
  ellipse(332+p,238+p,a,a);
  ellipse(350+p,228+q,a,a);
  ellipse(364+p,220+q,b,b);
  
  if((mousePressed == true) &&
  (mouseX > 425) && (mouseX < 460) &&
  (mouseY > 120) && (mouseY < 220)){
    r = 230;
    g = 70;
    bl = 30;}

  if((mousePressed == true) &&
  (mouseX > 470) && (mouseX < 505) &&
  (mouseY > 120) && (mouseY < 220)){
    r = 210;
    g = 80;
    bl = 220;}
  
  if((mousePressed == true) &&
  (mouseX > 515) && (mouseX < 550) &&
  (mouseY > 120) && (mouseY < 220)){
    r = 20;
    bl = 250;
    g = 140;}
    
  if((mousePressed == true) &&
  (mouseX > 560) && (mouseX < 615) &&
  (mouseY > 120) && (mouseY < 220)){
    r = 250;
    bl = 105;
    g = 50;}
    
  if((mousePressed == true) &&
  (mouseX > 30) && (mouseX < 100) &&
  (mouseY > 120) && (mouseY < 240)){
    r = 255;
    bl = 255;
    g = 255;}
}

