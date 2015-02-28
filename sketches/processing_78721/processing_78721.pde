
//Source: http://www.openprocessing.org/sketch/19601
//photo source: http://www.homedressing.net/wp-content/
PFont font1;PFont font2;
 
float v5b1z9 = 500;
float fr = 5; //frame rate variable starts at 15
 
void setup() {
  size(550, 550);
  font1 = loadFont("AlternateGothicNo2BT-Regular-48.vlw");
 font2 = loadFont("WiesbadenSwing-Dingbats-48.vlw"); //agenda 48
  smooth();
  img= loadImage("1.jpg");
}


 
void draw() {
  background(235);
  noFill();
  image(img,0,0);
  frameRate(fr);
  
 
//V5B1Z9
//V
textFont(font1);
  fill(#c0359a, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#c0359a, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#c0359a, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#c0359a, v5b1z9);
  text("B", random(550), v5b1z9);
//5 
textFont(font2);
  fill(#e984ce, v5b1z9);
  text("A", random(550), v5b1z9);
  fill(#e984ce, v5b1z9);
  text("A", random(550), v5b1z9);
  fill(#e984ce, v5b1z9);
  text("A", random(550), v5b1z9);
  fill(#e984ce, v5b1z9);
  text("A", random(550), v5b1z9);
//B
textFont(font1);
  fill(#3793ce, v5b1z9);
  text("A", random(550), v5b1z9);
  fill(#3793ce, v5b1z9);
  text("A", random(550), v5b1z9);
  fill(#3793ce, v5b1z9);
  text("A", random(550), v5b1z9);
  fill(#3793ce, v5b1z9);
  text("A", random(550), v5b1z9);
//1
textFont(font2);
  fill(#5E412F, v5b1z9);
  text("R", random(550), v5b1z9);
  fill(#78C0A8, v5b1z9);
  text("R", random(550), v5b1z9);
  fill(#F07818, v5b1z9);
  text("R", random(550), v5b1z9);
  fill(#F0A830, v5b1z9);
  text("R", random(550), v5b1z9);
//Z
textFont(font1);
  fill(#efe82a, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#efe82a, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#efe82a, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#efe82a, v5b1z9);
  text("B", random(550), v5b1z9);
//9
textFont(font2);
  fill(#68c64b, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#68c64b, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#68c64b, v5b1z9);
  text("B", random(550), v5b1z9);
  fill(#68c64b, v5b1z9);
  text("B", random(550), v5b1z9);
 


textFont(font1);
  fill(#a54bc6, v5b1z9);
  text("Y", random(550), v5b1z9);
  fill(#a54bc6, v5b1z9);
  text("Y", random(550), v5b1z9);
  fill(#a54bc6, v5b1z9);
  text("Y", random(550), v5b1z9);
  fill(#a54bc6, v5b1z9);
  text("Y", random(550), v5b1z9);
 
}
 
void mousePressed (){
  fr += 150;
  }
void mouseReleased(){
  fr = 5;
}
PImage img; 


