
float centerX, centerY;
Ring ring0, ring1, ring2, ring3, ring4;
color backgroundColor = #000000;
float rotation = PI/2 - .18;
float rotationSpeed = 2000;
float backgroundSpeed = .035;
float zoomSpeed = .002;
float frame = 0;
float MIN_ZOOM = .21;
float MAX_ZOOM = 2.25;
boolean zoomDirection = true;
float prevZoom = .00111111;
float zoom = MAX_ZOOM;
float scrollZoom = .02;
float targetZoom = MAX_ZOOM;
float zoomT = 0;
float gap = 50;
int levels = 25;
float colorShift = .05;
boolean inverseShift = false;
boolean drawPolygons = false;
boolean backgroundBreathe = true;
boolean fullscreen = true;
float FPS = 25;
boolean start = true;
Ring[] rings = new Ring[levels];

void setup()
{
  noCursor();
  size(900, 450);//1280x720
  ellipseMode(RADIUS);
  colorMode(HSB);
  background(backgroundColor);
  centerX = width/2;
  centerY = height/2;
  // divisions, outerRadius, innerRadius, rotation, gap_size, fillColor;
  for (int i=0; i<levels; i++)
  {
    if (i == 0)
      rings[i] = new Ring(i, 100, 50, 0, gap, 0);
    else
      rings[i] = new Ring(i + 1, (i)*100 + 100, (i)*100 + 50, 0, gap, 0);
  }
  ring0 = new Ring(0, 50, 12.5, 0, 50, color(0, 0, 255));
  ring1 = new Ring(2, 150, 100, 0, 50, color(255, 0, 255)); 
  // ring2 = new Ring(3, 250, 200, 0, 50, color(0, 255, 255));
  //ring3 = new Ring(4, 350, 300, 0, 50, color(255, 255, 0));
  //ring4 = new Ring(5, 450, 400, 0, 50, color(255, 0, 0));
  //frameRate(FPS);
}

void draw()
{
  if (start)
  {
    rotation += TWO_PI/rotationSpeed;
    frame++;
    float ramp = (-sin(frame * backgroundSpeed)  + 1)/2;
    if (backgroundBreathe)
      backgroundColor = color(ramp * 255);
    else
      backgroundColor = 0;
    fill(backgroundColor);
    rect(0, 0, width, height);

    //zoom
    pushMatrix();
    translate(centerX, centerY);
    zoom = lerp(prevZoom, targetZoom, smootherStep(zoomT));
    zoomT += zoomSpeed;
    if (zoomT >= 1)
    {
      newTarget();
    }
    //println("t: " + zoomT + ", smooth: " + smootherStep(zoomT));
    scale(zoom, zoom);

    translate(-centerX, -centerY);  

    for (int i=1; i<=levels; i++)
    {
      rings[levels - i].draw( (i%2)==0 ? rotation : -rotation, (inverseShift ? (levels + 1 - i) : (i)) * colorShift );
    }
    popMatrix();
    //saveFrame("frames/image-######.png");
  }
}

float smootherStep(float t)//t should be normalized between 0 and 1
{
  return t*t*t*(t*(t*6 - 15) + 10);
}

void newTarget()
{
  float rand = random(1);
  float weighted = pow(rand, 3);
  targetZoom = lerp(MIN_ZOOM, MAX_ZOOM, weighted);
  prevZoom = zoom;
  zoomDirection = !zoomDirection;
  zoomT = 0;
}

void keyPressed() {
  if (key == 's')
    start = true;
  if (key == ' ')
    drawPolygons = !drawPolygons;
  if (key == 'b' || key == 'B')
    backgroundBreathe = !backgroundBreathe;
}



void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  zoom -= e * scrollZoom;
  newTarget();
}

boolean sketchFullScreen() {
  return fullscreen;
}

class Ring
{
  int divisions;
  float outerRadius;
  float innerRadius;
  float rotation;
  float gapSize;
  float hue;
  Ring(int divisions, float outerRadius, float innerRadius, float rotation, float gapSize, float hue)
  {
    this.divisions = divisions;
    this.outerRadius = outerRadius;
    this.innerRadius = innerRadius;
    this.rotation = rotation;
    this.gapSize = gapSize;
    this.hue = hue;
  }

  void draw(float rot, float colorShift)
  {
    hue += colorShift;
    hue %= 255;
    fill(color(hue, 255, 255));
    noStroke();
    ellipse(centerX, centerY, outerRadius, outerRadius);
    fill(backgroundColor);
    ellipse(centerX, centerY, innerRadius, innerRadius);
    pushMatrix();
    translate(centerX, centerY);
    rotate(rot);
    float rotation = 0;
    if (drawPolygons)
    {
      beginShape();
    }
    float av = (outerRadius - innerRadius)/2;
    for (int i=0; i < divisions;  i++)
    {
      noStroke();
      rotation += TWO_PI/divisions;
      rotate(TWO_PI/divisions);
      rect(-gapSize/2, -outerRadius - .6, gapSize, outerRadius - innerRadius + 10);
      if (drawPolygons)
      {
        vertex(cos(-rotation + rot) * outerRadius, sin(-rotation + rot) * outerRadius);
      }
    }
    //strokeWeight(2);
    //stroke(255);
    if (drawPolygons)
    {
      noStroke();
      fill(color(hue, 255, 125));
      ;
      endShape(CLOSE);
    }

    popMatrix();
  }
}



