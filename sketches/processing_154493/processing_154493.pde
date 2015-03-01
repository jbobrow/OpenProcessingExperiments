
public PGraphics pg;
final int nbPartsPerLetter = 180;
final color textCol = color(255, 0, 0);
final int MARGIN = 30;
final int STILL = 0;
final int MOUSE = 1;
final int BOMB  = 2;
private int mode = STILL;
private String word = "hello you";
private Particle[] parts;
private int nbParts;

void setup()
{
  size(550, 400, P2D);
  process(word);
}

void process(String p_word)
{
  nbParts = nbPartsPerLetter * p_word.length();
  parts = new Particle[nbParts];
  pg = createGraphics(width, height);
  pg.beginShape();
  pg.textSize(72);
  pg.fill(textCol);
  pg.text(p_word, MARGIN + 75, MARGIN + 100, width - MARGIN - 150, height - MARGIN - 100);
  pg.endShape();

  pg.loadPixels();
  for (int i = 0; i < nbParts; i ++)
  {
    parts[i] = new Particle();
  }
  pg.updatePixels();
}

void draw()
{
  fill(140, 400);
  stroke(20, 255);  
  rect(MARGIN - 4, MARGIN - 4, width-2*MARGIN+8, height-2*MARGIN+8); 
  
  stroke(0, 30);
  for (int i = 0; i < nbParts; i ++)
  {
    parts[i].update(mode);
    parts[i].draw();
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    mode = MOUSE;
  } else if (mouseButton == RIGHT)
  {
    for (int i = 0; i < nbParts; i ++)
    {
      parts[i].update(BOMB);
    }
  }
}

void mouseReleased()
{
  mode = STILL;
}

void keyPressed()
{
  if (key != CODED)
  {
    word += new String(key);
    if (word.length() > 9)
    {
      word = word.substring(1);
    }
    process(word);
  }
}

class Particle
{
  private final static float FRICTION1 = .98;
  private final static float G1 = .05;
  private final static float CALM1 = .92;
  private final static float FRICTION2 = .98;
  private final static float G2 = 4;
  private final static float CALM2 = .96;
  private final float MASS = random(4, 9);
  private final color col = color(random(140, 230), random(50, 120), random(34, 76));
  private final float rad = random(2, 6);
  private PVector pos;
  private PVector speed;
  private PVector origin;
  private Boolean found = false;
  
  Particle()
  {
    speed = new PVector(0, 0);
    while (!found)
    {
      int x = (int)random(width);
      int y = (int)random(height);
      if (pg.pixels[y * width + x] == textCol)
      {
        pos = new PVector(x, y);
        origin = pos.get();
        found = true;
      }
    }
  }

  void update(int p_mode)
  {
    PVector target;
    float l;
    switch(p_mode)
    {
    case MOUSE:
      target = new PVector(mouseX, mouseY);
      target.sub(pos);
      l = target.mag() < 60 ? 500 : target.mag();
      target.normalize();
      target.mult(FRICTION2 * G2 * MASS / (sqrt(l)));
      speed.add(target);
      speed.mult(CALM2);
      break;
    case STILL:
      target = origin.get();
      target.sub(pos);
      target.limit(10);
      target.mult(FRICTION1 * G1 * MASS);
      speed.add(target);
      speed.mult(CALM1);
      break;
    case BOMB:
      target = new PVector(mouseX, mouseY);
      target.sub(pos);
      target.limit(70);
      l = target.mag();
      target.mult(-40 / l);
      speed = target.get();
      break;
    }
  }

  void draw()
  {
    pos.add(speed);
    if (pos.x < MARGIN)
    {
      pos.x = MARGIN;
      speed.x *= -1;
    } else if (pos.x > width - MARGIN)
    {
      pos.x = width - MARGIN;
      speed.x *= -1;
    }
    if (pos.y < MARGIN)
    {
      pos.y = MARGIN;
      speed.y *= -1;
    } else if (pos.y > height - MARGIN)
    {
      pos.y = height - MARGIN;
      speed.y *= -1;
    }
    fill(col, 255);
    ellipse(pos.x, pos.y, rad, rad);
  }
}

