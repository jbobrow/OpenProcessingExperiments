
PImage img1, img2, img3;
float rot, rotDelta;
int anz, abstand, maxAbstand;
boolean richtung;

void setup()
{
  size(600, 600);
  smooth();
  img1 = loadImage("image03.png");
  img2 = loadImage("image02.png");
  img3 = loadImage("image01.png");
  img1.resize(100, 0);
  img2.resize(50, 0);
  img3.resize(25, 0);
  tint(178, 120, 0, 199);
  anz = 8;
  rot = 0;
  abstand = 0;
  maxAbstand = 200;
  richtung = true;  // turn positive
  calcRotDelta(); 
}

void calcRotDelta()
{
  rotDelta = 360/anz;
}

void draw()
{
  newAbstand();
  imageMode(CENTER);
  background(0);
  translate(width/2, height/2);
  for(int i=0; i<anz; i++)
  {
    pushMatrix();
    rotate(radians(rot));
    
    // Big image
    image(img1, 0, abstand);
    
      // Small Images
      image(img2, 0, abstand + img1.height);
      pushMatrix();
      rotate(radians(rot+rotDelta*0.5));
      image(img2, 0, abstand + img1.height);
        // Smaller Images
        image(img3, 0, abstand + img1.height + img2.height);
        pushMatrix();
        rotate(rot+rotDelta*0.25);
        image(img3, 0, abstand + img1.height + img2.height);
        popMatrix();        
      popMatrix();
    
    popMatrix();
    rot += rotDelta;    
  }
  rot += 0.2;
}

void newAbstand()
{
  abstand = int(sin(frameCount*0.1)* maxAbstand);
}

void keyPressed()
{
  if(keyCode == UP)
  {
    anz++;
    calcRotDelta();
  }
  else if(keyCode == DOWN)
  {
    if (anz > 1)
      anz--;
    calcRotDelta();
  } 
  else if(keyCode == LEFT)
  {
    abstand -= 10;
  }
  else if (keyCode == RIGHT)
  {
    abstand += 10; 
  }
  else if(keyCode == ENTER)
  {
    saveFrame(); 
  }
}

