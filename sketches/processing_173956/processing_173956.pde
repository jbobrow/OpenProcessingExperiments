
TextGraphics tg;
PVector root = new PVector(random(1234), random(1234), random(1234)), //noise root
nSpeed = new PVector(random(-.02, .02), random(-.02, .02));//noise speed;
float z = 100;//noise zoom level
ArrayList<Hair> hair;
int nbHair = 5000;

void setup()
{
  size(390, 590, P2D);
  tg = new TextGraphics();
  stroke(20, 10);  
  strokeWeight(1.5);
  noFill();
}

void draw()
{
  background(210);
  for (Hair h : hair)
  {
    h.update();
  }
  root.add(nSpeed);//update noise
}

void mousePressed()
{
  root = new PVector(random(1234), random(1234));//reset noise root
  z = random(30, 400);//reset zoom level
  nSpeed = new PVector(random(-.02, .02), random(-.02, .02));//reset noise speed
}

void keyPressed()
{
  if (key == CODED && (keyCode == LEFT || keyCode == RIGHT))
  {
    z += (keyCode == LEFT ? 1 : -1) * 80;//modify Perlin zoom
    z = constrain(z, 30, 400);
  } else if (key != CODED)
  {
    switch(key)
    {
    case 'n'://noise toggle
      if (nSpeed.x == 0) nSpeed = new PVector(random(-.02, .02), random(-.02, .02));
      else nSpeed.set(0, 0);
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

class Hair
{
  int nbSegments = 1;//(int)random(4, 8);
  float sgmentsLength = random(5, 10);
  PVector pos;
  float[] angles = new float[nbSegments];

  Hair(PVector p_pos)
  {
    pos = p_pos.get();
  }

  void update()
  {
    PVector curr, prev = pos.get();
    float n, tetha, det;
    //    beginShape();//LINES LINE_STRIP
    //    vertex(prev.x, prev.y);
    for (int i = 0; i < nbSegments; i++)
    {
      det = -abs((pmouseX - mouseX) * (mouseY - prev.y) - (pmouseY - mouseY) * (mouseX - prev.x));
      det /= dist(prev.x, prev.y, mouseX, mouseY);
      det /= dist(prev.x, prev.y, mouseX, mouseY);

      n = noise(root.x + prev.x/z, root.y + prev.y/z);
      n *= 2 * TWO_PI;
      n += det * 2 * TWO_PI;//mouse interaction
      tetha = angles[i] + .2 * (n - angles[i]) / (i+1);
      curr = new PVector(prev.x + sgmentsLength*cos(tetha), prev.y + sgmentsLength*sin(tetha));
      //      vertex(curr.x, curr.y);
      line(prev.x, prev.y, curr.x, curr.y);
      prev = curr.get();
      angles[i] = tetha;
    }
    endShape();
  }
}

class TextGraphics
{  
  PGraphics pg;//buffer PG used to write the input char

  TextGraphics()
  {
    pg = createGraphics(width, height, P2D);
    process(new String("+"));//initialize with a String
  }

  void process(String c)
  {
    pg.beginDraw();
    pg.translate(0, height/1.6);
    pg.background(0);
    pg.textSize(350);//500
    pg.fill(color(0, 255, 0));
    pg.text(c, 30, 30);
    pg.translate(0, -height/1.6);
    pg.endDraw();

    hair = new ArrayList<Hair>();
    pg.loadPixels();

    //random hair disposition 
    while (hair.size () < nbHair)
    {
      PVector pv = new PVector(random(width), random(height));
      if (green(pg.pixels[(int)pv.y * width + (int)pv.x]) > 100)
        hair.add(new Hair(new PVector(pv.x, pv.y)));
    }
    
    pg.updatePixels();
  }
}


