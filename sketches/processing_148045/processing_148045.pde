
PImage asteroid;
PImage space;

void setup(){
  size(700,700);
  asteroid = loadImage("asteroid.png");
  space = loadImage("space.jpg");
  asteroid1 = new Asteroid(random(width),random(height),5,2);
  asteroid2 = new Asteroid(random(width),random(height),8,1);
  asteroid3 = new Asteroid(random(width),random(height),10,6);
}

void draw(){
  image(space,0,0);
  asteroid1.move();
  asteroid1.draw();
  asteroid2.move();
  asteroid2.draw();
  asteroid3.move();
  asteroid3.draw();
}

class Asteroid {
  float x;
  float y;
  float x_speed;
  float y_speed;
  
  Asteroid (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  
  void draw(){
    image(asteroid,x,y);
  }
  
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 150) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
  }
}


