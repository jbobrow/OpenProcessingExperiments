
PGraphics tintLayer;
VectorField vf;
float strength = 1;

void setup() {
  // ---- Parameters to tune ----
  int decayRate = 20;    // Trails: 0=last forever, 255=die instantly.
  // ---- Boilerplate ----
  size(400,400);
  frameRate(30);
  smooth();
  background(0);
  stroke(255);
  //colorMode(HSB, 255);
  
  vf = new VectorField(30, 30);
  
  // The tint layer is just black with an alpha channel.
  // At each frame, it is copied to the existing particle trails,
  // which creates the decay as it gradually is forced to black.
  tintLayer = createGraphics(width, height, P2D);
  tintLayer.beginDraw();
  tintLayer.background(0,decayRate);
  tintLayer.endDraw();
}

void draw() {
  background(0);
  vf.perturb(mouseX, mouseY);
  vf.draw(true);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    strength = 3;
  } else if (mouseButton == RIGHT) {
    strength = 200;
  }
}

void mouseReleased() {
  strength = 1;
}

class VectorField {
  // start: The point in pixel-space where our vector starts
  PVector start[];
  
  // delta: The relative direction we are pointing. This will generally
  // be normalized.
  PVector delta[];
  
  // lastMove: A value between 0 and 1 indicating how strongly the particle
  // was pulled to reach its current position (0 = none, 1 = very strongly)
  float lastMove[];
  
  // Note that start.length = delta.length = lastMove.length.
  
  // Scale: What we might multiply 'delta' by to get a sensible measure in
  // pixel space
  float scale;
  
  // Creation of vector field: Default length is the minimum distance between
  // two adjacent points in the field, and this is in the direction of x.
  VectorField(int countX, int countY) {
    start = new PVector[countX * countY];
    delta = new PVector[countX * countY];
    lastMove = new float[countX * countY];
    for(int yn = 0; yn < countY; ++yn) {
      final int offset = countY*yn;
      for(int xn = 0; xn < countX; ++xn) {
        final int index = offset + xn;
        start[index] = new PVector();
        delta[index] = new PVector();
        start[index].x = width * xn / float(countX);
        start[index].y = height * yn / float(countY);
        delta[index].x = 0;
        delta[index].y = 0;
        lastMove[index] = 0;
      }
    }
    
    // Set a sensible scale value to be the minimum distance between two adjacent points
    // of the vector field
    scale = min(float(width)/countX, float(height)/countY);
  }

  // Draw the entire vector field as lines, optionally colored.
  void draw() {
    draw(false);
  }
  void draw(boolean colored) {
    final int maxColor = 255;
    if (colored) {
      colorMode(HSB, maxColor);
    }
    for(int i = 0; i < start.length; ++i) {
      int sx = floor(start[i].x);
      int sy = floor(start[i].y);
      
      // If colored lines were requested, then set the hue equal to delta's angle.
      if (colored) {
        // atan2 returns result in [-PI, PI], so scale/offset it
        final float h = (atan2(delta[i].x, delta[i].y) + PI) * maxColor / PI / 2;
        float s = pow(lastMove[i], 0.1);
        stroke(h, maxColor, maxColor);
      }
      
      line(sx, sy, sx + scale*delta[i].x, sy + scale*delta[i].y);
    }
  }
  
  // 'perturb' this vector field by some point. All of the vectors will
  // turn somewhat to face it, but this falls off by the distance.
  void perturb(float centerX, float centerY) {
    for(int i = 0; i < start.length; ++i) {
      float targetDx = centerX - start[i].x;
      float targetDy = centerY - start[i].y;
      float dist = sqrt(targetDx*targetDx + targetDy*targetDy);
      // factor is in (0,1]; it equals 1 if (centerX,centerY) is exactly
      // at the start of the vector i, and it approaches 0 as it moves
      // farther away.
      float factor = 1 / (1 + dist);
      factor = pow(factor, 1 / strength);
      // Linearly interpolate between the normalized targetDx/y vector,
      // and our own delta vector.
      delta[i].x = factor * targetDx/dist + (1 - factor) * delta[i].x;
      delta[i].y = factor * targetDy/dist + (1 - factor) * delta[i].y;
      lastMove[i] = factor;
    }
  }
}

