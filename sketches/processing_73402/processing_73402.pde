
boolean started = false;

int[] bottom,top;

float[] dragon;
float modif=0.0;

color backgroundColor = #FFCC00;

PFont font;

static float difficulty=0.05;

int sign=1, score=0;

void setup()
{
  size(320,240);
  randomSeed(0);
  
  top = new int[width];
  bottom = new int[width];

  dragon = new float[width];

  for(int i=0; i < width/2+1; i++)
    dragon[i] = int(height/2);

  for(int i=1; i < width; i++)
  {
    bottom[i]= abs(bottom[i-1] + int(random(-5,5))) ;
    if(bottom[i] < 0) bottom[i] = int(random(1,5));  
  }

  for(int i=1; i < width; i++)
  {
    top[i]= abs(top[i-1] + int(random(-5,5))) ;
    if(top[i]+height-bottom[i] > height) top[i] = int(random(1,5));
  }

  noLoop();
}

void draw()
{
  backgroundColor = color(255, 204-score/125, 0);

  background(backgroundColor);
  fill(backgroundColor);

  for(int i=0;i<width;i++)
  {
    line(i, height, i, height-bottom[i]);
    if(i+1 < width)
    {
      bottom[i] = bottom[i+1];
      bottom[width-1] = abs(bottom[width-2] + int(random(-3,3)));
    }
  }

  for(int i=0;i<width;i++)
  {
    line(i, 0, i, top[i]);
    if(i+1 < width)
    {
      top[i] = top[i+1];
      top[width-1] = abs(top[width-2] + int(random(-3,3)));
    }
  }

  text("Score "+score++, width-100, height-10);
  
  if(score > 25300)
  {
    background(0,0,0);
    text("Victory!", int(height/2), int(width/2));
    noLoop();
  }

  modif += sign*difficulty;
  dragon[int(width/2)] += modif;  

  for(int i=0; i < int(width/2); i++)
  {
    line(i+1,dragon[i+1],i,dragon[i]);
    dragon[i]=dragon[i+1];
  }

  if( (dragon[width/2] < top[width/2]) || (dragon[width/2] > height-bottom[width/2]))
  {
    noLoop();
    background(0);
    fill(255,0,0);
    text("Game over. Your score is: " + score, width/2-90, height/2);
  }
}

/* Control 2 */

void keyPressed()
{
  if(!started)
  {
    loop();
    started = true;
  }

  sign=-1;
}

void keyReleased()
{
  sign=1;
}


/* Control 1
 void keyPressed()
 {
 if (keyCode == UP)
 {
 loop();
 sign=-1;
 }
 else if (keyCode == DOWN)
 {
 sign=1;
 }
 }
 */
