
/* @pjs preload="a.JPG"; */

int[] px;
PImage pi;
int w, h;
Boolean isBnw = true;
ArrayList<Jumper> js = new ArrayList<Jumper>();
MyColor myCol = new MyColor();

void setup() {
  size(630, 506, P2D); 
  background(40); 
  noStroke();

  pi = loadImage("a.JPG");
  w = pi.width;
  h = pi.height;
  px = new int[w*h];
  pi.loadPixels();
  arrayCopy(pi.pixels, px);
  pi.updatePixels();
}

void draw() {
  myCol.update();
  
  if (mousePressed && (mouseY != pmouseY)) {
    js.add(new Jumper(mouseX, constrain(mouseY, 0, height), -1));//goes to left
    js.add(new Jumper(mouseX, constrain(mouseY, 0, height), 1));//goes to right
  }

  for (int i = js.size ()-1; i > -1; i--) {
    Jumper j = js.get(i);
    if (j.update()) {
      js.remove(i);
    } else if (j.update()) {
      js.remove(i);
    }
  }
}

void keyPressed() {
  if (key == 'b') {
    isBnw = !isBnw;
  } else {
    background(40);
    js = new ArrayList<Jumper>();
  }
}

class Jumper
{
  final static float xSpeed = 3;
  float x, y, dir, yo, xprev, yprev;
  final static float rad = 7;
  float theta = random(TWO_PI);
  float h = rad;//wave height
  float thetaSpeed = random(.5, .8);
  color frontCol;

  Jumper(float p_x, float p_y, float p_dir) {
    x = xprev = p_x;
    y = yprev = yo = p_y;
    dir = p_dir;
    frontCol = color(myCol.R, myCol.G, myCol.B);
  }

  Boolean update() {
    x += dir * xSpeed;
    Boolean isOut = x < 0 || x > width;
    if (!isOut) {          
      y = yo + h*abs(cos(theta += thetaSpeed));
      int col = px[(int)x + (int)yo * w];
      if (isBnw) {
        fill(.2126*red(col) + .7152*green(col) + .0722*blue(col));
      } else {        
        fill(col);
      }
//      stroke(255);
      ellipse(xprev, yprev, rad, rad);
      
//      noStroke();
      fill(frontCol);  
      ellipse(x, y, .9*rad, .9*rad);     
    }
    
    xprev = x;
    yprev = y;
    
    return isOut;
  }
}

class MyColor
{
  public float R, G, B;
  float Rspeed, Gspeed, Bspeed;
  final static float minSpeed = 2;
  final static float maxSpeed = 3.9;
  
  MyColor()
  {
    R = random(255);
    G = random(255);
    B = random(255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
  
  public void update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
}



