
void setup(){
size(600,600);
smooth();
  frameRate(25);
  PFont font;
  font = loadFont ("Univers-80.vlw");
  textFont(font);
 
}
void draw(){
  PImage img1 = loadImage("IMG_0344.jpg");
  PImage img2 = loadImage("IMG_0345.jpg");
  int w = width/24;
  int h = height/32;
   
  for (int i=0; i<width; i+=w){
  for (int j=0; j<height; j+=h){
    int srcX = int(random(width-w));
    int srcY = int(random(height-h));
    int srcW = int(random(w));
    int srcH = int(random(h));
    img1.blend(img2, srcX, srcY, srcW, srcH, i, j, w, h, LIGHTEST);
    
    translate(mouseX, mouseY);
  fill(#F79B0F,120);
  text("B",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F02E3E,120);
  text("A",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F74D0F,120);
  text("R",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F7740F,120);
  text("R",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F70F13,120);
  text("I",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F7C90F,120);
  text("E",mouseX,random(0,250),mouseY,random(0,250));
  if (mousePressed == true){
    
  }
 }
image(img1, 0, 0);
}
}

