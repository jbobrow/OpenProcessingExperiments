

int lastX, lastY = -1;
int[][] level = new int[12][6];
int score = 0;
boolean playing = true;

void setup() {
  size(361,721, P2D);
  background(255); // fills the image
  stroke(0); // colour of lines

  // populate level
  for (int y = 0; y < level.length; y++) {
    for (int x = 0; x < level[0].length; x++) {
      level[y][x] = rand_tile();
    }
  }
  checkAdjacency(); // so the user doesn't score points before he does anything
  level_draw();

  fill(0, 0, 0, 0); // fill of lines
  rect(0,0, width-1,height-1); // border at the edge

}

int rand_tile() {
  return 50 + int(random(1, 6)) * 40;
}

void level_draw() {
  // this only runs when it needs to update the tiles
  // draw level
  for (int y = 0; y < level.length; y++) {
    for (int x = 0; x < level[0].length; x++) {
      fill(level[y][x], 255); // fill of lines
      rect(x*60, y*60, (x+1)*60, (y+1)*60);
    }
  }
}

void draw() {
  // this method runs constantly
  // score
  if (score >= 255){
    score = 0; // so we don't keep having to draw this.
    println( "WIN" );

    // displays win goodness
    fill(0, 200);

    rect(0, 0, width, height);
    PFont font;
    font = loadFont("Eureka-90.vlw"); 
    textFont(font); 
    fill(255);
    textAlign(CENTER);
    text("A WINRAR\n IS YOU!", width/2, height/2); 
    
    playing = false;
  } else if (playing) {
    fill(score, 255);
    rect(0,0,20,20);
  }
}

void swap(int x1, int y1, int x2, int y2) {
  int tmp = level[y1][x1];
  level[y1][x1] = level[y2][x2];
  level[y2][x2] = tmp;
}

void mousePressed() {
  if (playing){
    int x = mouseX/60;
    int y = mouseY/60;
    if (x < level[0].length-1){
      swap(x, y, x+1, y);
      //println("colors are " + level[y][x] + " and " + level[y][x+1]);
    }
    score += checkAdjacency();
    println( score );
    level_draw();
  } 
  // swapping modifies the pixels so we redraw them.
}

/* A "collision" is the event event when tiles are aligned
 * such that they score points. 
 */
class Collision {
  boolean dir;
  int x, y, len;
  Collision(boolean _dir, int _x, int _y, int _len) {
    dir = _dir; // true is horizontal, false is vertical
    x = _x;
    y = _y;
    len = _len; // length-1, so not including the starting point
    // ex. three in a row has a length of 2
  }
};

/* This turned out to be a lot uglier than I anticipated :S
 * this function returns .... the "score" from the collisions that took place
 */
int checkAdjacency() {
  ArrayList collisions;
  collisions = new ArrayList();
  for (int y = 0; y < level.length; y++) {
    for (int x = 0; x < level[0].length; x++) {
      if ((y != 0) && (y != level.length-1)){
        // check above and below the pixel
        if ((level[y-1][x] == level[y][x]) &&
          (level[y+1][x] == level[y][x])) {
          int len = 2;
          int ny = y; // must modify the iterator counter
          // two while loops we go up to find the top of the line of similar tiles
          // 
          while ((ny-- != 0) && (level[ny][x] == level[ny+len][x]));
          ny++; // go back to the correct tile
          while ((ny+(len++) < level.length-1) && (level[ny][x] == level[ny+len][x]));
          len--; 
          // we have found a collision! check if it's the same as other collisions
          boolean found = false;
          for (int i=0; i < collisions.size(); i++){
            Collision c = (Collision) collisions.get(i);
            if ((c.dir == false) && (c.x == x) && (c.y == ny) && ((c).len == len)){
              found = true; // it's the same, so we raise a flag so we know later on
            }
          }
          if (!found){
            collisions.add( new Collision(false, x, ny, len) );
          }
        }
      } // end vert check
      if ((x != 0) && (x != level[0].length-1)){
        // check above and below the pixel
        if ((level[y][x-1] == level[y][x]) &&
          (level[y][x+1] == level[y][x])) {
          int len = 2;
          int nx = x;
          while ((nx-- != 0) && (level[y][nx] == level[y][nx+len]));
          nx++; // go back to the correct tile
          while ((nx+(len++) < level[0].length-1) && (level[y][nx] == level[y][nx+len]));
          len--; 
          // we have found a collision! check if it's the same as other collisions
          boolean found = false;
          for (int i=0; i < collisions.size(); i++){
            Collision c = (Collision) collisions.get(i);
            if ((c.dir == true) && (c.x == nx) && (c.y == y) && ((c).len == len)){
              found = true; // it's the same, so we raise a flag so we know later on
            }
          }
          if (!found){
            collisions.add( new Collision(true, nx, y, len) );
          }
        }
      } // end horiz check
    }
  }
  // this is the part where we delete the collisions
  int scoresum = 0;
  for (int i=0; i < collisions.size(); i++){
    Collision c = (Collision) collisions.get(i);
    scoresum += (c.len-1) * 2;
    for (int j=0; j <= c.len; j++){
      if (c.dir) level[c.y][c.x+j] = rand_tile();
      else level[c.y+j][c.x] = rand_tile();
    }
  }
  // 1.2 because bonus for combos!!
  if (scoresum != 0) scoresum += 1.5 * checkAdjacency();
  return scoresum;
}


