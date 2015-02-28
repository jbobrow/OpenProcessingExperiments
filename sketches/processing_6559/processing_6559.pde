
/**
 * Draw "sliding doors"; as a door passes over more doors
 * beneath it, it becomes more transparent. Left mouse click
 * to add a door, right mouse click to remove a door at
 * random.
 */
ArrayList doorList;
int ALPHA_STEP = 30;
int nAdd = 0;
int nRemove = 0;

void setup( ) {
  size(400, 100);
  background(255);
  doorList = new ArrayList( );
  doorList.add(new Door());
  doorList.add(new Door());
  doorList.add(new Door());
  noStroke( );
  frameRate(10);
}

void draw( ) {
  Door d;
  int n;
  int alphaValue;
  background(255);
  for (int i = 0; i < doorList.size(); i++)
  {
    d = (Door) doorList.get(i);
    n = countIntersections(i);
    alphaValue = max(10, 255 - n * ALPHA_STEP);
    d.display(alphaValue);
    d.move();
  }
  // take care of pending adds and removes;
  // do removal first.
  for (int i = 0; i < nRemove && doorList.size() > 0; i++) {
    int position = int(random(doorList.size()));
    doorList.remove(position);
  }

  for (int i = 0; i < nAdd; i++) {
    doorList.add(new Door());
  }

  nAdd = 0;
  nRemove = 0;
}

/*
 * Count how many doors below the given
 * doorListNumber intersect it at any point.
 */
int countIntersections(int doorListNumber) {
  int total = 0;
  Door d = (Door) doorList.get(doorListNumber);
  for (int i = 0; i < doorListNumber; i++)
  {
    total += d.intersect((Door) doorList.get(i));
  }
  return total;
}

/*
 * Add a door on left mouse click, remove a door
 * on right mouse click. Since I don't know when
 * processing handles the click, I can't add or remove
 * doors in this function; otherwise I might remove one
 * just before it is being drawn.
 */
void mousePressed() {
  if (mouseButton == LEFT) {
    nAdd++;
  }
  else if (mouseButton == RIGHT) {
    nRemove++;
  }
}

//==============================================

class Door {
  int x;
  int w;
  int speed;
  color c;

  Door( )
  {
    x = int(random(width / 2));
    w = int(width/16 + random(width / 4));
    // last factor in speed gives -1 or + 1
    speed = int(3 + random(10)) * (2 * int(random(2)) - 1);
    // color can't be too light, and has full opacity
    c = color(random(240), random(240), random(240), 255);
  }

  /*
   * Display the door at its current position with the given
   * transparency
   */
  void display(int alphaValue)
  {
    color colour = (c & 0xffffff) | (alphaValue << 24);
    fill(colour);
    rect(x, 0, w, height);
  }

  /*
   * Moves the x-coordinate of the door, reversing direction
   * when it hits the boundary of the window.
   */
  void move()
  {
    x += speed;
    if (x < 0) {
      x = 0;
      speed = -speed;
    }
    else if (x + w > width)
    {
      x = width - w;
      speed = -speed;
    }
  }

  /*
   * Returns zero if door and otherDoor do not
   * intersect; one otherwise.
   * A and B intersect if A's left side is less than
   * B's left side and A's right side is more than B's
   * left side. (Do same test for B vs. A)
   */
  int intersect(Door otherDoor) {
    int result = 0;
    if (otherDoor.x <= this.x && otherDoor.x + otherDoor.w >= this.x)
    {
      result = 1;
    }
    else if (otherDoor.x >= this.x && otherDoor.x <= this.x + this.w)
    {
      result = 1;
    }
    return result;
  }  
}




