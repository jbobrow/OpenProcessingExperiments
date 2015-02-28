
ArrayList lines;
ArrayList newLines;
color bgColor = color(255);
PFont font;

void setup() {
  frameRate(30);
  size(400,400);
  
  background(bgColor);
  textFont(loadFont("ArialMT-18.vlw"));
  smooth();
  stroke(0);
  fill(0);

  lines = new ArrayList();
  newLines = new ArrayList();
  lines.add(new Line(float(width/2), float(height/2),random(PI * 2)));
}

void draw() {
  loadPixels();
  
  for(int i=0;i<lines.size();i++)
    ((Line)lines.get(i)).update();
      
  lines.addAll(newLines);
  newLines.clear();
  
  for(int i=lines.size() - 1; i >= 0; i--) {
    Line line = (Line) lines.get(i);
    line.draw();
    if(line.dead)
      lines.remove(i);
  }

/*
  fill(bgColor);
  stroke(bgColor);
  rect(0,0,80,20);

  fill(0);
  stroke(0);
  text("Lines: " + lines.size(),10,18);
*/
}

boolean isTaken(int x, int y) {
  if(x < 0 || x >= width || y < 0 || y >= height)
    return true;

  return pixels[y * width + x] != bgColor;
}

void mousePressed() {
  if(mouseButton == LEFT)
    newLines.add(new Line(int(mouseX),int(mouseY),random(PI * 2)));
  else if(mouseButton == RIGHT) {
    lines.clear();
    background(bgColor);
    newLines.add(new Line(int(mouseX),int(mouseY),random(PI * 2)));
  }
}

class Line {
  boolean dead;
  float x, y;
  int prev_x, prev_y;
  
  float heading, curvature;
  float speed, acceleration;
  float spawnRate;
  
  public Line(float x, float y, float heading) {
    dead = false;
    
    this.x = x;
    this.y = y;
    this.heading = heading;
    
    prev_x = int(x);
    prev_y = int(y);
    
    acceleration = random(-0.05,0.05);
    curvature = random(-0.2, 0.2);
    
    speed = random(1,2); 
    spawnRate = random(0,0.1);
  }
  
  void draw() {
    line(int(prev_x),int(prev_y),int(x),int(y));
  }
  
  void update() {
    prev_x = int(x);
    prev_y = int(y);
    
    speed += acceleration;
    heading += curvature;

    x += speed * cos(heading);
    y += speed * sin(heading);
    
    int cx = int(x), cy = int(y);
    if(speed <= 0 || (cx != prev_x && cy != prev_y && isTaken(cx,cy)))
      dead = true;
    else if(random(1) < spawnRate)
      newLines.add(new Line(x,y, heading + random(-1,1) * PI / 2f));
  }
}

