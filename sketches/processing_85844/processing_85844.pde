
float jawH=75;
float jawW=100;
float jawX=400-jawW/2;
float jawTop=500;
float jawBot=575;
float teethGap=10;
float teethH=20;
float teethW=jawW-2*teethGap;
float teethX=jawX+teethGap;
float teethTop=jawTop-teethH;
float teethBot=jawBot-teethH;
float headH=200;
float headW=jawW+230;
float headX=jawX-(headW-jawW)/2;
float i = 0;
float j = 0;
 
void setup() {
  size(800,800);
   
}
 
void draw() {
  if (mousePressed && mouseButton==LEFT) {
    i += .25;
    j += 5;
  }
  else if (mousePressed && mouseButton==RIGHT) {
    i -= .25;
    j -= 5;
  }
  if (j>255) {
    j=0;
  }
    if (j<0) {
    j=255;
  }
  background(255-j,255,0+j);
  fill(0,0,0,0);
  strokeWeight(10+j);
  stroke(0+j,255-j,255);
  ellipse(400,400,6*j,6*j);
  rectMode(CORNER);
  noStroke();
  fill(230,200,100);
  quad(400-headW/2,jawTop,400+headW/2,jawTop,jawX+jawW,jawBot+jawH,jawX,jawBot+jawH);
  fill(100,0,0);
  rect(jawX,jawTop,jawW,jawBot-jawTop);
  fill(0,0,0);
  ellipse(400,(jawTop+jawBot)/2,jawW,jawBot-jawTop-10);
  fill(200,100,100);
  ellipse(415,jawBot,jawW-30,jawBot-jawTop);
  ellipse(385,jawBot,jawW-30,jawBot-jawTop);
  fill(100,0,0);
  ellipse(400,(jawTop+jawBot)/2-(jawBot-jawTop-10)/2,jawW/4,(jawBot-jawTop-10)/2);
  fill(230,200,100);
  rect(jawX,jawBot,jawW,50);
  if(mouseY>jawTop && mouseY<jawBot) {
    fill(230,200,100);
    rect(jawX,mouseY,jawW,jawH);
    fill(255,255,255);
    rect(teethX,mouseY-teethH,teethW,teethH);
  }
  if(mouseY<=jawTop) {
    fill(230,200,100);
    rect(jawX,jawTop,jawW,jawH);
    fill(255,255,255);
    rect(teethX,teethTop,teethW,teethH);
  }
  if(mouseY>=jawBot) {
    fill(230,200,100);
    rect(jawX,jawBot,jawW,jawH);
    fill(255,255,255);
    rect(teethX,teethBot,teethW,teethH);
  }
  fill(230,200,100);
  rect(headX,jawTop-headH,headW,headH);
  ellipse(headX-5,jawTop-125,25,150);
  ellipse(headX+headW+5,jawTop-125,25,150);
  ellipse(400,jawTop-headH,headW,300);
  fill(230,100,50);
  quad(400,jawTop-175,430,jawTop-40,400,jawTop-15,370,jawTop-40);
  fill(255,255,255);
  ellipse(310,jawTop-125,100,50);
  ellipse(490,jawTop-125,100,50);
  rectMode(CENTER);
  
  pushMatrix();
  fill(200,150,100);
  translate(310,jawTop-125);
  rotate(i);
  ellipse(0,0,15,30);
  popMatrix();
  
  pushMatrix();
  fill(100,150,200);
  translate(310,jawTop-125);
  rotate(-i);
  ellipse(0,0,15,30);
  popMatrix();
  
  pushMatrix();
  fill(100,150,200);
  translate(490,jawTop-125);
  rotate(-i);
  ellipse(0,0,15,30);
  popMatrix();
  
  pushMatrix();
  fill(200,150,100);
  translate(490,jawTop-125);
  rotate(i);
  ellipse(0,0,15,30);
  popMatrix();
    
  fill(255,255,255,75);
  stroke(0,0,0);
  strokeWeight(10);
  rect(310,jawTop-125,120,80);
  rect(490,jawTop-125,120,80);
  line(370,jawTop-125,430,jawTop-125);
  noStroke();
  fill(0,0,0);
  triangle(headX,jawTop-headH-100,headX+headW,jawTop-headH-100,400,jawTop-headH-200);
  rect(400,jawTop-headH-80,headW,40);
  rect(headX+25,jawTop-headH-30,50,60);
  rect(headX+headW-25,jawTop-headH-30,50,60);
  
  pushMatrix();
  fill(100,0,0);
  translate(400,400);
  rotate(i);
  rect(0,250,30,30);
  popMatrix();
  
  pushMatrix();
  fill(0,0,100);
  translate(400,400);
  rotate(-i);
  rect(0,-250,30,30);
  popMatrix();

}
