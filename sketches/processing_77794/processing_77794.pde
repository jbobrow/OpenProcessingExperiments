
String ages[];
String averageAgeScore[];


PImage background1;

PImage brain1715;
PImage brain2;
PImage brain3;
PImage brain4;
PImage brain5913;
PImage brain6;
PImage brain811;
PImage brain10;
PImage brain12;
PImage brain14;
String averageScoreValue;
PFont titlefont;



void setup(){
  size(600,600);
  
  background(255);
 
  background1 = loadImage("background_head.png");
  background1.resize(600,600);
  
  createFont("ageFont.vlw",48);
  createFont("averageScore.vlw",48);
  
  
  brain1715 = loadImage("brain.png");
  brain1715.resize(110,110); 
  
  brain2= loadImage("brain.png");
  brain2.resize(155,155); 
  
  brain3 = loadImage("brain.png");
  brain3.resize(140,140); 
  
  brain4 = loadImage("brain.png");
  brain4.resize(125,125); 
  
  brain5913 = loadImage("brain.png");
  brain5913.resize(80,80); 
  
  brain6 = loadImage("brain.png");
  brain6.resize(185,185); 
  
  brain811 = loadImage("brain.png");
  brain811.resize(65,65); 
  
  brain10 = loadImage("brain.png");
  brain10.resize(95,95); 
  
  brain12 = loadImage("brain.png");
  brain12.resize(200,200); 
  
  brain14 = loadImage("brain.png");
  brain14.resize(170,170); 

  ages = loadStrings("agesData.csv");
  averageAgeScore = loadStrings("shortTermAgeAverageData.csv");
  
  for(int i=0; i<ages.length; i++){
    println(ages[i]);
  }
  println("");
  for(int i=0; i<averageAgeScore.length; i++){
    println(averageAgeScore[i]);
  }
  
}

void draw(){
  averageScoreValue = "Please select age";
  
  imageMode(CENTER);
  image(background1,300,300);
  //image(brain1715,330,145);
  titlefont = loadFont("titlefont.vlw");
  textFont(titlefont,20);
  text("Comparison between",420,50);
  text("Age",490,75);
  text("+",500,100);
  text("Short",480,125);
  text("Term Memory",460,150);
  rectMode(CENTER);
  fill(255);
  rect(25,20,30,30);
  rect(25,60,30,30);
  rect(25,100,30,30);
  rect(25,140,30,30);
  rect(25,180,30,30);
  rect(25,220,30,30);
  rect(25,260,30,30);
  rect(25,300,30,30);
  rect(25,340,30,30);
  rect(25,380,30,30);
  rect(25,420,30,30);
  rect(25,460,30,30);
  rect(25,500,30,30);
  rect(25,540,30,30);
  rect(25,580,30,30);
  
  PFont ageFont;
  ageFont = loadFont("ageFont.vlw");
  textFont(ageFont,24);
  
  for(int i=0; i<ages.length; i++){
    text(ages[0],50,25);
    text(ages[1],50,65);
    text(ages[2],50,105);
    text(ages[3],50,145);
    text(ages[4],50,185);
    text(ages[5],50,225);
    text(ages[6],50,265);
    text(ages[7],50,305);
    text(ages[8],50,345);
    text(ages[9],50,385);
    text(ages[10],50,425);
    text(ages[11],50,465);
    text(ages[12],50,505);
    text(ages[13],50,545);
    text(ages[14],50,585);
  }
  
  if(dist(pmouseX,pmouseY,25,20) <=15){
   image(brain1715,330,145); 
   averageScoreValue =  averageAgeScore[0];
   
  }
  if(dist(pmouseX,pmouseY,25,60) <=15){
   image(brain2,330,145); 
   averageScoreValue =  averageAgeScore[1];
  }
  if(dist(pmouseX,pmouseY,25,100) <=15){
   image(brain3,330,145); 
   averageScoreValue =  averageAgeScore[2];
  }
  if(dist(pmouseX,pmouseY,25,140) <=15){
   image(brain4,330,145); 
   averageScoreValue =  averageAgeScore[3];
  }
  if(dist(pmouseX,pmouseY,25,180) <=15){
   image(brain5913,330,155); 
   averageScoreValue =  averageAgeScore[4];
  }
  if(dist(pmouseX,pmouseY,25,220) <=15){
   image(brain6,330,145); 
   averageScoreValue =  averageAgeScore[5];
  }
  if(dist(pmouseX,pmouseY,25,260) <=15){
   image(brain1715,330,145); 
   averageScoreValue =  averageAgeScore[6];
  }
  if(dist(pmouseX,pmouseY,25,300) <=15){
   image(brain811,330,160); 
   averageScoreValue =  averageAgeScore[7];
  }
  if(dist(pmouseX,pmouseY,25,340) <=15){
   image(brain5913,330,155); 
   averageScoreValue =  averageAgeScore[8];
  }
  if(dist(pmouseX,pmouseY,25,380) <=15){
   image(brain10,330,145); 
   averageScoreValue =  averageAgeScore[9];
  }
  if(dist(pmouseX,pmouseY,25,420) <=15){
   image(brain811,330,160); 
   averageScoreValue =  averageAgeScore[10];
  }
  if(dist(pmouseX,pmouseY,25,460) <=15){
   image(brain12,330,145); 
   averageScoreValue =  averageAgeScore[11];
  }
  if(dist(pmouseX,pmouseY,25,500) <=15){
   image(brain5913,330,155); 
   averageScoreValue =  averageAgeScore[12];
  }
  if(dist(pmouseX,pmouseY,25,540) <=15){
   image(brain14,330,145); 
   averageScoreValue =  averageAgeScore[13];
  }
  if(dist(pmouseX,pmouseY,25,580) <=15){
   image(brain1715,330,145); 
   averageScoreValue =  averageAgeScore[14];
  }
  
  PFont averageScore;
  averageScore = loadFont("averageScore.vlw");
  textFont(averageScore,12);
  text("Average score for selected age:",420,450);
  text(averageScoreValue,420,470);
}


