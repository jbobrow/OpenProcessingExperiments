
/*
ACCD Summer 2012
ID02
9//Arrays1 
Charlene Chen
07/27/2012
*/


import processing.pdf.*;

PFont font;

String[] answers;
String[] answers2;
String[] genders;
String[] genders2;
int[] ages;
int[] ages2;
int[] categories;
int[] categories2;

Participant[] participants = new Participant[29];
Participant[] participants2 = new Participant[51];

int noRadius, yesRadius;
int noDiameter, yesDiameter;
int noX, noY;
int yesX, yesY;

void setup() {
// size(900, 612, PDF, "ID02_wk10Arrays4.pdf");
 size(900, 612);
 smooth();
 colorMode(HSB, 360, 100, 100);
 //background(350);
 
 font = loadFont("Helvetica-12.vlw");
 
 answers = loadStrings("answers_no.txt");
 answers2 = loadStrings("answers_yes.txt");
 genders = loadStrings("genders_no.txt");
 genders2 = loadStrings("genders_yes.txt");
 ages = int(loadStrings("ages_no.txt"));
 ages2 = int(loadStrings("ages_yes.txt"));
 categories = int(loadStrings("categories_no.txt"));
 categories2 = int(loadStrings("categories_yes.txt"));
 
 //noLoop();
 //frameRate(1);
 
 //No Setup
 noDiameter = 350;
 noRadius = noDiameter/2;
 noX = width/4;
 noY = height/2;
 
 //Yes Setup
 yesDiameter = 350;
 yesRadius = yesDiameter/2;
 yesX = width-width/4;
 yesY = height/2;
 
 
// for(int i= 0; i<participants.length; i++) {
//  participants[i] = new Participant(answers[i], ages[i]);
// }
 
 for(int i= 0; i<participants.length; i++) {
  participants[i] = new Participant(random(((width/4)-yesRadius), ((width/4)+yesRadius)), random(((height/2)-yesRadius), ((height/2)+yesRadius)), 200, categories[i], genders[i], answers[i], ages[i]);
  
  //println(ages[i]);
 }
 
 //println("----------------------" );
 
 for(int i= 0; i<participants2.length; i++) {
  participants2[i] = new Participant(random(((width-width/4)-yesRadius), ((width-width/4)+yesRadius)), random(((height/2)-yesRadius), ((height/2)+yesRadius)), 100, categories2[i], genders2[i], answers2[i], ages2[i]);
  
  //println(ages2[i]);
 }
}

void draw() {
  //println( genders );
  
  noStroke();
  fill(350);
  rect(0,0,width, height);
  
//  for(int i = 0; i < genders.length; i++) {
//   println( genders[i] ); 
//  }
  
  for(int i= 0; i<participants.length; i++) {
    participants[i].display();
    participants[i].update();
    participants[i].boundary();
  }
  
  for(int i= 0; i<participants2.length; i++) {
    participants2[i].display();
    participants2[i].update();
    participants2[i].boundary2();
  }

  //fill(240); 
  noFill();
  strokeWeight(11);
  stroke(0);
  
  //No-Face
  ellipse(noX, noY, noDiameter, noDiameter);
  
  //Yes-Face
  ellipse(width-width/4, height/2, 350, 350);
  
  strokeCap(SQUARE);
  //No-Mouth
  arc(width/4, height/2+120, 200, 130, PI, TWO_PI);
  
  //Yes-Mouth
  arc(width-width/4, height/2+50, 200, 130, 0, PI);

  fill(350);
  //No-Eyes
  ellipse(width/4-70, height/2-20, 35, 35);
  ellipse(width/4+70, height/2-20, 35, 35);
  
  //Yes-Eyes
  ellipse((width-width/4)-70, height/2-20, 35, 35);
  ellipse((width-width/4)+70, height/2-20, 35, 35);
  
  
  pushMatrix();
  strokeWeight(3);
  for(int i= 0; i<participants.length; i++) {
    participants[i].checkHover();
  }
  
  for(int i= 0; i<participants2.length; i++) {
    participants2[i].checkHover2();
  }
  popMatrix();
  
  
  //text
  pushMatrix();
  
  translate(40, 0);
  
  textFont(font, 12);
  //noStroke();
  fill(100, 100, 100);
  stroke(100, 100, 100);
  ellipse(50, 65, 10, 10);
  fill(0);
  text("School/Work", 70, 70);
  
  fill(20, 100, 100);
  stroke(20, 100, 100);
  ellipse(250, 65, 10, 10);
  fill(0);
  text("Family", 270, 70);
  
  fill(200, 100, 100);
  stroke(200, 100, 100);
  ellipse(410, 65, 10, 10);
  fill(0);
  text("Friends", 430, 70);
  
  fill(320, 100, 100);
  stroke(320, 100, 100);
  ellipse(570, 65, 10, 10);
  fill(0);
  text("Lover", 590, 70);
  
  fill(50, 100, 100);
  stroke(50, 100, 100);
  ellipse(730, 65, 10, 10);
  fill(0);
  text("Pets", 750, 70);
  
  popMatrix();
  
  textFont(font, 15);
  fill(0);
  text("ARE YOU HAPPY WITH WHERE YOU ARE IN LIFE RIGHT NOW?", 230, height-50);
  
//  PGraphicsPDF pdf = (PGraphicsPDF) g;
//  pdf.nextPage();
//  
//  if(frameCount == 100) {
//    exit();
//  }

  //exit();
}


