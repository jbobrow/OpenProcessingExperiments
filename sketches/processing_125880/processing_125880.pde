
class Ball {
  float _x = 0, _y = 0;
  float _speed = 0;
  float _width = 8;
  float _waitCount = random(0, 256);

  int PHASE_READY = 0;
  int PHASE_BALL = 1;
  int PHASE_PIECES = 2;
  int _phase = PHASE_READY;
  ArrayList<Piece> _pieces = new ArrayList<Piece>();

  Ball(float x, float y) {
    _x = x; _y = y;
  }

  Ball display() {
    if (_phase == PHASE_READY) {
      // nothing to do

    } else if (_phase == PHASE_BALL) {
      // draw this ball
      fill(255, 64);
      stroke(216);
      ellipse(_x, _y, _width, _width);

    } else if (_phase == PHASE_PIECES) {
      // draw pieces of this
      for (int i = 0; i < _pieces.size(); i++) _pieces.get(i).display();
    }
    return this; // for method chaining
  }

  Ball update() {
    if (_phase == PHASE_READY) {
      // nothing to do during waiting
      if (_waitCount-- <= 0) _phase = PHASE_BALL;

    } else if (_phase == PHASE_BALL) {
      _y += _speed; // Add speed to location
      _speed += GRAVITY; // Add GRAVITY to speed

      // If this reaches the bottom, break into pieces
      if (_y > height) {
        _speed *= -0.95; // unnecessary maybe but remain
        // create pieces
        int numPieces = 8;//round(random(1, 6));
        for (int i = 0; i < numPieces; i++) _pieces.add(new Piece(_x, _y, _speed));
        _phase = PHASE_PIECES;
      }

    } else if (_phase == PHASE_PIECES) {
      // update pieces of this
      for (int i = 0; i < _pieces.size(); i++) _pieces.get(i).update();
    }
    return this; // for method chaining
  }

  // for sake of cleaning objects
  // not essential for sketch
  boolean alive() {
    if (_phase == PHASE_PIECES) {
      boolean piecesAlive = false;
      for (Piece piece : _pieces) {
        if (piece.alive()) piecesAlive = true;
      }
      return (piecesAlive);
    }
    return true;
  }
}
  
class Piece {
  float _x, _y;
  float WIDTH_INIT = random(width / 12, width / 8);
  float _width = WIDTH_INIT;
  float[] _color = {random(256), random(256), random(256)};
  PVector _velocity;
  float _rad = 0;

  int ALIVE_COUNT_INIT = 360;
  int _aliveCount = ALIVE_COUNT_INIT;
  boolean _alive = true;

  Piece(float x, float y, float speed) {
    _x = x; _y = y;
    int direction = (random(1) < 0.5 ? -1 : 1); // left or right
    _velocity = new PVector(direction * random(1.6), random(speed / 3));
  }

  Piece update() {
    if (!_alive) return this;

    if (_aliveCount-- <= 0) {
      // end of life
      _alive = false;

    } else {
      // move! mutate!
      _y += _velocity.y; _x += _velocity.x;
      _width  = _width / 1.01;
      _rad += 0.15;
    }
    return this; // for method chaining
  }
  Piece display() {
    if (!_alive) return this; // no display because of the end of life

    fill(_color[0], _color[1], _color[2]);
    stroke(255);
    // matrix system make easy to define a triangle and its rotation
    translate(_x, _y);
    rotate(_rad);//TWO_PI / (_aliveCount % TWO_PI));
    triangle(
      0, -_width
      , -_width * cos(HALF_PI / 3), _width * sin(HALF_PI / 3)
      , _width * cos(HALF_PI / 3), _width * sin(HALF_PI / 3)
      );
    resetMatrix();

    return this; // for method chaining
  }

  // for sake of cleaning objects
  // not essential for sketch
  boolean alive() {
    return _alive;
  }
}

float GRAVITY = 0.1; // Global GRAVITY variable
ArrayList<Ball> balls = new ArrayList<Ball>();
boolean running = false; // is the show going on?
int alphaText = 0; // effect for emerging text

void setup() { 
  size(420,420); 
  smooth();
} 

void draw() { 
  background(96, 96, 0);

  boolean alive = false;
  for (Ball ball : balls) {
    ball.display().update();
    if (ball.alive()) alive = true;
  }

  // the show closed
  if (!alive) {
    balls.clear();
    running = false;

    if (alphaText < 255) alphaText += 4;
    fill(255, alphaText);
    textSize(36);
    text("click me", width / 3, height / 2);
  }
}

void mousePressed(){
  if (running) return;

  // create members of the show
  int numBalls = 8;//round(random(8, 16));
  for (int i = 0; i < numBalls; i++) balls.add(new Ball(round(random(0, width)), 0));
  running = true;

  alphaText = 0; // initialize for next
}
