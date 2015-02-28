
class Fireball {
  int ALIVE_COUNT_MAX = 78;
  int _aliveCount = round(random(ALIVE_COUNT_MAX - 8, ALIVE_COUNT_MAX));
  int _waitCount = round(random(512));
  float _x = width / 2, _y = height / 2;
  float _width;
  float _widthRatio = random(0, 1);
  float _speed = 1.02;
  PVector _velocity = new PVector(random(0, 1), random(0, 1));
  int _directionX = (random(1) < 0.5 ? -1 : 1), _directionY = (random(1) < 0.5 ? -1 : 1);
  int PHASE_WAIT = 0, PHASE_BALL = 1, PHASE_SPARK = 2, PHASE_END = 3;
  int _phase = PHASE_WAIT;
  float[] _color = {random(256), random(256), random(256)};
  boolean _sparkable = false;
  Spark[] _sparks;

  Fireball() {
    _sparkable = _aliveCount < ALIVE_COUNT_MAX ? true : false;
    _color = getColor(round(random(5)));
  }
  float[] getColor(num) {
    float[] ret;
    if (num == 1) {
      ret = new float[] {255, 140, 0};
    } else if (num == 2) {
      ret = new float[] {255, 255, 0};
    } else if (num == 3) {
      ret = new float[] {0, 230, 0};
    } else if (num == 4) {
      ret = new float[] {20, 130, 240};
    } else if (num == 5) {
      ret = new float[] {150, 50, 200};
    } else {
      ret = new float[] {255, 0, 0};
    }
    return ret;
  }

  Fireball update() {
    if (_phase == PHASE_WAIT) {
      if (_waitCount-- < 0) _phase = PHASE_BALL;

    } else if (_phase == PHASE_BALL) {
      if (_aliveCount-- > 0) {
        _x += _directionX * _speed * _velocity.x;
        _y += _directionY * _speed * _velocity.y;
        _width = _speed * _widthRatio;
        _speed = pow(_speed, 1.08);

      } else {
        if (_sparkable) {
          _phase = PHASE_SPARK;
          _sparks = new Spark[round(8)];
          for (int i = 0; i < _sparks.length; i++) _sparks[i] = new Spark(_x, _y, _width, _color);
        } else {
          _phase = PHASE_END;
        }
      }

    } else if (_phase == PHASE_SPARK) {
      boolean sparkling = false;
      for (int i = 0; i < _sparks.length; i++) {
        _sparks[i].update();
        if (_sparks[i]._alive) sparkling = true;
      }
      if (!sparkling) _phase = PHASE_END;

    } else if (_phase == PHASE_END) {
      // nothing
    }
    return this;
  }
  Fireball show() {
    if (_phase == PHASE_WAIT) {
      // nothing

    } else if (_phase == PHASE_BALL) {
      fill(_color[0], _color[1], _color[2]);
      stroke(_color[0], _color[1], _color[2]);
      ellipse(_x, _y, _width, _width);

    } else if (_phase == PHASE_SPARK) {
      for (int i = 0; i < _sparks.length; i++) _sparks[i].show();

    } else if (_phase == PHASE_END) {
      // nothing
    }

    return this;
  }
}

class Spark {
  float _x, _y, _width;
  float _alpha = 255;
  float _color;
  PVector _velocity = new PVector(random(-1, 1), random(-1, 1));
  boolean _alive = true;
  Spark(float ax, float ay, float awidth, float[] acolor) {
    _x = ax;
    _y = ay;
    _width = awidth / 8;
    _color = acolor;
  }
  Spark update() {
    if (_alpha <= 0) _alive = false;
    _alpha -= 8;
    _x += _velocity.x * 3;
    _y += _velocity.y * 3;
    --_width;
    return this;
  }
  Spark show() {
    if (!_alive) return this;
    fill(_color[0], _color[1], _color[2], _alpha);
    stroke(_color[0], _color[1], _color[2], _alpha);
    ellipse(_x, _y, _width, _width);
    return this;
  }
}

Fireball[] fireballs;
int alphaText = 0;
boolean running = false;

void setup() {
  frameRate(32);
  size(420,420);
  smooth();
} 
void draw() { 
  background(0, 0, 34);
  drawFireBall();
}
void drawFireBall() { 
  if (!running) {
    if (alphaText < 255) alphaText += 4;
    fill(255, alphaText);
    textSize(36);
    text("click me", width / 3, height / 2);
    return;
  }

  boolean alive = false;
  for (int i = 0; i < fireballs.length; i++) {
    fireballs[i].update().show();
    if (fireballs[i]._phase != fireballs[i].PHASE_END) alive = true;
  }
  if (!alive) {
    fireballs = null;
    running = false;
  }
}

void mousePressed(){
  if (running) return;
  fireballs = new Fireball[512];
  for (int i = 0; i < fireballs.length; i++) fireballs[i] = new Fireball();
  alphaText = 0;
  running = true;
}
