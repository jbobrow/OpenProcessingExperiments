
PImage vorlage; 
PImage LampeRot;
PImage LampeGelb;
PImage LampeWeiss; 
PImage allesrot; 
PImage allesgelb; 
PImage allesweiss;

int modus = 0;

void setup() {
  size (500, 500);
  vorlage = loadImage("vorlage.png");
  LampeRot = loadImage("3.1.png");
  LampeGelb = loadImage("1.1.png");
  LampeWeiss = loadImage("2.2.png");
  allesrot = loadImage("3.png");
  allesgelb = loadImage("2.png");
  allesweiss = loadImage("1.png");

  //vorlage.filter(BLUR, 6);
  image(vorlage, -1, 0);

  //image(LampeRot, 0, 0); 
  //image(LampeGelb, 0, 0); 
  //image(LampeWeiss, 0, 0);
}

void draw ()
{

  // println( mouseY);

  if (modus == 1)

  { 
    image(allesrot, 0, 0);
    image(LampeGelb, 0, 0); 
    image(LampeWeiss, 0, 0);
  }

  else if (modus == 2)
  { 
    image(allesgelb, 0, 0);
    image(LampeRot, 0, 0); 
    image(LampeWeiss, 0, 0);
  }

  else if (modus == 3)
  { 
    image(allesweiss, 0, 0);
    image(LampeRot, 0, 0); 
    image(LampeGelb, 0, 0);
  }
  else if (modus == 0)
  { 
    image(vorlage, 0, 0);
    image(LampeRot, 0, 0); 
    image(LampeGelb, 0, 0); 
    image(LampeWeiss, 0, 0);
   
  }

  fill(250);
  textSize(30);
  text("choose a color", 130, 30);
}

void mousePressed()
{
 if (mouseX < 283 && mouseX > 196 && mouseY <270 && mouseY > 150 )

  { 
    modus = 1;
  }

  else if (mousePressed && mouseX < 330 && mouseX > 246 && mouseY <373 && mouseY > 309 )
  { 
    modus = 2;
  }

  else if (mousePressed && mouseX < 228 && mouseX > 178 && mouseY <321 && mouseY > 255 )
  { 
    modus = 3;
  }
  else
  {
    modus = 0;
    
  } 
}



