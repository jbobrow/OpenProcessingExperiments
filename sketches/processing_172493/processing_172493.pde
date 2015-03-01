

/* @pjs preload="Luke_vs_Vader.png,deathstar.png,obiwan.png,darth_vader_2.png";*/

//PImage defbg = new Pimage(1300,548);
//PImage icon;
//PImage obi = new Pimage(1300,548);
//PImage vader = new Pimage(1300,548);
import ddf.minim.*;
Minim minim;
AudioSample lukeiamyourfather, forcebewithyou, tiefighter;
float r= 0;
float g= 255;
float b= 0;

void setup() {
  minim = new Minim(this);
  lukeiamyourfather = minim.loadSample("Iamfather.mp3", 500);
  forcebewithyou = minim.loadSample("forcewith.mp3", 500);
  tiefighter = minim.loadSample("tiefighter.mp3", 500);
  size(1300,548);
  defbg = loadImage("Luke_vs_Vader.png");
  icon = loadImage("deathstar.png");
  obi = loadImage("obiwan.png");
  vader = loadImage("darth_vader_2.png");
  smooth();
  rectMode(CORNERS);
  frameRate(25);

  
}

void draw() {
 background(defbg); 
  cursor(icon);
 
 if (mouseX > 200 && mouseX < 1100 && mousePressed == true && mouseButton== LEFT){
  tiefighter.trigger(); 
 }
 if (mouseX < 200 && mousePressed == true && mouseButton== LEFT){
 forcebewithyou.trigger();
 } 
 if (mouseX > 1100 && mousePressed == true && mouseButton== LEFT){
 lukeiamyourfather.trigger();  
 }
 if (mouseX < 200){
  background(obi); 
 }
 else if (mouseX > 1100){
   background(vader);
 }
 else {
  background(defbg); 
 }

strokeWeight(2);
stroke(150);
line(600,400,650,400);
line(625,400,625,425);
line(625,425,620,450);
line(625,425,630,450);
ellipse(625,390,10,15);
strokeCap(ROUND);
strokeJoin(ROUND);
strokeWeight(10);
if (mousePressed && mouseButton== RIGHT){
 r = random(255);
 g = random(255);
 b = random(255);
}
stroke(r,g,b);
  fill(255);
    
  triangle(600,400,mouseX, mouseY, pmouseX, pmouseY);
 }
