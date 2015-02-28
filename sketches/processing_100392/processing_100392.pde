
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/100392*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
Sal Spring
allonestring.co.uk
June 2013

playing with rotating arcs here called Rings
separate classes for the Ring and its
• Orbit = distance from the centre
• Colour
• Display = strokeWeight and blob size
separated out as the Ring class got too big

keyboard input for 
• [m]ore and [f]ewer Rings
• [r]andom, [u]niform and [t]unnel arrangements of Rings

beware - [t]unnel mode is a little nauseating!
*/

Ring[] rings;
Colour[] colours;
Orbit[] orbits;
Display displayInfo;

int numShapes = 31;
int numVisible = 17;

float minRadius = 55;
float maxRadius = 270;
float orbitalSpacing;

Colour bgcolour;
color dark = color(20, 20, 30);
color medium = color(80, 100, 100);
color light = color(250, 240, 240);

String pattern = "RANDOM";//"UNIFORM";//"RANDOM";//TUNNEL


void setup()
{
  size(550, 550);

  bgcolour = new Colour();
  if (pattern == "UNIFORM")
  {
    bgcolour.target = dark;
  }
  else if (pattern == "TUNNEL")
  {
    bgcolour.target = medium;
  }
  else
  {
    bgcolour.target = light;
  }

  background(bgcolour.current);
  smooth();

  rings = new Ring[numShapes];
  orbits = new Orbit[numShapes];
  colours = new Colour[numShapes];
  displayInfo = new Display();

  for (int i = 0; i < numShapes; i++)
  {
    colours[i] = new Colour(i);
    colours[i].initialise();
    colours[i].renew();

    orbits[i] = new Orbit(i);
    orbits[i].initialise();
    orbits[i].renew();

    rings[i] = new Ring();
    rings[i].initialise();

    if (i < numVisible) rings[i].visible = true;
  }

  setOrbitalSpacing();
  displayInfo.renew();
}


void draw()
{
  background(bgcolour.current);

  pushMatrix();
  translate(width/2, height/2);

  displayInfo.easeToStroke();
  displayInfo.easeToBlob();
  bgcolour.easeTo(bgcolour.target);

  for (int i = 0; i < numShapes; i++)
  {
    if (pattern == "TUNNEL") colours[i].renew();
    colours[i].easeTo(colours[i].target);
    orbits[i].easeTo();

    rings[i].colour = colours[i].current;
    rings[i].orbit = orbits[i].currentRadius;
    rings[i].update();
    rings[i].display();
  }

  popMatrix();
}

void setOrbitalSpacing()
{
  orbitalSpacing = (maxRadius - minRadius) / numVisible;
  for (int s = 0; s < numVisible; s++)
  {
    orbits[s].renew();
  }
}


void keyPressed()
{
  if (keyCode == 'm' || keyCode == 'M') 
  {
    if (numVisible < numShapes)
    {
      orbits[numVisible].initialise();
      orbits[numVisible].renew();
      colours[numVisible].initialise();
      colours[numVisible].renew();
      rings[numVisible].initialise();
      rings[numVisible].visible = true;
      numVisible = min(numVisible+=1, numShapes);
      if (pattern == "UNIFORM" || pattern == "TUNNEL")
      {
        setOrbitalSpacing();
        displayInfo.renew();
      }
    }
  }
  if (keyCode == 'f' || keyCode == 'F') 
  {
    if (numVisible >= 5)
    {
      numVisible = max(numVisible -= 1, 5);
      orbits[numVisible].targetRadius = 0.8 * width;
      colours[numVisible].target = color(255, 255, 255);
      if (pattern == "UNIFORM" || pattern == "TUNNEL")
      {
        setOrbitalSpacing();
        displayInfo.renew();
      }
    }
  }

  if (keyCode == 'u' || keyCode == 'U') 
  {
    pattern = "UNIFORM";
    for (int s = 0; s < numShapes; s++)
    { 
      setOrbitalSpacing();
      orbits[s].renew();
      colours[s].renew();
      displayInfo.renew();
      bgcolour.target = dark;
    }
  }
  if (keyCode == 't' || keyCode == 'T') 
  {
    pattern = "TUNNEL";
    for (int s = 0; s < numShapes; s++)
    { 
      setOrbitalSpacing();
      orbits[s].renew();
      colours[s].renew();
      displayInfo.renew();
      bgcolour.target = medium;
    }
  }
  if (keyCode == 'r' || keyCode == 'R') 
  {
    pattern = "RANDOM";
    for (int s = 0; s < numShapes; s++) 
    {
      orbits[s].renew();
      colours[s].renew();
      displayInfo.renew();
      bgcolour.target = light;
    }
  }
}

//a class for holding colours and transitions
class Colour
{
  color current, target;
  float easing = 0.1;

  int index;
  
  float tunnelAngle = 0;
  float tunnelInc = 0.05;

  Colour(int index)
  {
    this.index = index;
    this.current = current;
    this.target = target;
  }
  Colour() {}

  void initialise()
  {
    current = color(0, 0, 0);
  }

  void renew()
  {
    if (pattern == "UNIFORM")
    {
      target = color(index*96/numShapes, (numShapes - 1.25*index)*255/numShapes, 2*index*255/numShapes);
    }
    else if(pattern == "TUNNEL")
    {
      float mappedIndex = map(index, 0, numVisible, 0, TWO_PI);
      float grey = (sin(mappedIndex + tunnelAngle) * 128) + 128; 
      tunnelAngle -= tunnelInc;
      target = color(2*(255-grey)/3, 255-grey, (255-grey)/2);
    }
    else
    {
      target = color(random(128, 240), random(64, 192), random(32, 128));
    }
  }

  void easeTo(color target)
  {
    float redbit = red(current);
    float greenbit = green(current);
    float bluebit = blue(current);
    redbit += (red(target) - red(current)) * easing;
    greenbit += (green(target) - green(current)) * easing;
    bluebit += (blue(target) - blue(current)) * easing;

    if (abs(red(target) - red(current)) < 1) redbit = red(target);
    if (abs(green(target) - green(current)) < 1) greenbit = green(target);
    if (abs(blue(target) - blue(current)) < 1) bluebit = blue(target);
    current = color (redbit, greenbit, bluebit);
  }
}

//a class for holding the strokeWeight and blobSize and their transitions
class Display
{
  float currentStroke, targetStroke;
  float currentBlob, targetBlob;
  float defaultStroke;
  float defaultBlob;
  
  float easing = 0.1;

  Display()
  {
    this.currentStroke = currentStroke;
    this.targetStroke = targetStroke;
    this.currentBlob = currentBlob;
    this.targetBlob = targetBlob;
    
    this.defaultStroke = defaultStroke;
    this.defaultBlob = defaultBlob;
  }

  void renew()
  {
    if(pattern == "UNIFORM")
    {
      targetStroke = 0.5 * (maxRadius - minRadius) / numVisible;
      targetBlob = 0.5 * (maxRadius - minRadius) / numVisible;
    }
    else if(pattern == "TUNNEL")
    {
      targetStroke = 0.9 * (maxRadius - minRadius) / numVisible;
      targetBlob = 0.9 * (maxRadius - minRadius) / numVisible;
    }
    else
    {
      targetStroke = random(2) * (maxRadius - minRadius) / numVisible;
      targetBlob = random(1, 2) * (maxRadius - minRadius) / numVisible;
    }
  }

  void easeToStroke()
  {
    currentStroke += (targetStroke - currentStroke) * easing;
    if (abs(targetStroke - currentStroke) < 0.2) currentStroke = targetStroke;
  }
  void easeToBlob()
  {
    currentBlob += (targetBlob - currentBlob) * easing;
    if (abs(targetBlob - currentBlob) < 0.2) currentBlob = targetBlob;
  }
}

//a class holding radii and transitions
class Orbit
{

  float easing = 0.1;

  float currentRadius, targetRadius;
  int index;

  Orbit(int index)
  {
    this.index = index;
    this.currentRadius = currentRadius;
    this.targetRadius = targetRadius;
  }

  void initialise()
  {
    currentRadius = 0;
  }

  void renew()
  {
    if (pattern == "UNIFORM")
    {
      targetRadius = minRadius + index * orbitalSpacing;
    }
    else if(pattern == "TUNNEL")
    {
      targetRadius = minRadius + index * orbitalSpacing;
    }
    else
    {
      targetRadius = random(minRadius, maxRadius);
    }
  }

  void easeTo()
  {
    currentRadius += (targetRadius - currentRadius) * easing;
    if (abs(targetRadius - currentRadius) < 2) currentRadius = targetRadius;
    if (currentRadius > width * 0.75) 
    {
      rings[index].visible = false;
    }
  }
}  

//a class holding start and end angles of arc centred on (0, 0)
//with ring and end blob update and display
class Ring
{
  float startAngle, startAngleInc;
  float endAngle, endAngleInc;
  PVector startPos, endPos;

  float minRotInc = -0.015;
  float maxRotInc = 0.015;

  float orbit;
  color colour;
  float strokeWidth;
  float blobSize;

  boolean visible;


  Ring()
  {
    this.startAngle = startAngle;
    this.startAngleInc = startAngleInc;
    this.endAngle = endAngle;
    this.endAngleInc = endAngleInc;
    this.startPos = startPos;
    this.endPos = endPos;

    this.orbit = orbit;
    this.colour = colour;
    this.strokeWidth = strokeWidth;
    this.blobSize = blobSize;
    
    this.visible = visible;

    initialise();
  }

  void initialise()
  {
    orbit = 0;
    startAngle = random(0, TWO_PI);
    startAngleInc = random(minRotInc, maxRotInc);
    endAngle = random(0, TWO_PI);
    endAngleInc = random(minRotInc, maxRotInc);
    startPos = new PVector(0, 0);
    endPos = new PVector(0, 0);
    visible = false;
  }

  void display()
  {
    if (visible)
    {
      stroke(colour);
      strokeWeight(displayInfo.currentStroke);
      noFill();
      pushMatrix();
      rotate(startAngle);

      if (endAngle < TWO_PI) 
      {
        arc(0, 0, 2*orbit, 2*orbit, 0, endAngle);
      }
      else //TWO_PI < startAngle < FOUR_PI
      {
        arc(0, 0, 2*orbit, 2*orbit, endAngle, TWO_PI * 2);
      }

      float blobDiam = displayInfo.currentBlob;
      noStroke();
      fill(colour);
      float x1 = orbit * cos(endAngle);
      float y1 = orbit * sin(endAngle);
      ellipse(x1, y1, blobDiam, blobDiam);
      float x2 = orbit * cos(0);
      float y2 = orbit * sin(0);
      ellipse(x2, y2, blobDiam, blobDiam);
      popMatrix();
    }
  }

  void update()
  {
    endAngle += endAngleInc;
    startAngle += startAngleInc;
    endAngle %= TWO_PI*2;
    startAngle %= TWO_PI*2;
    if (endAngle < 0) endAngle += TWO_PI*2;
    if (startAngle < 0) startAngle += TWO_PI*2;

    findEndPositions();
  }

  void findEndPositions()
  {
    startPos.x = orbit * cos(endAngle);
    startPos.y = orbit * sin(endAngle);
    endPos.y = orbit * cos(startAngle);
    endPos.y = orbit * sin(startAngle);
  }
}



