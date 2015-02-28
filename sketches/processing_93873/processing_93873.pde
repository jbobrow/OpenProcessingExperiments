
PImage pic;
int particle_num = 100;
int x_pos_start = 500;
int x_pos_end = 920; 
float dir_start = radians(15);
float dir_end = radians(60);

Particle[] particle;
PGraphics buffer;
PImage[] sprites; 

void setup() {

  pic = loadImage("pic.png");

  sprites = new PImage[4];
  sprites[0] = loadImage("particle1.png");
  sprites[1] = loadImage("particle2.png");
  sprites[2] = loadImage("particle3.png");
  sprites[3] = loadImage("particle4.png");

  size(1279, 399);
  smooth();
  noStroke();
  frameRate(30);  

  particle = new Particle[particle_num];

  for (int i = 0; i < particle_num; i++) {
    particle[i] = new Particle();
  }
}


void draw() {

  image(pic, 0, 0);  // выводим Энштейна

  /* double buffer */
  buffer = createGraphics(width, height);

  buffer.beginDraw();
  buffer.background(0, 0);
  buffer.noStroke();

  for (Particle instance: particle) {
    instance.update();
  }
  buffer.endDraw();
  blend(buffer, 0, 0, width, height, 0, 0, width, height, SOFT_LIGHT);
}



class Particle {
  float x, y, speed, size, angle, grade;
  color Color;
  int lifetime, lifetime_charge;
  PGraphics pg;
  int sprite;

  Particle() {
    rebirth();
  }

  void rebirth() {
    x = random(x_pos_start, x_pos_end);
    y = random(0, 120);
    speed = random(0.05, 1.25);
    size = random(3, 8);
    angle= random(dir_start, dir_end);
    Color = color(#C4AC7A);
    grade = 3;
    lifetime = int(random(frameRate * 5, frameRate * 20));
    lifetime_charge = lifetime;
    int canvas_size = int(max(size, grade));
    pg = createGraphics(canvas_size, canvas_size);

    sprite = int(random(0, 3));
  }

  void update() {

    x = x + speed * cos (angle);
    y = y + speed * sin (angle);

    lifetime -= 1;
    if (lifetime <= 0) {
      rebirth();
    }

    visualize();
  }
  void visualize() {
    buffer.fill(Color, 255 * sin(PI * lifetime / lifetime_charge));
    buffer.ellipse(x, y, size, size);

    //buffer.tint(255, 255 * sin(PI * lifetime / lifetime_charge));
    //buffer.image(sprites[sprite], x, y);
  }
}



