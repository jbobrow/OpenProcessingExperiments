
String [] data;
int index = 0;
int padding;

ArrayList <Mover> m;

int xRes = 50;
int yRes = 28;
float posX;
float posY;

boolean bDisplayVectorField = false, displayParticle = true;

void setup ()
{
  size(1000, 800);
  frameRate(100);
  data = loadStrings("Tracked2DPos_CamCenter_25fps.txt");
  println(data.length);
  background(0);
  //size (800, 800);
  //  size (720, 405);
  // noSmooth();
  smooth();
  frameRate (30);

  padding = -2;
  posX = width/2;
  posY = 0;
  m = new ArrayList();

  background (#7a9686);

  for (int i = 0; i < 2500; i++) //Particle Anzahl
  {
    m.add (new Mover());
  }
}

void draw ()
{
  randomSeed (0);

  //blur(1);
  // fastblur (1);

  noStroke();
  fill (7, 15); //blur
  rect (0, 0, width, height);

  rect(0, 0, width, height);

  //background(0);
  text(data[index], 20, 20);
  index++;

  float XX = int(data[index].split(" ")[0]);
  float YY = int(data[index].split(" ")[1]);

  stroke(255);
  noFill();
  ellipse(XX/2, YY/2, 50, 50);
  println(X+" "+Y);

  // posX = lerp (posX, (mousePressed ? mouseX : noise (frameCount /340.0) * width /*noise (20+frameCount / 100.0)*1.5*/), 0.1);
  //posY = lerp (posY, mousePressed ? map (mouseY, 0, height, 0, 1) : (noise (100+frameCount / 120.0)), 0.1) ;*/
  posX = lerp (posX, (mousePressed ? XX : noise (frameCount /340.0) * width /*noise (20+frameCount / 100.0)*1.5*/), 0.1);
  posY = lerp (posY, mousePressed ? map (YY, 0, height, 0, 1) : (noise (100+frameCount / 120.0)), 0.1) ;
  if (displayParticle)
  {
    for (int i = 0; i < m.size(); i++)
    {
      m.get(i).move();
      m.get (i).setVelo (posX, posY, noise (frameCount / 300.0));
      m.get(i).checkEdges(); 

      m.get(i).display();
    }
  }
  //copy (1, 1, width, height, -1, -1, width+3, height+3);


  if (bDisplayVectorField) displayVectorField();
}

class Mover
{
  PVector location;
  PVector velo;
  float speed;

  Mover ()
  {
    location = new PVector(random(width), random(height));
    velo = new PVector(random(-1, 1), random(-1, 1));
    velo.normalize();

    speed = random (1, 3);
  }

  void setVelo (float posX, float posY, float stength)
  {

    float angle, fAngle;

    float dis;
    float mm = map (posX, 0, width, -1.5, 1.5);
    if (mm == 0) mm = 0.0001;
    float maxDis = mm*dist (0, 0, width/2, height/2);


    dis = dist (location.x, location.y, width/2, height/2);
    fAngle = map (dis, 0, maxDis, posY, 0);
    angle = map (dis, 0, maxDis, PI, 0) +  random (-PI/4*fAngle, PI/4*fAngle);

    velo.x += cos (angle)*stength;
    velo.y += sin (angle)*stength;

    velo.normalize();
  }


  void move ()
  {

    location.add (multi (velo, speed));
  }

  void checkEdges ()
  {
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height)
    {
      location.x = random (width);
      location.y = random (height);
    }
  }

  PVector multi (PVector v, float m)
  {
    return new PVector (v.x*m, v.y*m);
  }


  void display ()
  {
    //strokeWeight (0.5);
    //fill(#b1c999, 255);
    stroke(247);
    point (location.x, location.y);
  }
}

void keyPressed ()
{
  if (key == 'b') bDisplayVectorField = !bDisplayVectorField;
  if (key == 'p') displayParticle = !displayParticle;
  if (key == '+') m.add (new Mover());

  if (key == ' ') noiseSeed ((int) random (10000));

  if (key == '-')
  {
    if (m.size() > 0) m.remove (0);
  }
}

void displayVectorField()
{
  stroke (#b1c999, 40);
  stroke (247, 20);

  float xSpan = (width - (xRes-1)*(float) padding) / xRes;
  float ySpan = (height - (yRes-1)*(float) padding) / yRes;

  float x, y, angle;
  noFill();

  float dis;
  float mm = map (posX, 0, width, -1.5, 1.5);
  if (mm == 0) mm = 0.0001;
  float maxDis = mm*dist (0, 0, width/2, height/2);
  float fAngle;

  for (int i = 0; i < yRes; i++)
  {
    for (int j = 0; j < xRes; j++)
    {

      x = xSpan * j + padding*j + xSpan/2;
      y = ySpan * i + padding*i + ySpan/2;
      dis = dist (x, y, width/2, height/2);
      fAngle = map (dis, 0, maxDis, posY, 0);
      angle = map (dis, 0, maxDis, PI, 0) +  random (-PI/4*fAngle, PI/4*fAngle);

      line (x, y, x+cos (angle) * xSpan, y + sin (angle) * ySpan);
    }
  }
}



