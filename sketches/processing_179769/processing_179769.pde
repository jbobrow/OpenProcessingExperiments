
TextGraphics tg;
PVector root = new PVector(random(1234), random(1234), random(1234)), //noise root
nSpeed = new PVector(random(-.02, .02), random(-.02, .02), random(-.02, .02));//noise speed;
ArrayList<Particle> particles = new ArrayList<Particle>();
int nbParticle = 2000;
int[] pgpx;//PGraphics' pixels array
float zoom = 100;//noise zoom level
Boolean noiseOn = true, hitMode = true;


void setup()
{
  size(250, 330, P3D);
  tg = new TextGraphics();
  strokeWeight(2);
}

void draw()
{ 
  background(35);
  lights();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, PI, -PI));

  for (int i = 0; i < nbParticle; i++)
  {
    Particle p = particles.get(i);
    p.update();
  }
  root.add(nSpeed);//update noise
}

void createParticles()
{
  particles = new ArrayList<Particle>();
  //random particle disposition 
  while (particles.size () < nbParticle)
  {
    Particle p = new Particle(particles.size ());
    particles.add(p);
  }
}

void mousePressed()
{
  root = new PVector(random(1234), random(1234));//reset noise root
  nSpeed = new PVector(random(-.02, .02), random(-.02, .02));//reset noise speed
}

void keyPressed()
{
  if (key == CODED && (keyCode == LEFT || keyCode == RIGHT))
  {
    zoom += (keyCode == LEFT ? 1 : -1) * 80;//modify Perlin zoom
    zoom = constrain(zoom, 30, 400);
  } else if (key != CODED)
  {
    switch(key)
    {
    case 'n'://noise toggle
      noiseOn = !noiseOn;
      break;
   case 'h'://hit toggle
      hitMode = !hitMode;
      if (!hitMode)
        for (Particle p : particles)
        {
          p.speed.mult(-1);
        }
      break;
    case ' '://ignore SPACE
    case ESC://ignore ESCAPE
    case ENTER://ignore ENTER
    case BACKSPACE://ignore BACKSPACE
      break;
    default://char input
      //tg.process("" + key);//RUN IN JAVA
      tg.process(new String(key));//RUN IN JS
      break;
    }
  }
}

class Particle
{
  final float SPEED_MIN = .12, SPEED_MAX = .25, h = 40;
  PVector pos, origin, speed;
  int rank, col = color(random(128, 255), random(128, 205), 90, 120);
  float n, nz;//noise
  Boolean stuck = false;//against a wall

  Particle(int p_rank)
  {
    rank = p_rank;
    init();
  }

  void init()
  {
    stuck = false;
    float theta = random(TWO_PI);
    speed = new PVector(cos(theta), sin(theta), -cos(theta));
    speed.mult(random(SPEED_MIN, SPEED_MAX) * (random(1)<0?1:-1));
    Boolean done = false;
    while (!done)
    {
      pos = new PVector(random(width), random(height));
      if (green(pgpx[(int)pos.y * width + (int)pos.x]) > 100)
      {
        pos.z = random(-h/2, h/2);
        origin = pos.get();
        done = true;
      }
    }
  }

  void update()
  {
    if (noiseOn && !stuck)
    {
      n = noise(root.x + pos.x/zoom, root.y + pos.y/zoom, root.z + pos.z/zoom)*2*TWO_PI;
      nz = noise(root.x/10 + pos.x/zoom, root.y + pos.y/zoom, root.z + pos.z/zoom)*2*TWO_PI;
      speed.set(cos(n), sin(n), -cos(nz));
      speed.mult(SPEED_MAX);
    }

    if (!(stuck && hitMode))
      pos.add(speed);

    if (green(pgpx[(int)pos.y * width + (int)pos.x]) < 100)//particle outside the letter
    {
      stuck = hitMode;
      pos.sub(speed);
      if (!hitMode)
      {
        if (noiseOn)
        { 
          pos = origin.get();
        } else
        {      
          speed.x *= -1;
          speed.y *= -1;
        }
      }
    }
    if (pos.z > h/2 || pos.z < -h/2)
    {
      stuck = hitMode;
      pos.z = constrain(pos.z, -h/2, h/2);
      if (!hitMode)
      {
        if (noiseOn)
        {
          pos = origin.get();
        } else
        {
          speed.z *= -1;
        }
      }
    }
    
    stroke(map(pos.z, -h/2, h/2, 128, 255), map(pos.z, -h/2, h/2, 128, 205), 90, 120);
    point(pos.x-width/2, pos.y-height/2, pos.z);
  }
}

class TextGraphics
{  
  PGraphics pg;//buffer PG used to write the input char

  TextGraphics()
  {
    pg = createGraphics(width, height, P2D);
    process(new String("s"));//"Ï�")//initialize with a String
  }

  void process(String c)
  {
    pg.beginDraw();
    pg.translate(-width/2, -height/1.7);
    pg.background(0);
    pg.textSize(250);//500
    pg.fill(color(0, 255, 0));
    pg.textAlign(CENTER, CENTER);
    pg.text(c, width, height);
    pg.translate(width/2, height/1.7);
    pg.endDraw();

    pgpx = new int[width * height];
    pg.loadPixels();
    arrayCopy(pg.pixels, pgpx);
    pg.updatePixels();

    createParticles();
  }
}



