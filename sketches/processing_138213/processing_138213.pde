
//The sketch shows a circle changes itself through interacting with others
//The user can use the mouse to control the circle to go through the lines and get the color changed

color[] palette = {#FF3058, #1FAFF9, #3BC100, #FF9400, #56DDDE}; //Initialize the palette
ArrayList<Line> lines = new ArrayList<Line>(); //The lines
color current; //The current dot color
int clock; //The clock to generate lines

void setup() {
  size(800, 600); //canvas size
  clock = 0; //initialize the clock
  current = #FFFFFF; //the initial color of the dot is white
}

void draw() {
  background(20); //grey underground
  
  while (clock >= 30) { //generate new lines iterately
    Line newLine = new Line(random(300, 500), 0);
    lines.add(newLine);
    clock = 0;
  }
  
  clock++; //add the clock
  
  for (int i = 0; i < lines.size(); ++i) { //for all the lines
    Line l = lines.get(i);
    stroke(palette[l.c]);
    strokeWeight(5);
    noFill();
    line(l.x - l.l, l.y, l.x + l.l, l.y); //draw the line
    if (l.y == 400 && mouseX > (l.x - l.l) && mouseX < (l.x + l.l)) { //whether the dot get through the line or not
      current = blendColor(current, palette[l.c], BLEND);
    }
    if (l.y < 200) { //update the lines
      l.y += 10;
      println("1");
    }
    else if (l.y < 600) {
      l.y += 5;
      if (l.x < 400) {
        l.x -= random(0, 5);
      }
      else {
        l.x += random(0, 5);
      }
      l.l += 2;
    }
    else {
      lines.remove(i);
    }
    stroke(current);
    strokeWeight(20);
    noFill();
    point(mouseX, 400); //draw the dot
  } 
}

class Line {
  float x;
  float y;
  float l;
  int c;
  
  Line(float positionX, float positionY) {
    x = positionX;
    y = positionY;
    c = (int)random(0, 5);
    l = 15;
  }
}


