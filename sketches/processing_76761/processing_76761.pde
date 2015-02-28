
int MAX_NUM_OBJECTS = 20;
Star [] stars = new Star[MAX_NUM_OBJECTS];
int idxStars = 0;

void setup() {
  size(1000, 500);
  smooth();
  noStroke();
}

// Draw/animate Stars
void draw() {
  background(9, 21, 73);
  //Moon
  fill (245);
  ellipse(130, 120, 120, 120);
  fill(9, 21, 73);
  ellipse(150, 110, 90, 90);

  for (int i = 0; i < MAX_NUM_OBJECTS; i++) {
    if (stars [i] != null) {
      stars[i].display();
      stars[i].move();
    }
  }
  //Ground
  fill(20);
  rect(0, .8 * height, width, .8 * height);

  // Person
  ellipse( .48 *width, .7 *height, 20, 20);
  ellipse( .48 *width, .78 *height, 20, 60);

  //Bear
  ellipse( .52 *width, .747 *height, 15, 17);
  ellipse( .514 *width, .73 *height, 7, 7);
  ellipse( .526 *width, .73 *height, 7, 7);
  ellipse( .52 *width, .78 *height, 20, 25);
}

// Click for Stars
void mousePressed() {
  stars [idxStars] = new Star(mouseX, mouseY, (int)random(5, 25), color(255));
  idxStars = (idxStars+1) % MAX_NUM_OBJECTS;
}

//Make the Star Class
class Star {

  //Fields
  float x, y, radius, n, delta, idelta, iRadius;
  float direction;
  float m;
  color c;
  float speed;
  float gravity;

  //Constructor
  Star(float locationX, float locationY, float tw, color tc) {
    x = locationX;
    y = locationY;
    radius = tw;
    n = 5;
    delta = 2*PI/n;
    idelta = delta/2;
    iRadius = radius/2;
    direction = 20;
    m = random (-direction, direction);
    c = tc;
    speed = random(4, 6);
    gravity = 0.2;
  } // end of Star constructor

  // Step Animation
  void move() {
    x = x + m;
    y = y + speed;
    speed = speed + gravity;
  }

  //Draws the Stars
  void display() {
    fill(c);
    beginShape();
    for (float theta = .75; theta < 2.75*PI; theta+=delta ) {
      vertex(x + radius*cos(theta), y + radius*sin(theta));
      vertex(x + iRadius*cos(theta+idelta), y + iRadius*sin(theta+idelta));
    }

    endShape(CLOSE);
  }
}
// end of Star class
