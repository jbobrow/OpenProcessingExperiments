
TextGraphics tg;
PVector root = new PVector(random(1234), random(1234), random(1234));//noise root
float l = 10, //tiles size
sz = random(.01), //noise z speed
o, //mouse mapping
h = 220, //noise amplitude height
z = 100;//noise zoom level
Boolean displayLines = true, fillUp = true, fullRender = true, lettersMode = false;
String[] letters = {//alphabet letters
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
};
Boolean[][] isPresent;//tells where to draw the Perlin noise
Controller ctrlr = new Controller();//deals with mouse and keyboard
String letter = "$";

void setup()
{
  size(370, 590, OPENGL);
  tg = new TextGraphics();
  tg.initialize();
  textSize(1.4*l);
}

void draw()
{
  background(120);

  rotateX(.2);
  translate(0, 0, -180);
  lights();

  float n11, n12, n21, n22;//top let, top right, bottom left, bottom right

  if (displayLines) stroke(10, 55);  
  else  noStroke();
  if (!fillUp) noFill();
  if (!lettersMode) beginShape(TRIANGLES);
  
  for (int j = 0; j < height; j+=l)
  {
    for (int i = 0; i < width; i+=l)
    {
      if (isPresent[int(i/l)][int(j/l)])
      {
        n11 = noise(root.x + (float)i/z, root.y + (float)j/z, root.z);
        n12 = noise(root.x + (float)i/z, root.y + (float)(j+l)/z, root.z);
        n21 = noise(root.x + (float)(i+l)/z, root.y + (float)j/z, root.z);
        n22 = noise(root.x + (float)(i+l)/z, root.y + (float)(j+l)/z, root.z);

        if (fillUp || lettersMode) fill(255*(1-n21/2), (1-n11)*255, 255*n12);

        if (!lettersMode)
        {
          vertex(i, j, h*n11);
          vertex(i, j+l, h*n12);
          vertex(i+l, j, h*n21);

          if (fullRender)
          {
            //missing triangles for a faster rendering
            vertex(i+l, j, h*n21);
            vertex(i+l, j+l, h*n22);
            vertex(i, j+l, h*n12);
          }
        } else
        {
          pushMatrix();
          translate(i, j, h*n11);
          text(letters[(int)map(n11, 0, 1, 0, 25)], 0, 0);
          popMatrix();
        }
      }
    }
  }
  if (!lettersMode) endShape();

  o = map(mouseX, 0, width, -1, 1);
  o *= abs(o) * .07;
  root.x += o;
  o = map(mouseY, 0, height, -1, 1);
  o *= abs(o) * .07;
  root.y += o;
  root.z += sz;
}

void mousePressed()
{
  ctrlr.mousePress();
}

void keyPressed()
{
  ctrlr.keyPress();
}

class Controller
{
  void mousePress()
  {
    root = new PVector(random(1234), random(1234), random(1234));//reset noise root
    sz = random(.01);//reset noise z speed
    z = 100;//reset zoom level
  }

  void keyPress()
  {
    if (key == CODED)
    {
      if (keyCode == LEFT || keyCode == RIGHT)
      {
        z += (keyCode == LEFT ? 1 : -1) * 10;//increase Perlin zoom
      z = constrain(z, 30, 400);
      }
      else if (keyCode == UP || keyCode == DOWN)//increase/decrease definition
      {
        l += (keyCode == UP ? 1 : -1) * 2;
        l = constrain(l, 1, 15);
        tg.initialize();
      }
    } else
    {
      switch(key)
      {
      case 's'://stroke toggle
        displayLines = !displayLines;
        if (displayLines && lettersMode) 
        {
          lettersMode = false;
          fillUp = false;
        } else if (!displayLines && !lettersMode) fillUp = true;
        break;
      case 'f'://fill toggle
        fillUp = !fillUp;
        if (lettersMode)
        {
          lettersMode = false;
          fillUp = true;
        }
        if (!lettersMode && !fillUp) displayLines = true;
        break;
      case 'z'://z noise toggle
        sz = sz == 0 ? random(.01) : 0;
        break;
      case ' '://single/double face toggle
        fullRender = !fullRender;
        break;
      case 'l'://letters toggle
        lettersMode = !lettersMode;
        if (lettersMode) fillUp = false;
        else fillUp = true;
        displayLines = false;
        break;
      default://char input
        //tg.process("" + key);//RUN IN JAVA
        tg.process(new String(key));//RUN IN JS
        break;
      }
    }
  }
}

class TextGraphics
{  
  PGraphics pg;//buffer PG used to write the input char

  TextGraphics()
  {
    pg = createGraphics(width, height, P2D);
  }

  void initialize()
  {    
    process(letter);//initialize with a char
  }
  
  void process(String c)
  {
    letter = c;
    pg.beginDraw();
    pg.translate(0, height/1.6);
    pg.background(0);
    pg.textSize(500);
    pg.fill(color(0, 255, 0));
    pg.text(letter, 30, 30);
    pg.translate(0, -height/1.6);
    pg.endDraw();
    
    isPresent = new Boolean[ceil(width/l)][ceil(height/l)];
    pg.loadPixels();
    for (int i = 0; i < width; i+=l)
    {
      for (int j = 0; j < height; j+=l)
      {        
        isPresent[int(i/l)][int(j/l)] = green(pg.pixels[j * width + i]) > 100;
      }
    }
    pg.updatePixels();
  }
}
