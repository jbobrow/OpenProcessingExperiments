
ArrayList ondes = new ArrayList();
Onde onde;

void setup()
{
  size(200,200,P2D);
  noSmooth();
  background(255);
}

void draw()
{
  noStroke();
  fill(255,10);
  rect(0,0, width, width);
  
  int volonte = int(random(width));

  nouvelleOnde(volonte);

  for(int i = 0 ; i < ondes.size(); i++)
  {
    Onde onde = (Onde)ondes.get(i);
    onde.maj();
    if(onde.finie)ondes.remove(onde);
  }
  
  int randW = width/2 + 20;
  
  for(int i = 0; i++ < width*width;)
  {
    volonte = int(random(width/2)+width/2);
    if(volonte > width/1.5)
    {
      int dirX = round(cos(sin(frameCount*3)*.8)) * round(random(-1,2)*randW*.009);
      int dirY = int(cos(round(sin( width*cos(frameCount*5)))*randW * round(random(-1,2))))*randW;

      set(i%width, i/width,get(floor((i+dirX)%width),floor((i-dirY)/width)));
    }
  }
}

void nouvelleOnde(int volonte)
{
  if(volonte > width * .7)
  {
    int centreX = int(random(100)+width/2);
    int centreY = int(random(height));
    onde = new Onde(centreX, centreY);
    ondes.add(onde);
  }
}

class Onde
{
  int age = int(random(10));
  float lim = random(30) + 10;
  float ageScale = random(2)+.5;
  int magnitude = int(random(250));
  int centreX, centreY, precision, couleur;
  Boolean finie = false;

  Onde(int centreX, int centreY)
  {
    this.magnitude = 1;
    this.centreX = centreX;
    this.centreY = centreY;
    centreX = constrain(centreX, 1, width);
    centreY = constrain(centreY, 1, height);
  }

  void maj()
  {
    this.precision = 360;
    for(int i = 0 ; i < precision; i++)
    {
      float ondeX = centreX + cos(i) * magnitude;
      float ondeY = centreY + sin(i) * magnitude;

      centreX += noise(width, cos(i), frameCount);
      centreY += noise(width, sin(i), frameCount);

      for(int j = i; j < precision; j+= 20)
      {
        strokeWeight(j%3);
        //ondeX =  centreX + ondeX * cos(noise(cos(sin(j)), cos(i*.05*j),sin(cos(frameCount*.005))*2));
        //ondeY =  centreY + ondeY * sin(noise(sin(cos(j)),sin(i*.005*j), cos(sin(frameCount*.03))*2));

        stroke(50, dist(centreX,centreY, j%width, j/width));
        pushMatrix();
        //rotate(frameCount);
        popMatrix();
        point(ondeX, ondeY);
      }
    }

    magnitude += age * ageScale;
    age++;

    if(magnitude > lim)
    {
      finie = true;
    }
  }
}


