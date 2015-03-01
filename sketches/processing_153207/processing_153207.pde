
int padding;

ArrayList <Mover> m;

int xRes = 50;
int yRes = 28;
float posX;
float posY;

boolean bDisplayVectorField = false, displayParticle = true;
boolean fullScreenMode = true;

PFont font = createFont ("Arial", 24);


void setup ()
{ 
  size (720, 405);
  noSmooth();
  
  var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
  
  externals.context.clearRect(0, 0, width, height);// part of the canvasAPI that creates a clear rect
  
  var w = max(parent.document.documentElement.clientWidth, window.innerWidth || 0);
  var h = max(parent.document.documentElement.clientHeight, window.innerHeight || 0);
  
  parent.document.getElementById ("pageContainer").setAttribute ("style", "width: 100%");
  parent.document.getElementById ("appletBackground").setAttribute ("style", "background-color: #00ffff; padding: 0px;");
   parent.document.getElementById("appletContainer").setAttribute("style", "margin: 0; padding: 0; border: 3px dashed #00ff00; position: relative; width: 1280px; height; 100px; overflow: hidden; text-align: left; z-index: 10000");
  parent.document.getElementById("appletAjaxContainer").removeAttribute("class");
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px; padding: 0; margin: 0; text-align: left; width: 1600px; max-width: auto; overflow: auto;");

parent.document.getElementById ("canvasIconShowOnOverlay").setAttribute ("style", "display: none");
parent.document.getElementById("iframePjs").removeAttribute("style");
parent.document.getElementById("iframePjs").setAttribute("style", "background-color:#ff0000; margin: 10px; padding: 0px; display: inline-block;clear: both; width: 100%; max-width: 1600px" );
  //println (w);
  //println (h);
  
  var myCanvas = parent.document.getElementById("appletAjaxContainer");
  //myCanvas.setAttribute("style", "position: fixed; top: 0; left: 0; z-index: 100000; width:" + str (w));

  size (w, h);

  //externals.context.clearRect(0, 0, width, height);
  background (0);

  padding = -2;
  posX = width/2+1;
  posY = 0;
  m = new ArrayList();

  for (int i = 0; i < 2000; i++)
  {
    m.add (new Mover());
  }
  
  textFont (font, 24);
  textAlign (CENTER, TOP);
}



void draw ()
{
  randomSeed (0);

  //blur(1);
  // fastblur (1);

  noStroke();
  fill (7, 15);
  rect (0, 0, width, height);

  posX = lerp (posX, (mousePressed ? mouseX : noise (frameCount /500.0) * width /*noise (20+frameCount / 100.0)*1.5*/), 0.05);
  posY = lerp (posY, mousePressed ? map (mouseY, 0, height, 0, 1) : (noise (100+frameCount / 400.0)), 0.05) ;


  if (displayParticle)
  {
    for (int i = 0; i < m.size (); i++)
    {
      m.get(i).move();
      m.get (i).setVelo (posX, posY, noise (frameCount / 300.0));
      m.get(i).checkEdges(); 

      m.get(i).display();
    }
  }
  //copy (1, 1, width, height, -1, -1, width+3, height+3);


  //if (bDisplayVectorField) displayVectorField();
  
  fill (200);
  textSize (fullScreenMode ? 24 : 18);
  text (fullScreenMode ? "Press Space to leave Fullscreen" : "Press Space for Fullscreen", width/2, height/2);
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
    float mm = map (posX, 0, width, -1.2, 1.2);
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
  if (key == ' ')
  {
    fullScreenMode = !fullScreenMode;

    if (fullScreenMode)
    {
      var w = Math.max(parent.document.documentElement.clientWidth, window.innerWidth || 0);
      var h = Math.max(parent.document.documentElement.clientHeight, window.innerHeight || 0);

      var canvas = parent.document.getElementById("appletAjaxContainer");
      canvas.removeAttribute ("style");
      canvas.setAttribute("style", "position: absolute; top: 0; left: 0;");
      size (w, h);
      externals.context.clearRect(0, 0, width, height);
      background (0);
    } else 
    {

      size (720, 405);
      externals.context.clearRect(0, 0, width, height);

      var canvas = parent.document.getElementById("appletAjaxContainer");
       canvas.removeAttribute ("style");
      canvas.setAttribute("style", "margin: 0; padding: 0; position: relative; top: 0; left: 0; with: 720; height: 405;");
      background (0);
    }
  }

  if (key == 'b') bDisplayVectorField = !bDisplayVectorField;
  if (key == 'p') displayParticle = !displayParticle;
  if (key == '+') for (int i = 0; i  < 10; i++) m.add (new Mover());

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



