
 

PImage plop1;
PImage plop2;
PGraphics dsp;
PGraphics plop;
int tooo = 0;

float maxSpeed = 0.5;
Ball[] balls;


void setup ()
{
  size( 800, 400 );
     // blendMode(ADD   );
  plop1 = loadImage("plop2.png");
  plop2 = loadImage("plop3.png");
  balls = new Ball[1600];
  for ( int i = 0; i < balls.length; i++ )
  {
    balls[i] = new Ball(i);
  }
  plop = createGraphics(width, height);
 // dsp  = createGraphics(width, height);
  plop.beginDraw();
  plop.background(0, 0, 0, 12);
  plop.endDraw();
  background(0);
  smooth();
}

// The next line is needed if running in JavaScript Mode with Processing.js
// Declare variable "a" of type PImage


void draw()
{
  
  // dsp.beginDraw();
  //dsp.blend(OVERLAY   );
  // dsp.
  //dsp.blend(plop, 0, 0, width, height, 0, 0, width, height, BLEND     );
  //dsp.image(plop,0,0);
  //background(2);
  noStroke();
  if ( balls != null )
  {
    for ( int i = 0; i < balls.length; i++ )
    {
      balls[i].update();
      balls[i].draw();
      imageMode(CORNER);
     /* if(id== 0)
      image(plop, 0, 0);*/
    }
  }
  //  dsp.endDraw();
  
  //if(tooo == 2)
  {
    image(plop, 0, 0);
    // tooo = 0;
  }
  /* else
   tooo ++;
   */  // image(dsp,0,0);
}

class Ball
{
  float alp;
  float px, py;
  float dx, dy;
  float zede;
  color col;
int num;


  Ball(int i)
  {
  
     num = i;
    zede = i/80 +1;

    alp = PI *(- (i %2));//random(PI,-PI);
    dx -=  ((zede) /20 + sqrt(zede/5)) * cos(alp); 
    dy -=  ((zede) /20 + sqrt(zede/5))* sin(alp);//random(-maxSpeed, maxSpeed) * zede;

    px = random(width) ;
    py = random(height) ;

    colorMode(HSB,255);
    col = color(120 + num %2 * 128, 180, i /4 +30);
    
    colorMode(RGB,255);
  }

  void update ()
  {
    px += dx + random(-.5,.5);
    py += dy /*+ random(-.4, .4)*/;

    if (px+ zede*2 < -1)
    {
      px = 800 + zede*2;
      py = zede + random(height-2*zede);
    }
    if (px- zede*2 > 801)
    {
      px = - zede * 2;
      py = zede + random(height-2*zede);
    }
    if (py+ zede*2 < -1)
    {
      py = 600 + zede*2;
      px = zede + random(width-2*zede);
    }
    if (py- zede*2 > 601)
    {
      py = - zede * 2;
      ;
      px = zede + random(width-2*zede);
    }
  }

  void draw ()
  {
    // strokeWeight( 1 );
    // stroke(200);

    fill(col);
    imageMode(CENTER);
     if (num % 2 == 0)
    {
      image(plop1,px , py, zede , zede);
     //image(plop1,px , py, zede * py/height -zede, zede * py/height -zede);
    }
else
    {
       image(plop2,px , py, zede , zede);
//     image(plop2,px , py, zede * py/height , zede * py/height );
    }
   /*else*/
     /*
   */ // else
/*else
   ellipse( px, py, zede, zede);*/
  }
}



