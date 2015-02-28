
static Box[] boxes;
static int partitions = 20;
Grid g;

void setup() {
  //size(displayWidth, displayWidth);
  size(640, 640);
  int num = 35;
  g = new Grid(partitions);
  boxes = new Box[num];
  for(int i=0; i<num; i++) {
    boxes[i] = new Box(0, i*width/partitions, width/partitions);
  }
}

void draw() {
  background(153);
  g.display();
  for(int i=0; i<boxes.length; i++) {
    boxes[i].update();
    boxes[i].display();
  }
  
  
  
  fill(0);
}

void mouseReleased()  {
  for(int i=0; i<boxes.length; i++) {
    boxes[i].release();
  }
}

void mousePressed()  {
  for(int i=0; i<boxes.length; i++) {
    boxes[i].press();
  }
}
class Box {

  Point location;
  int boxWidth;
  boolean pressed;

  Box(int x, int y, int boxWidth) {
    location = new Point(x, y);

    this.boxWidth = boxWidth;
  }

  void release()
  {
    pressed = false;
  }

  void press()
  {
    if (overBox())
    {
      pressed = true;
    }
  }

  void update() {

    if (pressed) {
      location.x = mouseX - boxWidth/8;
      location.y = mouseY - boxWidth/8;
    }

    alignToBox();
  }

  void alignToBox()
  {
    for (int r = 0; r < width; r += width/partitions)
    {
      for (int c = 0; c < height; c += height/partitions)
      {
        if ( (location.x > r) && (location.x < r + width/partitions) && (location.y > c) && (location.y < c + height/partitions))
        {
          location.x = r;
          location.y = c;
        }
      }
    }
  }

  //TODO add what happens when another box is put on top of another
  boolean unoccupied()
  {
    return false;
  }

  boolean overBox() {
    if (mouseX >= location.x && mouseX <= location.x+boxWidth && mouseY >= location.y && mouseY <= location.y + boxWidth) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    fill(200);
    stroke(0);
    if (pressed) {
      fill(100, 10, 10, 100);
      rect(location.x, location.y, boxWidth, boxWidth);
      fill(200);
      rect(location.x - 5, location.y - 5, boxWidth, boxWidth);
      fill(200, 50);
      line(location.x - 5, location.y - 5, location.x+boxWidth - 5, location.y+boxWidth - 5);
      line(location.x - 5, location.y+boxWidth - 5, location.x+boxWidth - 5, location.y - 5);
    }
    else
    {
      rect(location.x, location.y, boxWidth, boxWidth);
    }
  }
}

class Grid
{
  int partitionSize;
  
  Grid(int partitionSize)
  {
    this.partitionSize = partitionSize;
  }
  
  void display()
  {
    fill(10,24, 20);
    stroke(250,130, 50);
    strokeWeight(2);
    for(int r = 0; r < width; r += width/partitionSize)
    {
      for(int c = 0; c < height; c += height/partitionSize)
      {
        rect(r,c, width/partitionSize, height/partitionSize);
      }
    }
  }
    
}
class Point
{

  float x;
  float y;

  Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  float getX()
  {
    return this.x;
  }

  float getY()
  {
    return this.y;
  }
}



