
color rouge=color(168,36,36);
color jaune=color(235,231,25);
color vert=color(81,176,19);
color bleu=color(28,132,176);
color violet=color(168,62,164);
color blc=color(200);
color noir=color(20);
color active;
boolean circle = false;
PImage pack;
 
int st;
 
void setup() {
  size(400,400);
  background(20);
  smooth();
  pack=loadImage("Pacman.png");
}
 
 
 
void draw() {
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>20 && mouseY<40) {
    active=rouge;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>60 && mouseY<80) {
    active=jaune;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>100 && mouseY<120) {
    active=vert;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>140 && mouseY<160) {
    active=bleu;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>180 && mouseY<200) {
    active=violet;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>220 && mouseY<240) {
    active=blc;
  }
 
  if (mousePressed && mouseX>7 && mouseX<15 && mouseY>250 && mouseY<275) {
    st=1;
  }
 
  if (mousePressed && mouseX>15 && mouseX<24 && mouseY>250 && mouseY<275) {
    st=3;
  }
 
  if (mousePressed && mouseX>24 && mouseX<40 && mouseY>250 && mouseY<275) {
    st=10;
  }
 if (mousePressed && mouseX>24 && mouseX<40 && mouseY>300 && mouseY<330) {
    circle = true;
  }
 
  if (mousePressed && mouseX>10 && mouseX<30 && mouseY>370 && mouseY<390) {
    active=noir;
    background(noir);
    circle = false;
  }
 
  noStroke();
 
 
  // fill(20,1);
  // rect(-2,-2,width+2,height+2);
 
  fill(rouge);
  rect(10,20,20,20);
  fill(jaune);
  rect(10,60,20,20);
  fill(vert);
  rect(10,100,20,20);
  fill(bleu);
  rect(10,140,20,20);
  fill(violet);
  rect(10,180,20,20);
  fill(blc);
  rect(10,220,20,20);
  fill(active);
  rect(340,375,200,30);
  fill(80);
  rect(10,370,20,20);
  fill(240);
  ellipse(10,260,4,4);
  ellipse(19,260,6,6);
  ellipse(30,260,9,9);
  for(int a=350;a<400;a+=12){
    strokeWeight(st);
    stroke(20);
    line(a,380,a,400);}
 if (mousePressed && circle != false) {
   image(pack,mouseX,mouseY);
 }
 
  if(mousePressed && circle != true) {
    strokeWeight(st);
    stroke(active);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

