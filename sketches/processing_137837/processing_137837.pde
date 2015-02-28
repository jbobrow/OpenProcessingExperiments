
//  The intent of this project is to generate approximations to those images
//    in various ways, using mouse and keyboard input to control what happens
//
//  The images in this final project are paintings I made the last few years
//
//  Click mouse or keyboard to start, keep mouse pressed for more details,
//  click to show the actual image, click again to restart
//  1-5  select the images
//  Change mode:
//  'b'  blocks
//  'h'  horizontal lines
//  'v'  vertical lines
//  'e'  filled ellipses
//  'o'  outline ellipses
//  't'  text characters
//  General commands:
//  's'  saves screenshot in 'image.png'
//  'q'  end
//

/*
  @pjs preload="Portrait.jpg,GirlWithPearlEarrings.jpg,Lava.jpg,Stockholm.jpg,Summer.jpg";
*/

//  State model is:
//  Start 0: blank screen; on mouseClicked to state 1
//  State 1: drawing colored blocks; on mouseClicked to state 2
//  State 2: show image; on mouseClicked to state 3
//  State 3: reset to black and immediately to state 1
//  State 4: end
int  state = 0;

int  mode = 'b';
char[] modeChars = { 'b', 'h', 'v', 'e', 'o', 't' };
int  block = 30;

color  bgColor = #1f1f1f;

PImage[]  images = new PImage[5];
String[]  captions = new String[5];
color  capColor = #efefef; 
int    curImage = 0;
int    imOffset;
char[] chars = {'a','b','c','d','e','f','g','h','i','j','k','l','m',
                'n','o','p','q','r','s','t','u','v','w','x','y','z'};

int  framePressed;  //  at what frame was latest mouse press initiated?

int  sw = 3;  //  stroke weight

void setup()
{
  size(900, 600);
  background(bgColor);
  images[0] = loadImage("Portrait.jpg");
  images[1] = loadImage("Lava.jpg");
  images[2] = loadImage("GirlWithPearlEarrings.jpg");
  images[3] = loadImage("Summer.jpg");
  images[4] = loadImage("Stockholm.jpg");
  captions[0] = "Portrait (2014)";
  captions[1] = "Lava (2012)";
  captions[2] = "Girl With Pearl Earrings (after Vermeer) 2013";
  captions[3] = "Summer (2009)";
  captions[4] = "Stockholm (2013)";
  setImage(0);
  strokeWeight(sw);
}

void setImage(int n)
{
  curImage = n;
  imOffset = (width - images[n].width) / 2;
}

void draw()
{
  switch(state)
  {
    case 0:  //  blank canvas
      break;
    case 1:  //  draw image impression
      drawRegion(0, 0, width, height);
      break;
    case 2:  //  draw image & caption
      fill(bgColor);
      noStroke();
      rect(0, 0, width, height);
      image(images[curImage], imOffset, 0);
      fill(capColor);
      textSize(20);
      textAlign(CENTER);
      text(captions[curImage], width/2, height - 30);
      break;
    case 3: //  erase
      fill(bgColor);
      noStroke();
      rect(0, 0, width, height);
      state = 1;
      break;
    case 4:
      noLoop();
      break;
  }
}

//  JavaScript does not handle click correctly, therefore
//    do it ourselves

//  In mousePressed keep coordinates
int mXPressed, mYPressed;
void mousePressed()
{
  mXPressed = mouseX;
  mYPressed = mouseY;
  framePressed = frameCount;
}

//  In mouseReleased, determine click when both:
//  -  Allow 10 frames since mousePressed, and
//  -  Allow 3 pixels moved in any direction
void mouseReleased()
{
  if ((frameCount - framePressed < 10) &&
      (abs(mouseX - mXPressed) + abs(mouseY - mYPressed) < 3))
  {
    if (state == 0)
      state = 1;
    else if (state == 1)
      state = 2;
    else if (state == 2)
      state = 3;
  }
}

void keyTyped()
{
  if (state == 0)
    state = 1;
  else if (key >= '1' && key <= '5')
  {
    setImage(key - '1');
    state = 3;
  }
  else if (key == 'b' || key == 'h' || key == 'v' ||
           key == 'e' || key == 'o' || key == 't' || key == 'r')
  {
    mode = key;
    state = 3;
  }
  else if (key == 's' || key == 'S')
    saveFrame("image.png");
  else if (key == 'q' || key == 'q')
    state = 4;
}

void drawRegion(float x, float y, float w, float h)
{
  //  The nominal size is determined here:
  int  nomSize = 50;
  if (mousePressed)
  {
    nomSize -= constrain((frameCount-framePressed)*0.2, 0, 46);
  }
  //  Draw shapes, until fixed amount of pixels are drawn
  double  surface = 0.0;
  while (surface < 5000)
  {
    //  point to draw
    float xx = random(x, x+w);
    float yy = random(y, y+h);
    //color to use is either bg or image pixel 
    color col;
    if (xx < imOffset || xx >= width - imOffset)
      col = bgColor;
    else
      col = images[curImage].get(int(xx-imOffset), int(yy));
    col += 0x80000000;  // transparency
    //  size is small when mouse is pressed, large when not
    float size = random(nomSize*0.8, nomSize*1.2);
    //  if random mode, determine next primitive to draw
    int m = mode;
    if (mode == 'r')  //  random mode
    {
      m = modeChars[int(random(6))];
    }
    //  draw the graphics primitive
    surface += drawPrimitive(m, col, xx, yy, size, size);
  }
}

double  drawPrimitive(int m, color col, float x, float y, float sx, float sy)
{
  double surface = sx * sy;
  switch (m)
  {
    case 'b':  //  block
      noStroke();
      fill(col);
      rect(x - sx/2, y - sy/2, sx, sy);
      break;
    case 'e':  //  filled ellipse
      noStroke();
      fill(col);
      ellipse(x - sx/2, y - sy/2, sx, sy);
      break;
    case 'h':  //  horizontal line
      stroke(col);
      noFill();
      line(x - sx/2, y, x + sx/2, y);
      surface = sx * sw;
      break;
    case 'v':  //  vertical line
      stroke(col);
      noFill();
      line(x, y - sy/2, x, y + sy/2);
      surface = sy * sw;
      break;
    case 'o':  //  outline of ellipse
      stroke(col);
      noFill();
      ellipse(x - sx/2, y - sy/2, sx, sy);
      surface = HALF_PI * (sx+sy) * sw;
      break;
    case 't':  //  text character
      noStroke();
      fill(col);
      textAlign(CENTER, CENTER);
      textSize(int(sy));
      int c = int(random(26));
      text(chars[c], x, y);
      surface = sy * sw;
      break;
  }
  return surface;
}



