
int NUM_BLOBS = 50;
int NUM_BLIPS = 100;

Particle[] blobs = new Particle[NUM_BLOBS];
Particle[] blips  = new Particle[NUM_BLIPS];

void setup() {
  size(800, 600);
  smooth();

  moarBlobs();
  moarBlips();
}

void moarBlobs() {
  for (int i = 0; i < NUM_BLOBS; i++) {
    float x = random(width);
    float y = random(height);
    float direction = random(0, 360);
    float speed = random(0.5, 1.5);
    color col = color(random(230, 256), random(230, 256), 
    random(230, 256), random(200, 256));
    float diameter = random(10, 50);
    blobs[i] = new Blob(x, y, direction, 
    speed, col, diameter);
  }
}

void moarBlips() {
  for (int i = 0; i < NUM_BLIPS; i++) {
    float x = random(width);
    float y = random(height);
    float direction = random(0, 360);
    float speed = random(0.5, 1.5);
    color col = color(random(230, 256), random(230, 256), 
    random(230, 256), random(200, 256));
    float diameter = random(10);
    blips[i] = new Blip(x, y, direction, 
    speed, col, diameter);
  }
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < NUM_BLOBS; i++) {
    blobs[i].updateWrapper();
  }
  for (int i = 0; i < NUM_BLIPS; i++) {
    blips[i].updateWrapper();
  }
  if (frameCount % 1000 == 0) {
    moarBlobs();
  }
}

class Blip extends Particle {
  Blip(float x, float y, float direction, 
  float speed, color col, float diameter) {
    super(x, y, direction, speed, col, diameter);
  }

  void updateWrapper() {
    update();
    fill(col);
    noStroke();
    ellipse(x, y, diameter, diameter);
    
    for (int i = 0; i < NUM_BLIPS; i++)
    {
      Particle other = blips[i];
      if (this != other)
      {
        if (dist(x, y, other.x, other.y) < 10)
        {
          stroke(255);
          line(other.x, other.y, mouseX, y);
          line(x, y, x, mouseY);
        }
      }
    }
  }
}

class Blob extends Particle {
  Blob(float x, float y, float direction, 
  float speed, color col, float diameter) {
    super(x, y, direction, speed, col, diameter);
  }

  void updateWrapper() {
    if (diameter > 0) {
      grow();
      update();
      extendedUpdate();
    }
  }

  void grow() {
    if (growthAmount > 0) {
      diameter += 1;
      growthAmount -= 1;
    }
  }

  void extendedUpdate() {
    fill(col);
    noStroke();
    //float offsetX = map(-mouseX, width*0.15, width*0.85, 0, 1);
    float offsetY = map(height - mouseY, height*0.15, height*0.85, 0, 1);
    ellipse(x, y*offsetY, diameter, diameter);

    for (int i = 0; i < NUM_BLOBS; i++) {
      Particle other = blobs[i];
      if (this != other) {

        if (dist(x, y, other.x, other.y) < 
          (this.diameter/2) + (other.diameter/2)) {
          if (this.diameter > other.diameter) {
            this.growthAmount += other.diameter;
            other.diameter = 0;
          } 
          else {
            other.growthAmount += this.diameter;
            this.diameter = 0;
          }
        }
      }
    }
  }
}

abstract class Particle {
  float diameter = 10;
  float x = 0;
  float y = 0;
  color col = #00FFFF;
  float speed = 1;
  float direction = 0;
  float growthAmount = 0;
  boolean positiveX = true;
  boolean positiveY = true;

  Particle(float x, float y, float direction, 
  float speed, color col, float diameter) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.speed = speed;
    this.col = col;
    this.diameter = diameter;

    float randX = random(1);
    float randY = random(1);

    this.positiveX = (randX > 0.5) ? true : false;
    this.positiveY = (randY > 0.5) ? true : false;
  }

  abstract void updateWrapper();

  void update() {
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
    if (x > width) {
      positiveX = false;
    }
    if (x < 0) {
      positiveX = true;
    }
    if (y > height) {
      positiveY = false;
    }
    if (y < 0) {
      positiveY = false;
    }

    if ((positiveX && dX > 0) || (!positiveX && dX < 0)) {
      x += dX;
    } 
    else {
      x -= dX;
    }

    if ((positiveY && dY > 0) || (!positiveY && dY < 0)) {
      y += dY;
    } 
    else {
      y -= dY;
    }
  }
}

