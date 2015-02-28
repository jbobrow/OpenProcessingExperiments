
import gifAnimation.*;
PFont font;
String[] files;
String[] words;
int r;
int r2;
PImage[] animation;
Gif img;


void setup(){
  size(350, 467);
  img = new Gif(this, "sharkblood");
   img.loop();
}

void draw(){
    int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = round(x1 + random(-20, 20));
  int y2 = round(random(-20, 20));

  int w = (int) random(35, 50);
  int h = height;

  copy(x1,y1, w,h, x2,y2, w,h);
image(img,mouseX,mouseY);
  frameRate(10);
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  //Clicks counter
  font = loadFont("Banshee-48.vlw");
  fill(255);
}

void mouseClicked(){
  //displays word in random position and rotation everytime mouse is clicked until counter hits zero
  float d= random(-45,45);
  float s= random(100);
  float x= random(width);
  float y= random(height);
  
  rotate (radians(d));
  //using an array to randomizes between the two fonts
  words=new String[3];
  words[0]="BLOOD EVERYWHERE";
  words[1]="OH NO";
  words[2]="IT'S EVERYWHERE";
  r= (int) random(3);
  //using an array to randomizes between the two fonts
  files=new String[2];
  files[0]="Banshee-48.vlw";
  files[1]="Banshee-48.vlw";
  r2= (int)random(2);
  font = loadFont(files[r2]);
  textFont(font, s);
  fill(#A62B35);
  text(words[r], x, y);
}


