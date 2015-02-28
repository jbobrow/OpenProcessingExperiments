
Circles [] cir;
int mode= 0;

void setup ()
{
  size (700, 450, P2D);
  smooth();

  frameRate (30);
  colorMode (HSB, 360, 100, 100);
  background (0, 0, 100);
  cir = new Circles [25];

  for (int i = 0; i < cir.length; i++)
  {
    int dir = (int) random (2);
    int centerX = (int) random (width);
    int centerY = (int) random (height);
    int c = color (random (160), random (80, 90), random (80, 90), 255);
    int d = (int) random (10, 60);
    float timeSpeed = 0.01;

    if (mode == 0)
    {
      int cdir = (int) random (3);
      c = color (0, 0, (cdir == 0 ? 100 : 0), (cdir == 2 ? 80 : 255));
      d = (int) random (1, 5);
      timeSpeed = random (0.01, 0.4);
    }
    else if (mode == 2) {
      centerX = width/2;
      centerY = height/2;
      c = color (random (150, 360), random (80, 90), random (80, 90), 255);
    }
    cir [i] = new Circles ((int) random (10, 70), centerX, centerY, c, (int) (2.0*dist (centerX < width/2 ? 0 : width, centerY < height/2 ? 0 : height, centerX, centerY)), d, dir, timeSpeed);
  }
}

void draw ()
{
  if (mode != 0) background (0, 0, 100);
  for (int i = 0; i < cir.length; i++)
  {
    cir[i].display();
    cir[i].move();
    if (mode == 0) cir[i].moveCenter();
  }
}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    mode++;
    if (mode > 2) mode = 0;
    setup();
  }
  else {
    setup();
  }
}

class Circles 
{
  private float [] angle, dia, ellD, weighting;
  private int n, posX, posY, c, d, startD, noiseSeedNum, ellipseD, dir, centerDirX, centerDirY;
  private float time = 0, speed, centerSpeed, timeSpeed;

  Circles (int n, int posX, int posY, int c, int d, int ellipseD, int dir, float timeSpeed)
  {
    this.timeSpeed = timeSpeed;
    if (dir == 0) {
      this.dir = 1;
      this.centerDirX =  this.centerDirY = 1;
    }
    else {
      this.dir = -1;
      this.centerDirX = this.centerDirY= -1;
    }
    this.ellipseD = ellipseD;
    speed = random (0.5, 3);
    noiseSeedNum = (int) random (1000);
    startD = (int) random (10, d/3);
    this.n = n;
    this.d = d;
    this.posX = posX;
    this.posY = posY;
    this.c = c;
    centerSpeed = random (.75, 2);

    init();
  }

  private void init ()
  {
    angle = new float [n];
    dia = new float [n];
    ellD = new float [n];
    weighting = new float [n];
    float steps = 360.0 / (float) n;
    float diaSteps = ((float) d/2 - (float) startD) / (float) n;
    float startAngle = random ( 360);
    float dSteps = ((float) ellipseD - 1.0) / n;

    for (int i = 0; i < n; i++) {
      angle [i] = startAngle + /*(float) i */ steps * dir * random (i-0.5, i+0.5);
      dia [i] = (float) i * diaSteps;
      ellD [i] = dSteps * (float) i * random (0.5, 1.5);
    }
  }

  public void moveCenter ()
  {
    noiseSeed (noiseSeedNum);
    posX +=  noise (time/2.0)*centerSpeed*centerDirX;
    posY +=  noise (time/2.0)*centerSpeed*centerDirY;

    if (posX > width) {
      posX = width;
      centerDirX*= -1;
    }

    if (posY > height) {
      posY = height;
      centerDirY*= -1;
    }

    if (posX < 0) {
      posX = 0;
      centerDirX*= -1;
    }

    if (posY < 0) {
      posY = 0;
      centerDirY*= -1;
    }

    d = (int) (2.0*dist (posX < width/2 ? 0 : width, posY < height/2 ? 0 : height, posX, posY));
    float diaSteps = ((float) d/2 - (float) startD) / (float) n;
    for (int i = 0; i < n; i++) dia [i] = (float) i * diaSteps;
  }

  public void move ()
  {
    noiseSeed (noiseSeedNum);
    float speed_ = noise (time) * speed;

    for (int i = 0; i < n; i++) angle [i] += speed_*dir;
    time+= timeSpeed;
  }

  public void display ()
  {
    fill (c);
    noStroke ();
    float x, y;
    for (int i = 0; i <n; i++)
    {
      x = posX + cos (radians (angle [i])) * (dia[i] + startD); 
      y = posY + sin (radians (angle [i])) * (dia[i] + startD); 

      ellipse (x, y, ellD [i] + 1, ellD [i] + 1);
    }
  }
}

