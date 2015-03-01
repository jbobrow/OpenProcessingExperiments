
PImage bkgd;
PImage col;
PFont font;
int move = 0;
int movey = 0;

void setup(){
 size(500,400);
 bkgd = loadImage("bkgd.jpg");
 col = loadImage("col.png");
 font = loadFont("Georgia-48.vlw");
}

void draw(){
  image(bkgd, 0, 0,width,height);
  image(col, -150-move,50+movey,width,height);
  image(col, -150-move,50+movey,width,height);
  image(col, 150+move,50+movey,width,height);
  image(col, 150+move,50+movey,width,height);
  textFont(font,48);
  text("This is a museum", 65,375-(movey*10));
  move = (-mouseY+400)/4;
  movey = -(-mouseY+400)/40;


}


