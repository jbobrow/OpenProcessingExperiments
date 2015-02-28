
//Austen's Drawing
String s1= "COSMIC";
String s2= "TOMATO";
String s3= "SOUP";
String s4= "SLOP";
String F="Funkadelic's";
String C="Campbell's";
int x=90;
int y=430;
int x2=85;
int x3=115;
int y2=535;

void setup()
{
  size(400,600);
  frameRate(70);
background(255);
smooth();
}
 
 void draw(){
strokeWeight(1);
fill(167,166,166);
strokeWeight(2);
ellipse(199,560,312,55);
ellipse(199,555,312,50);
 
fill(255);
rect(50,50,300,500);
fill(227,44,47);
rect(50,50,300,250);
fill(167,166,166);
strokeWeight(2);
ellipse(199,55,312,55);
ellipse(199,50,312,50);
ellipse(200,50,200,30);
ellipse(200,50,285,40);
ellipse(200,55,185,30);
 
fill(255);
noStroke();
ellipse(200,550,295,50);

 stroke(1);
 
fill(165,108,47);
strokeWeight(2);
ellipse(200,300,85,85);
ellipse(200,300,75,75);
 
 
PFont font;
strokeWeight(2);
fill(0);
font = loadFont("EdwardianScriptITC-85.vlw");
textFont(font);
//text("Campbell's", 53, 167);
if(dist(200,300,mouseX,mouseY)<=30){
  textSize(75);
  text(F,53,167);
 }else{
   text(C,53,167);
 }
 
 
 
fill(255);
font = loadFont("EdwardianScriptITC-85.vlw");
textFont(font);
//text("Campbell's", 55, 170);
if(dist(200,300,mouseX,mouseY)<=30){
  textSize(75);
  text(F,55,170);
 }else{
   text(C,55,170);
 }
 
 
 
strokeWeight(2);
fill(255);
smooth();
font = loadFont("HelveticaCY-Bold-65.vlw");
textFont(font);
textSize(25);
text("C O N D E N S E D", 115, 230);

strokeWeight(2);
fill(0);
smooth();
font = loadFont("Rockwell-ExtraBold-45.vlw");
textFont(font);
textSize(55);
if(dist(200,300,mouseX,mouseY)<=30){
  text(s4,x3,y2);
 }else{
   text(s3,x3,y2);
 }
 
 
 
strokeWeight(2);
fill(234,17,17);
smooth();
font = loadFont("Helvetica-Bold-65.vlw");
textFont(font);
textSize(55);
//text("TOMATO", 85, 430);

fill (165,108,47);
ellipse(200,300,75,75);
fill(234,17,17);
if(dist(200,300,mouseX,mouseY)<=30){
  text(s1,x,y);
 }else{
   text(s2,x2,y);
 }
 }


