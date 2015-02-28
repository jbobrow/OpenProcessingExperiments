
PImage sky, mts, rail;
PVector pos_sky, pos_mts, pos_rail;
PVector vel_sky, vel_mts, vel_rail;

void setup() {
  size(600, 400, P2D);
  sky = loadImage("sky.png");
  mts = loadImage("mts.png");
  rail = loadImage("rail.png");
  pos_sky = new PVector(0, 0);
  pos_mts = new PVector(0, 4);
  pos_rail = new PVector(0, 155);
  vel_sky = new PVector(0.25, 0);
  vel_mts = new PVector(1, 0);
  vel_rail = new PVector(40.0, 0);
}

void draw() {
  background(255);
  paraDraw(sky, pos_sky, vel_sky);
  paraDraw(mts, pos_mts, vel_mts);
  paraDraw(rail, pos_rail, vel_rail);
  if (mousePressed) changeSpeed();
}

void paraDraw(PImage img, PVector pos, PVector vel) {
  if (pos.x > 0) image(img, pos.x-img.width, pos.y);
  if (pos.x+img.width < width) image(img, pos.x+img.width, pos.y);
  image(img, pos.x, pos.y);
  pos.sub(vel);
  if (pos.x+img.width < 0) pos.x += img.width;
  if (pos.x >= img.width) pos.x -= img.width;
}

void changeSpeed() {
  float acc = .25;
  if (mouseButton == LEFT) vel_rail.x = constrain(vel_rail.x-acc, 0, 60);
  if (mouseButton == RIGHT) vel_rail.x = constrain(vel_rail.x+acc, 0, 60);
  vel_mts.x = vel_rail.x/40;
  vel_sky.x = vel_mts.x/4;
}

