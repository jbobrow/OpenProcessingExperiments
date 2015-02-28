
PFont font;
PImage img;
float angle = 0.5;
 
void setup(){
img=loadImage("mail.jpg");
size(800,600);
smooth();
font = loadFont("Helvetica-CondensedOblique-35.vlw");
textFont(font);
image(img,0,0);
}
 
void draw(){
  frameRate(90);
  //background(204);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(0);
  textSize(20);
  text("MAILLL", width/15, height/15);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(255,0,0);
  textSize(6);
  text("maill1", width/20, height/20);
  angle -= 0.5;
   textSize(3);
   fill(0,255,0);
    text("maill2", width/30, height/30);
  angle -= 0.20;
}
 
                


