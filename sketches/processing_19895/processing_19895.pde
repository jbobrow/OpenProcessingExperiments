
int screenWidth   = 192;
int screenHeight  = 157;

ArrayList myCircles;

void setup() 
{
  size(192,157);
  frameRate(24);

  //create arrayList
  myCircles = new ArrayList();
  for( int i = 0; i < 100; i++)
  {
    myCircles.add( new WindCircle(screenWidth,screenHeight));
  }

  smooth();
}

void draw() 
{


  background(0);

  stroke(0);
  fill(255);

  for( int i = 0; i < myCircles.size(); i++)
  {
    WindCircle b = (WindCircle)myCircles.get(i);


    b.update();
    b.render();
  }
}


void keyPressed()
{
  saveFrame("pattern.png");
}



class WindCircle
{
  int sW, sH;
  float x,y,d,speed,counter;
  color fillCol;
  color strCol;

  WindCircle(int sw, int sh)
  {
    sW = sw;
    sH = sh;
    x = random(0,sW);
    y = random(0,sH);
    d = random(sW*.1,sW*.2);
    speed = random(.01,.05);
    counter = 0;
  }


  void update()
  {
    counter+=speed;
    if(counter > 1 ) counter = 0;
  }

  void render()
  {
    ellipse(x,y,d,d);

    float pX = x + (d*.5) * cos( counter*TWO_PI );
    float pY = y + (d*.5) * sin( counter*TWO_PI );

    line(x,y,pX,pY);
    ellipse(pX,pY,2,2);
  }
}


