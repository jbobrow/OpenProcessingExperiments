
class Particle {

  PVector position;
  PVector velocity;
  int timer;


  Particle (float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(1 - random(2), 1 - random(2));
    timer = int(random(120));
  }


  void Update() {
    int cellX = int(position.x);
    int cellY = int(position.y);


    flow[cellX][cellY].x = flow[cellX][cellY].x * 0.95 + velocity.x * 0.05;
    flow[cellX][cellY].y = flow[cellX][cellY].y * 0.95 + velocity.y * 0.05;
    density[cellX][cellY] += 0.1;
    flow[cellX][cellY].limit(1);

    velocity.x += 0.2 * flow[cellX][cellY].x;
    velocity.y += 0.2 * flow[cellX][cellY].y;
    velocity.y += 0.01 * wind[cellY];

    velocity.mult(0.9);

    position.x = (position.x + velocity.x + resolutionX) % resolutionX;
    position.y = (position.y + velocity.y + resolutionY) % resolutionY;

    timer ++;
    if (timer > 240) {
      timer = int(random(120));
      position = new PVector(random(resolutionX), 
      random(resolutionY));
      velocity = new PVector(-1 + random(2), -1 + random(2));
    }
  }


  void Draw(float zoom) {
    stroke(0, min(255, int(255 * abs(velocity.x) / 0.2)),
      min(255, int(255 * abs(velocity.y / 0.2))));
    line(zoom * position.x, zoom * position.y,
    zoom * (position.x + velocity.x), 
    zoom * (position.y + velocity.y));
  }
}


