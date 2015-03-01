
final int minh = 8;
final int maxh = 80;

 
//final String fontName = "Ravie-48.vlw";
 
//Didn't want to read from file...
String[] arr=("glooming peace morning brings " +
"sun sorrow show head " +
"hence have talk things " +
"shall pardon'd punished " +
"never story woe " +
"Juliet Romeo").split(" ");

void mousePressed(){setup();}

public void setup() {
  size(600, 400);
//  PFont font = loadFont(fontName);
//  textFont(font);
  textAlign(LEFT, TOP);
  smooth();

      background(0);
     recursiveFun(new Rect(0, 0, width, height));

}
 
Point getTextOutlines(String text) {
 
  PGraphics graphics = createGraphics((int) (textWidth(text)), (int) (tsize + textAscent() + textDescent()));
  graphics.beginDraw();
  graphics.fill(0);
  graphics.background(255);
  graphics.textAlign(LEFT, TOP);
//  graphics.textFont(textFont);
  graphics.textSize(tsize);
  graphics.text(text,0,0);
  graphics.endDraw();
 
  Point point=new Point(-1, -1);
  graphics.loadPixels();

 
loop1:
  for (int y = 0; y < graphics.height; y++) {
    for (int x = 0; x < graphics.width; x++) {
      int index = y * graphics.width + x;
      if (graphics.pixels[index] != color(255)) {
        point.x = y;
        break loop1;
      }
    }
  }
 
loop2:
  for (int y = graphics.height-1; y >=0 ; y--) {
    for (int x = 0; x < graphics.width; x++) {
      int index = y * graphics.width + x;
      if (graphics.pixels[index] != color(255)) {
        point.y = graphics.height-y-1;
        break loop2;
      }
    }
  }
 
  return point;
}
int tsize;

public void draw() {
}
 
private void recursiveFun(Rect rect) {
  if (rect.h < minh)
    return;//It's time to stop!
 
  //get any word fom array
  String word = arr[(int) random(0, arr.length - 1)];
 
   tsize = min(rect.h, maxh);
  textSize(tsize);
  int wid = (int)random(rect.w/2, 3*rect.w/4);
  while (textWidth (word) > wid && tsize > 0) {
    tsize--;
    textSize(tsize);
  }
 
  int w = (int) textWidth(word);
  Point point;
  if (w>1 && tsize>1)
    point=getTextOutlines(word);
  else
    point = new Point(0, 0);
  int h = (int) (textAscent()+textDescent()+tsize-point.x-point.y);
  int x = (int) random(rect.x, rect.x + rect.w - w);
  int y = (int) random(rect.y, rect.y + rect.h - h);
  noStroke();
  fill(150, 150, random(255));
  textSize(tsize);
  text(word, x, y-point.x);
// 
  //apply function to four subrectangles
  recursiveFun(new Rect(rect.x, rect.y, rect.w, y - rect.y));
// 
  recursiveFun(new Rect(rect.x, y, x - rect.x, h));
  recursiveFun(new Rect(x + w, y, rect.x + rect.w - x - w, h));
// 
  recursiveFun(new Rect(rect.x, y + h, rect.w, rect.y + rect.h - y - h));
}

class Point{ int x,y; Point(int ix,int iy){x=ix;y=iy;} }

class Rect {  int x, y, w, h;
  public Rect(int cx, int cy, int cw, int ch) {
    x = cx;
    y = cy;
    w = cw;
    h = ch;
  }
}
