
class Asteroids
{
  int moveY;
  float speed;
  int moveX;
  
  Asteroids(int y, float s, int x)
  {
    moveY = (y * 2);
    speed = s;
    moveX = x;
  }  
  void createAsteroids()
  {
    sphereDetail(5);  
    m += .005;
    pushMatrix();
    translate((300 + moveX), 300);
    rotateY(m * speed);
    translate(450, moveY);  
    noStroke();
    fill(200);
    sphere(5);
    popMatrix();
  }
}

