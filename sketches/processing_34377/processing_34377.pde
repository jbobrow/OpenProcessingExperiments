
import processing.opengl.*;
import java.awt.Robot;
import java.awt.AWTException;
import damkjer.ocd.*;
import java.awt.*;

PGraphics hud;
Camera cam;
float x, y;
boolean up=false, down=false, left=false, right=false;
Gun gun1;
float[][] terrain;
PImage tile0, tile1, tile2, tile3, tile4;
PImage[][] tiles;
float stepLength = 1.5;
float playerHeight = -20;
float enemyRadius = 5;
float panAmt = .03;
int prevMouseX = mouseX;
int prevMouseY = mouseY;
Robot r;
ArrayList bullets;
ArrayList enemies;
PVector speed;
PVector accel;
boolean jump; 

void setup() {
  size(500, 500, OPENGL); 
  try { 
    r = new Robot();
  } 
  catch(AWTException e) {
    e.printStackTrace();
  }
  Point p = frame.getLocationOnScreen();
  r.mouseMove(int(p.x + width/2 + (mouseX - width/2) / 40.0), int(p.y + height/2 + (mouseY - height/2) / 40.0));
  smooth();
  tile0 = createImage(16, 16, RGB);
  tile1 = createImage(16, 16, RGB);
  tile2 = createImage(16, 16, RGB);
  tile3 = createImage(16, 16, RGB);
  tile4 = createImage(16, 16, RGB);

  //  tile0 = loadImage("tile0.png");
  //  tile1 = loadImage("tile1.png");
  //  tile2 = loadImage("tile2.png");
  //  tile3 = loadImage("tile3.png");
  //  tile4 = loadImage("tile4.png");
  makeTileSet();
  float noiser = 0.0;
  bullets = new ArrayList();
  cam = new Camera(this, 0, -10, 10, width/2, -10, height/2, 1000, 1);
  float[] pos = cam.position();
  float[] tar = cam.target();
  gun1 = new Gun(pos[0], pos[1], pos[2], tar[0], tar[1], tar[2], cam);
  hud = createGraphics(width, height, JAVA2D);
  terrain = new float[width / 10][height / 10];
  tiles = new PImage[terrain.length][terrain[0].length];
  speed = new PVector(0, 0, 0);
  accel = new PVector(0, .5, 0);
  bullets.add(gun1.shoot());
  for (x=0;x<terrain.length;x++)
  {
    for (y=0;y<terrain[int(x)].length;y++)
    {
      noiser += random(0, 1);
      terrain[int(x)][int(y)] = 10 * noise(noiser, noiser);
      tiles[int(x)][int(y)] = getRandomTile();
    }
  }
  enemies = new ArrayList();
  for (int i = 0; i< 10; i++)
  {
    float tx = random(width);
    float tz = random(height);
    enemies.add(new Enemy(tx, terrain[int(tx/10)][int(tz/10)] - 30, tz, enemyRadius));
  }

  noFill();
  hud.beginDraw();
  hud.background(129);
  hud.ellipse(width/2 - 10, height/2 - 10, 20, 20);
  hud.endDraw();

  noStroke();
  lights();
  noCursor();
}
void draw()
{
  background(100, 200, 200);
  float[] pos = cam.position();
  float[] tar = cam.target();
  float[] att = cam.attitude();
  gun1.display(pos[0], pos[1], pos[2], tar[0], tar[1], tar[2], cam.attitude());
  float angle = att[0] + PI;
  // println(frameRate +"       "+ bullets.size() + " bullets" + "    " + speed.y);
  cam.pan((mouseX - width/2) / 700.0);
  println(frameRate);
  cam.tilt((mouseY - height/2)/700.0);
  Point p = frame.getLocationOnScreen();
  r.mouseMove(int(p.x + width/2), int(p.y + height/2 + this.getY()));

  //if (up) cam.jump(pos[0] + stepLength * cos(angle),pos[1],pos[2] + stepLength * sin(angle));
  if (up) cam.dolly(-stepLength);
  if (down) cam.dolly(stepLength);
  if (left) cam.truck(-stepLength);
  if (right) cam.truck(stepLength);
  speed.add(accel);
  pos = cam.position();
  if (jump && pos[1] < terrain[int(pos[0]/10)][int(pos[2]/10)] + 2 * playerHeight / 3) {
    cam.boom(speed.y);
  }
  else jump = false;
  att = cam.attitude();

  if ( att[1] < -1.0 * PI / 2.2) cam.tilt(att[1] + PI/2.2);
  pos = cam.position();
  if (pos[0] > width) cam.jump(width - 1, pos[1], pos[2]);
  pos = cam.position();
  if (pos[0] < 0) cam.jump(1, pos[1], pos[2]);
  pos = cam.position();
  if (pos[2] > width) cam.jump(pos[0], pos[1], width- 1);
  pos = cam.position();
  if (pos[2] < 0) cam.jump(pos[0], pos[1], 1);
  pos = cam.position();
  int camx = int(pos[0]) / 10;
  int camy = int(pos[1]) / 10;
  int camz = int(pos[2]) / 10;
  //print(camx + "   " + camy + "   " + camz + "         ");
  //  float avg = terrain[camx][camz] + terrain[camx+1][camz] + terrain[camx+1][camz+1] + terrain[camx][camz+1];
  //  avg = avg / 4;
  //  float py1 = sqrt(pow(pos[0] - camx, 2) + pow(pos[2] - camz, 2));
  //  float py2 = sqrt(pow(pos[0] - camx + 1, 2) + pow(pos[2] - camz, 2));
  //  float py3 = sqrt(pow(pos[0] - camx + 1, 2) + pow(pos[2] - camz +1, 2));
  //  float py4 = sqrt(pow(pos[0] - camx, 2) + pow(pos[2] - camz + 1, 2));
  //
  //  float[] arr = { 
  //    py1, py2, py3, py4
  //  };
  //  cam.jump(pos[0], min(arr) * (pos[1] - avg), pos[2]);
  pos = cam.position();
  if (pos[0] > width) cam.jump(width - 1, pos[1], pos[2]);
  pos = cam.position();
  if (pos[0] < 0) cam.jump(1, pos[1], pos[2]);
  pos = cam.position();
  if (pos[2] > width) cam.jump(pos[0], pos[1], width- 1);
  pos = cam.position();
  if (pos[2] < 0) cam.jump(pos[0], pos[1], 1);
  pos = cam.position();
  //cam.jump(pos[0], terrain[int(pos[0]/10)][int(pos[2]/10)] + playerHeight, pos[2]);
  if (!jump)cam.boom((terrain[int(pos[0]/10)][int(pos[2]/10)] - (pos[1] - playerHeight))/5);
  pos = cam.position();
  //println(terrain[int(pos[0]/10)][int(pos[2]/10)] + playerHeight + "    " + pos[2]);
  pos = cam.position();
  //float[] aimer = cam.target();
  //cam.aim(aimer[0], min(arr) * (pos[1] - avg), aimer[2]);
  //cam.aim(aimer[0], pos[1], aimer[2]);
  fill(255);
  for (int i = 0; i < terrain.length; i++)
  {
    for (int j = 0; j < terrain[i].length; j++)
    {
      if (i<terrain.length-1 && j < terrain[i].length-1)
      {
        textureMode(NORMALIZED);
        beginShape(QUADS);
        texture(tiles[i][j]);
        vertex(i*10, terrain[i][j], j*10, 0, 0);
        vertex((i+1)*10, terrain[i+1][j], j*10, 1, 0);
        vertex((i+1)*10, terrain[i+1][j+1], (j+1)*10, 1, 1);
        vertex(i*10, terrain[i][j+1], (j+1)*10, 0, 1);
        endShape();
      }
    }
  }
  for (int i = 0;i<enemies.size();i++) {
    Enemy e = (Enemy)enemies.get(i);
    e.display(cam.position());
    for (int j = 0; j < bullets.size(); j++) {
      Bullet b = (Bullet)bullets.get(j);
      PVector pv=b.getLocation();
      PVector tv=e.getLocation();
      float x = pv.x - tv.x;
      float y = pv.y - tv.y;
      float z = pv.z - tv.z;
      if (sqrt(x*x + y*y + z*z) < enemyRadius) {
        enemies.remove(i);
        bullets.remove(j);
      }
    }
  }
for (int i = 0;i < bullets.size(); i++) {
    Bullet b = (Bullet)bullets.get(i);
    b.display();
    PVector pv=b.getLocation();
    if (abs(pv.x) > 1000 || abs(pv.y) > 1000 || abs(pv.z) > 1000 || pv.y >10) bullets.remove(i);
  }
  hint(DISABLE_DEPTH_TEST);
  camera();
  noFill();
  smooth();
  stroke(100);
  strokeWeight(2);
  ellipse(width/2, height/2, 20, 20);
  line(width/2, height/2-15, width/2, height/2+15);
  line(width/2-15, height/2, width/2+15, height/2);
  noStroke();
  
  cam.feed();
}

void mousePressed()
{
  float[] tpos = cam.position();
  float[] tar = cam.target();

  // Bullet(float X, float Y, float Z, float xtar,float ytar, float ztar) {
  bullets.add(gun1.shoot());
}

void keyTyped()
{
  switch(key)
  {
    case('w'):
    up = true;
    break;

    case('s'):
    down = true;
    break;

    case('a'):
    left = true;
    break;

    case('d'):
    right = true;
    break;

    case('c'):
    playerHeight = -5;
    break;

    case(32):

    if (!jump) {
      jump = true;
      float[] ppos = cam.position();
      speed = new PVector(0, -4, 0);
    }
    break;
  }
}

void keyReleased()
{
  switch(key)
  {
    case('w'):
    up = false;
    break;

    case('s'):
    down = false;
    break;

    case('a'):
    left = false;
    break;

    case('d'):
    right = false;
    break;

    case('c'):
    playerHeight = -10;
    break;
  }
}

PImage getRandomTile()
{
  switch(int(random(0, 5))) {
  case 0: 
    return tile0;
  case 1: 
    return tile1;
  case 2: 
    return tile2;
  case 3: 
    return tile3;
  default : 
    return tile4;
  }
}
void makeTileSet()
{
  tile0.loadPixels();
  tile1.loadPixels();
  tile2.loadPixels();
  tile3.loadPixels();
  tile4.loadPixels();
  for (int i = 0; i < tile0.pixels.length; i++)
  {
    tile0.pixels[i] = color(0, random(50, 250), 0);
    tile1.pixels[i] = color(0, random(50, 250), 0);
    tile2.pixels[i] = color(0, random(50, 250), 0);
    tile3.pixels[i] = color(0, random(50, 250), 0);
    tile4.pixels[i] = color(0, random(50, 250), 0);
  }
  tile0.updatePixels();
  tile1.updatePixels();
  tile2.updatePixels();
  tile3.updatePixels();
  tile4.updatePixels();


  tile0.save("tile0.png");
  tile1.save("tile1.png");
  tile2.save("tile2.png");
  tile3.save("tile3.png");
  tile4.save("tile4.png");
}


