
int x;
PFont arbonnieFont;
PFont rodFont;
PImage coolcat;

void setup(){
  size(600,600);
  x=0;
  arbonnieFont = loadFont("ARBONNIE-48.vlw");
  rodFont = loadFont("Rod-52.vlw");
  coolcat = loadImage("hairless_cat_tattoed.jpg");
}
    
    void draw(){
      background (145,40,140);
      tint(244,100,0,200);
      image(coolcat,mouseX,mouseY);
      textFont (rodFont);
      
      textSize(25);
      fill(255);
      text("of wrinkles",250,300);
      
      fill(0);
      textFont(arbonnieFont);
      textSize(100);
      text("A BOUQUET",mouseX,mouseY);
    }

