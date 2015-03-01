
PImage[] muffins = new PImage[4];
Button button = new Button( 275, 275, 50, 50);

class Button{
  int x, y, w, h;
  boolean mouseHover;
  
  Button(int xpos, int ypos, int wid, int hgt){
    x = xpos;
    y = ypos;
    w = wid;
    h = hgt;
  }

  void checkCursor(){
    mouseHover = (mouseX > x) && (mouseX <= x+w) && (mouseY > y) && (mouseY <= y+h);
  }
  
  void display(){
    fill(255);
    rect(x, y, w, h);
  }
}

void mouseClicked(){
  if( button.mouseHover ){
    image(muffins[int(random(4))], random(500), random(500) );
  }
}

void setup(){
  size(600, 600);
  muffins[0] = loadImage("http://i.imgur.com/a2jgqw7.png");
  muffins[1] = loadImage("http://i.imgur.com/lt0FBOl.png");
  muffins[2] = loadImage("http://i.imgur.com/zKWKa5b.png");
  muffins[3] = loadImage("http://i.imgur.com/lfX2PYa.png");
  
}

void draw(){
  button.checkCursor();
  button.display();
}

  


