
float minSize = 6;
float maxSize = 13;
float maxMergedSize = 20;
int totaldrops = 150;
Rain[] drops;


void setup() {
  size(500, 500);
  background(255);

//create drops
  drops = new Rain[totaldrops];
  for (int i=0; i<drops.length;i++) {
    drops [i]= new Rain(random(width), random(height) );
  }
}

void draw() {
  fill(255, 70);
  rect(0, 0, 600, 600);

// falling drops
  for (int i=0; i<drops.length; i++) {
    drops[i].display();
    drops[i].update();
  }

// intersection
  for (int j=0; j<drops.length; j++) {
    for (int i=0; i<drops.length; i++) {
      
//conditions
      boolean areNotSame = i!=j;
      boolean intersect = drops[j].intersect(drops[i]);
      boolean isSizeOK = ( drops[i].size + drops[j].size ) < maxMergedSize;
      boolean hasAnyMerged = drops[i].hasMerged || drops[j].hasMerged;
      
      //if( i!=j && drops[j].intersect(drops[i] && drops[i].size < maxSize ) ) {
  
        if( areNotSame && intersect && !hasAnyMerged ){
        drops[i].merge( drops[j] );
        drops[j].disappear();
      }
    }
  }
}

class Rain {
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  float gravY = 0.07;
  color c=color(67, 104, 152, 30);
  boolean hasMerged = false;

  //constructor
  Rain (float theX, float theY ) {
    reset();
    x = theX;
    y = theY;
  }

  //reset drops
  void reset() {
    size = random(minSize, maxSize);
    ySpeed = map(size, minSize, maxSize, 0.3, 1 );
    y = 0;
    hasMerged = false;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse (x, y, size, size);
  }

  // drop drops which has merged
  void update() {
    y = y + ySpeed;
    if (hasMerged) applyGravity();
    checkForReset();
  }

  void checkForReset() {
    if (y > height) {
      reset();
    }
  }

  void applyGravity() {
    ySpeed = ySpeed * ( 1 + gravY ); // map(size, minSize, maxSize, 0.01, 0.1)
  }

  boolean intersect(Rain b) {
    float distance = dist(x, y, b.x, b.y);
    if (distance < size/2 + b.size/2) {
      return true;
    } 
    else {
      return false;
    }
  }

  void merge( Rain otherDrop ) {
    size = size + otherDrop.size;
    hasMerged = true;
  }

  void disappear() {
    size = 0;
  }
}



