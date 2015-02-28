
// Design By GameL

// le déplacement X et Y de la souris sont affectés à un moficateur .
// le clic gauche et droit sont affecté à un modificateur... 
//...surprise. ^^ 

PImage atn; 
PImage textureCinetique; 
PImage rennes2; // 

float  coef= 1.5;
float L = 133/coef;
float l = 84/coef;
float ep = 33/coef;
float x1;
float y1;


void setup()
{
  size(600,360);
  background(255);
  noStroke();
  smooth();
  noCursor();
  frameRate(30);
  
  atn = loadImage("atn.png"); 
  rennes2 = loadImage("rennes2.png"); 
  textureCinetique = loadImage("texture.png"); 
}

void draw()
{
  cinetique();
  if ( mousePressed) 
  {
     if ( mouseButton == LEFT ) 
     {
        image (rennes2,0,0);
     }
     if ( mouseButton == RIGHT ) 
     {
        image (atn,0,0);
     }
  }
}

void cinetique()
{
  fill(255,100);
  rect(0,0,width, height);
  
  for (float x1=-1000; x1 < width ; x1=x1 + L)
  {
    for (float y1=-800; y1< height ; y1 = y1 + ep)
    {
       image(textureCinetique,mouseX+x1,mouseY+y1,L,l);
    }
  }
}




