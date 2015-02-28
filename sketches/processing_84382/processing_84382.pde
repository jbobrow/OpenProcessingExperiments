
import java.util.List;
import processing.opengl.*;

boolean falling;
FlowerLayer[] flowerLayers;
PImage background;

void setup() {
  size(800, 600, OPENGL);
  frameRate(30);

  colorMode(HSB, 360, 100, 100);
  noStroke();

  falling = true;

  flowerLayers = new FlowerLayer[10];
  flowerLayers[0] = new FlowerLayer(256, 16, 2);
  flowerLayers[1] = new FlowerLayer(256, 16, 0.5);
  flowerLayers[2] = new FlowerLayer(96, 32, 2);
  flowerLayers[3] = new FlowerLayer(96, 32, 0.5);
  flowerLayers[4] = new FlowerLayer(16, 48, 2);
  flowerLayers[5] = new FlowerLayer(16, 48, 0.5);
  flowerLayers[6] = new FlowerLayer(8, 64, 2);
  flowerLayers[7] = new FlowerLayer(8, 64, 0.5);
  flowerLayers[8] = new FlowerLayer(4, 128, 2);
  flowerLayers[9] = new FlowerLayer(2, 192, 4);

  background = createImage(width, height, ARGB);
  background.loadPixels();
  for (int i = 0; i < background.pixels.length; i++) {
    int gray = (int)map(i/width, height/2.0, height, 100, 40);
    background.pixels[i] = color(330, 20, gray);
  }
  background.updatePixels();
}

void draw() {  
  image(background, 0, 0);

  for (FlowerLayer flowerLayer : flowerLayers) {
    flowerLayer.draw();
  }
}

void mousePressed() {
  falling = !falling;
}
class Flower {

  private float x, y;
  private float vx, vy;
  private float size;
  private PVector[][] vertices;
  private float rad;
  private float rotateRad;
  private color c;
  private final int PETAL_NUM;
  private final float PETAL_RAD;


  Flower(float x, float y, float vx, float vy, float size,
     float rad, float rotateRad, color c) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.size = size;
    this.rad = rad;
    this.rotateRad = rotateRad;
    this.c = c;

    this.PETAL_NUM = 5;
    this.PETAL_RAD = TWO_PI / this.PETAL_NUM;

    initVertices();
  }

  void initVertices() {
    PVector[][] vertices = new PVector[PETAL_NUM][];
    float r = size / 2.0;

    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = new PVector[5];
      float rad = PETAL_RAD * i;

      vertices[i][0] = calcVertex(0.4*r, rad - PETAL_RAD/2);
      vertices[i][1] = calcVertex(0.8*r, rad - PETAL_RAD/3);
      vertices[i][2] = calcVertex(    r, rad              );
      vertices[i][3] = calcVertex(0.8*r, rad + PETAL_RAD/3);
      vertices[i][4] = calcVertex(0.4*r, rad + PETAL_RAD/2);
    }
    
    this.vertices = vertices;
  }

  PVector calcVertex(float r, float rad) {
    float rand = 0.08;

    float x = r * cos(rad);
    x += x * random(-rand, rand);

    float y = r * sin(rad);
    y += y * random(-rand, rand);

    return new PVector(x, y);
  }


  void update() {
    float vx = this.vx;
    float vy = this.vy;
    if (!falling) {
      vx = -vx;
      vy = -vy;
    }

    // flat torus
    x += vx;
    if (width+size/2 <= x)
      x = -size/2;
    else if (x < -size/2)
      x = width-1+size/2;

    y += vy;
    if (height+size/2 <= y)
      y = -size/2;
    else if (y < -size/2)
      y = height-1+size/2;


    rad += rotateRad;
  }

  void draw() {
    pushMatrix();

    translate(x, y);
    rotate(rad);

    if (falling)
      fill(gray(c));
    else
      fill(c);

    flower();

    popMatrix();
  }

  void flower() {
    beginShape();

    int i = 0;
    int j = 0;
    curveVertex(vertices[i][j].x, vertices[i][j].y);

    for (i = 0; i < vertices.length; i++)
      for (j = 0; j < vertices[i].length; j++)
    curveVertex(vertices[i][j].x, vertices[i][j].y);

    i = vertices.length - 1;
    j = vertices[i].length - 1;
    curveVertex(vertices[i][j].x, vertices[i][j].y);

    endShape(CLOSE);
  }

  color gray(color c) {
    // irresponsible algorhythm
    return color(hue(c), 0, 100-saturation(c));
  }
}
class FlowerLayer {

  private List<Flower> flowers;


  FlowerLayer(int n, float size, float fallSpeed) {
    flowers = new ArrayList<Flower>();
    for (int i = 0; i < n; i++) {
      float x = random(width);
      float y = random(height); 
      float vy = fallSpeed * random(1, 2);
      float vx = fallSpeed * random(-1, 1);
      float s = size * random(1, 1.3);
      float rad = random(TWO_PI);
      float rotateRad = random(PI/180, PI/45);
      // color c = color(random(-30, 30), random(20, 80), 100);
      color c = color(random(-45, 45), random(30, 60), 100);

      Flower flower = new Flower(x, y, vx, vy, size,
                    rad, rotateRad, c);
      flowers.add(flower);
    }
  }

  void draw() {
    for (Flower flower : flowers) {
      flower.update();
      flower.draw();
    }
  }
}


