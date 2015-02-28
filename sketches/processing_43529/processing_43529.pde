
//Sleeping Fionna
//by Yssa Badiola
//MIDTERMMMMM

PImage fionna;
PImage sun;
PImage moon;
float mX,sX,mY,sY,angle;
float cB;

void setup(){
 size(450,600);
 colorMode(HSB,360,100,100);
 smooth();
 fionna = loadImage("sleepingfionna2.png");
 sun = loadImage("sun.png");
 moon = loadImage("moon.png");
 mX = 0;
 mY = 0;
 sX = 0;
 sY = 0;
 angle = 0;
 cB = 0;
}
  
void draw(){
  background(209,13,cB+11);
  
  //let's rotate the sun/moon...
  mY = sin(radians(angle))*400 + 250;
  mX = cos(radians(angle))*300 - 10;
  image(moon,mX,mY);
  
  sY = sin(radians(angle+180))*400 + 250;
  sX = cos(radians(angle+180))*300 - 10;
  image(sun,sX,sY);
  angle-=.5;  
  
  //fionna's room
  noStroke();
  fill(30,30,cB+20);
  rect(0,0,width,45);
  rect(0,0,232,height);
  rect(432,0,width,height);
  rect(232,294,200,400);
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(232,44,200,250);
  image(fionna,0,0);
  
    //moon
  if(mY >=0 && mY < height && mX > width/2){
    cB-=1;
  }
  //sun 
  if(sY >= 0 && sY < height && sX > width/2){
    cB+=1;
  }
  
  //fionna's face
  //if night
  if(cB <=10){
    stroke(0);
    strokeWeight(1.5);
    fill(35,13,100);
    ellipse(163,394,110,95);
    bezier(136,395,147,399,157,392,155,386);
    bezier(186,374,192,381,198,376,198,371);
    fill(0,69,28);
    ellipse(184,406,10,20);
    //hair
    fill(55,89,90);
    stroke(55,89,80);
    beginShape();
    vertex(164,346);
    bezierVertex(126,325,76,398,110,443);
    bezierVertex(127,461,154,466,120,478);
    bezierVertex(160,476,146,452,136,438);
    bezierVertex(127,422,129,361,164,346);
    endShape();
  } else {
    //day
    fill(35,13,100);
    ellipse(150,400,110,95);
    stroke(0);
    strokeWeight(1.5);
    bezier(113,410,121,406,134,410,134,410);
    bezier(128,395,131,398,133,397,133,397);
    bezier(156,394,158,393,159,389,159,389);
    bezier(165,402,170,394,184,391,184,391);
    bezier(144,425,146,422,159,421,174,425);
    noStroke();
    fill(0,76,87,70);
    ellipse(127,420,15,10);
    ellipse(180,404,15,10);
    //hair
    fill(55,89,90);
    stroke(55,89,80);
    beginShape();
    vertex(143,352);
    bezierVertex(109,338,60,392,74,431);
    bezierVertex(76,441,110,438,113,452);
    bezierVertex(111,460,109,465,99,467);
    bezierVertex(116,468,134,452,128,440);
    bezierVertex(123,434,101,433,103,408);
    bezierVertex(107,383,123,366,143,352);
    endShape();
  }
}

