
PFont copper;
PFont couriernew;
PFont garamond;
PFont futura;
PFont american;

float rad = 0;
float textscale = 1;
float textscalespeed = 0.005;
float xspeed;
float x = 0;
float xx = 700;

int opacity = 0;
int direction = -1;

PImage spacebackground;
PImage clockface;

String word = "minutes become hours, hours become days";
char[] saying;

void setup()
{
  size (900, 500);
  spacebackground = requestImage("space.jpg");
  clockface = requestImage("time.png");
  copper = createFont("Copperplate Gothic Light", 18);
  couriernew = createFont("Courier New", 24);
  garamond = createFont("Garamond Italic", 30);
  futura = createFont ("Futura Medium", 60);
  american = createFont ("American Typewriter Light", 16);
  saying = word.toCharArray();
}


void draw()
{
  imageMode(CORNER);
  image(spacebackground, 0, 0, width, height);
  imageMode(CENTER);
  image(clockface, 450, 250, 550, 550);
  
  pushMatrix();
  translate(450, 250);
  rotate(rad);
  rad += 0.02;
  fill(0);
  textFont(copper);
  textAlign(CORNER);
  textSize(18);
  text("Time goes by so quickly", 0, 0, 400, 250);
  popMatrix();
  
  pushMatrix();
  translate (450, 200);
  textFont(american);
  fill(#009999);
  for (int i = 0; i < saying.length; i++)
  {
    float angle = map(mouseX, 0, width, 0, PI/8);
    rotate(angle);
    text(saying[i], 0, 0);
    translate(textWidth(saying[i]), 0);
  }
  popMatrix();
  
  pushMatrix();
  translate(120, 10);
  scale(textscale);
  textAlign(CENTER);
  fill(255);
  textFont(couriernew);
  text("time moves slower in space", 0, 0, 450, 100);
  textscale += textscalespeed;
  if (textscale > 15)
    {
      textscalespeed = -textscalespeed;
    }
  else if (textscale < 1)
    {
      textscalespeed = -textscalespeed;
    }
  popMatrix();
  
  opacity += 2 * direction;
  if ((opacity < 0)  || (opacity > 255))
    {
      direction = -direction;
    }
    fill (0, opacity);
    textFont(garamond);
    fill(#6699FF);
    text("TIME ESCAPES", x, 300);
    textFont (futura);
    fill(#9999FF);
    text("Time Eludes Us", xx, 450);
    x += 1.0;
    if (x > 700)
    {
      x = -700;
    }
    xx -= 0.5;
    if (xx < -700)
    {
      xx = 700;
    }
    
  // opacity += 2 * direction;
  //if ((opacity < 0)  || (opacity > 255))
   // {
   //   direction = -direction;
   // } 
   // textFont (futura);
   // text("Time Eludes Us", x2, 450);
    //x2 += 1.5;
    //if (x2 < 500)
    //{
   //   x2 = -500;
   // }
  
  
  fill(#9999FF);
  text("in the blink of the eye, time passes", random(575, 500), random(675, 500));
}


