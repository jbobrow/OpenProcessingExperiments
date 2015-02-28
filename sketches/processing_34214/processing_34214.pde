
int posx;
int posy;
int textPosy = 40;
int sizeX = 20;
int sizeY = 20;
int opacity = 200;
boolean bp = true;
boolean i = true;
boolean smCursor = false; //small cursor
boolean lgCursor = false;
color pixel;
color black = color(0,0,0);
PImage img;
PImage small;
PImage large;
boolean a = false;
String s = "instructions";
String t = "p  key - 50% opacity";
String u = "o  key - 100% opacity";
String v = ">  key - larger brush";
String w = "<  key - smaller brush";
String x = "b  key - draw black line";
String y = "r  key - START and start over";
String z = "s  key - save a .tif of your work";

void setup() {
  img = loadImage("purple.png");
  size(img.width, img.height);
  image(img, 0, 0);
  small = loadImage("small.png");
  large = loadImage("large.png");
  img.loadPixels();
  smooth();
//  fill(0);
    background(0);
    PFont font;
    font = loadFont("JosefinSans-20.vlw"); 
    textFont(font);
    fill(255, 255, 255);
    float sw = textWidth(s);
    float tw = textWidth(t);
    float uw = textWidth(u);
    float vw = textWidth(v);
    float ww = textWidth(w);
    float xw = textWidth(x);
    float yw = textWidth(y);
    float zw = textWidth(z);
    text(s, img.width/2-sw/2, textPosy);
    text(t, img.width/2-tw/2, textPosy +30);
    text(u, img.width/2-uw/2, textPosy +60);
    text(v, img.width/2-vw/2, textPosy +90);
    text(w, img.width/2-ww/2, textPosy +120);
    text(x, img.width/2-xw/2, textPosy +150);
    text(y, img.width/2-yw/2, textPosy +180);
    text(z, img.width/2-zw/2, textPosy +210);
    noStroke();
}

void draw() {
  
  if(bp){
    pixel = get(mouseX, mouseY);
  }else{
    pixel = black;
    sizeX = 5;
    sizeY = 5;
  }
  if(smCursor){
  cursor(small);
  }
  if(lgCursor){
  cursor(large);
  }else{
  cursor(CROSS);
  }
  //color(255,45,45);
  noStroke();
  fill(pixel, opacity);
  if (mousePressed == true) {

    posx = mouseX;
    posy = mouseY;

    ellipse(posx, posy, sizeX, sizeY);
  }
}
void keyTyped() {
  if (key == 'p' || key == 'P') {
    opacity = 100;
  }
  if (key == 'o' || key == 'O') {
    opacity = 215;
  }
  if (key == '>') {
    sizeX = 40;
    sizeY = 40;
    lgCursor = true;
    cursor(large);
  }
  if (key == '<') {
    sizeX = 20;
    sizeY = 20;
    smCursor = true;
    cursor(small);
  }
  if (key == 'b' || key == 'B') {
    bp = !bp;
    
  }
  if (key == 'r' || key == 'R') {
    img = loadImage("purple.png");
    size(img.width, img.height);
    image(img, 0, 0);
    img.loadPixels();
    smooth();
  }
  if (key == 's' || key == 'S') {
    save("mypaintmee.tif");
 }
  if (key == 'i' || key == 'I') {
    background(0);
    PFont font;
    font = loadFont("JosefinSans-20.vlw"); 
    textFont(font);
    fill(255, 255, 255);
    float sw = textWidth(s);
    float tw = textWidth(t);
    float uw = textWidth(u);
    float vw = textWidth(v);
    float ww = textWidth(w);
    float xw = textWidth(x);
    float yw = textWidth(y);
    float zw = textWidth(z);
    text(s, img.width/2-sw/2, textPosy);
    text(t, img.width/2-tw/2, textPosy +30);
    text(u, img.width/2-uw/2, textPosy +60);
    text(v, img.width/2-vw/2, textPosy +90);
    text(w, img.width/2-ww/2, textPosy +120);
    text(x, img.width/2-xw/2, textPosy +150);
    text(y, img.width/2-yw/2, textPosy +180);
    text(z, img.width/2-zw/2, textPosy +210);
    noStroke();
    i = !i;
  }
}


