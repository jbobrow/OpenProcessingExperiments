
final int nb = 150;
ArrayList<Circle> circles = new ArrayList<Circle>();
int[] cols = new int[nb];
MyColor c = new MyColor();
float rad;
Boolean move = true, doFill = true;

void setup()
{
  size(550, 450, OPENGL);
  stroke(220, 50);
  rad = min(width, height)/1.4;
  for (int i = 0; i < nb; i ++)
  {
    circles.add(new Circle());
    cols[i] = 0;
  }
}

void draw()
{
  translate(width/2, height/2);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  background(50); 
  noFill();

  cols[0] = c.update();
  for (int i = nb-1; i >= 0; i--)
  {
    if (i != 0) cols[i] = cols[i-1];
    stroke(cols[i], 50);
    if(doFill) fill(cols[i], 30);
    circles.get(i).display();
  }
}

void keyPressed()
{
  if (key == 'm') move = !move; 
  if (key == 'f') doFill = !doFill;
}

class Circle
{
  PVector speed, r;
  
  Circle()
  {
    speed = new PVector(random(-.002,.002), random(-.002,.002),random(-.002,.002));
    r = new PVector(random(TWO_PI), random(TWO_PI),random(TWO_PI));
  }
  
  void display()
  {
    if(move) r.add(speed);    
    rotateX(r.x);
    rotateY(r.y);
    rotateZ(r.z);    
    ellipse(0, 0, rad, rad);
  }
}

class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .3, maxSpeed = .7;

  MyColor()
  {
    R = random(255);
    G = random(255);
    B = random(255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }

  public color update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 30)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 30)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 30)) ? -Bspeed : Bspeed;
    return color(R, G, B);
  }
}



