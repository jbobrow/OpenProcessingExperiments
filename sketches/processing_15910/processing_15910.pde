
ArrayList bars;
PGraphics buffer;
// list taken from: http://listverse.com/2010/11/23/top-10-shocking-historical-beliefs-and-practices/
String[] beliefs = {"Wife Selling", "Tobacco Smoke Enema", "Rabbit Test", "Mrs Winslow’s Soothing Syrup", "Lobotomy", "Big Nose George", "Drapetomania", "Divine Right of Kings", "Mimizuka", "Female Hysteria"};

PFont font;

void setup() {
  size(600,300, JAVA2D);
  
  buffer = createGraphics(width, height, JAVA2D);
  buffer.beginDraw();
  int numBars = beliefs.length;
  
  bars = new ArrayList();
  int leftOffset = int((width/numBars)/2);
  int spacing = 10;
  int barWidth = int((width - leftOffset*2 - spacing*numBars) /numBars);
  
  for(int i=0; i<numBars; i++) {
    Bar newBar = new Bar(leftOffset + (spacing + barWidth) *i,
                         height, 
                         barWidth, 
                         (int)random(50,height-50), 
                         beliefs[i]);
    bars.add(newBar);
    // draw the bar to the buffer using -(i+1) as the colour
    // Note that Processing colours are negative ints ;)
    buffer.fill(-(i+1));
    // it's important that the stroke either matches the above colour or isn't there!
    buffer.noStroke();
    buffer.rectMode(CORNERS);
    buffer.rect(newBar.x, newBar.y, newBar.x+newBar.w, newBar.y-newBar.h);
  }
  buffer.endDraw();
  font = loadFont("ArialMT-12.vlw");
  textFont(font);
}

void draw() {
  background(0,100,100);
  for(int i=0; i<bars.size(); i++) {
    Bar thisBar = (Bar) bars.get(i);
    thisBar.display();
  }
  
  // get the colour from the buffer matching the mouse position
  int bufferColour = buffer.get(mouseX,mouseY);
  // check that there is a colour present
  if(bufferColour != 0) {
    // Convert the colour to the matching index in the ArrayList
    int index = -(bufferColour+1);
    Bar thisBar = (Bar) bars.get(index);
    thisBar.showLabel();
  }
}

class Bar {
  int x;
  int y;
  int w;
  int h;
  String label;
  float txtWidth;
  float txtHeight;
  
  Bar(int x, int y, int w, int h, String label){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    txtWidth = textWidth(label);
    txtWidth += 10;
    txtHeight = textAscent();
    txtHeight *= 1.5;
  }
  
  void display() {
    rectMode(CORNERS);
    fill(#ff9900);
    stroke(0);
    rect(x,y,x+w,y-h);
  }
  
  void showLabel() {
    rectMode(CORNERS);
    fill(#ffbb22);
    stroke(0);
    rect(x,y,x+w,y-h);
    rectMode(CENTER);
    fill(#eeeeee);
    rect(x+txtWidth/4, y-20-txtHeight/4, txtWidth, txtHeight);
    fill(0);
    textAlign(CENTER);
    text(label, x+txtWidth/4, y-20);
  }
}

