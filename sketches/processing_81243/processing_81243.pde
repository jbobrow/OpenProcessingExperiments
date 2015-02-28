
PImage img;
PFont font;
float angle = 0;
 
void setup(){
size(700,500);
smooth();
font = loadFont("BookmanOldStyle-BoldItalic-48.vlw");
img=loadImage("rolling.png");
textFont(font);
   image(img,0,0);
}
 
void draw(){

  fill(225,192,141);
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  textSize(16);
  text("ROLL", width/10, height/10);
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);

  textSize(6);
    fill(213,171,106);
  text("Spin", width/20, height/20);
  angle -= 0.15;

}

  
   

