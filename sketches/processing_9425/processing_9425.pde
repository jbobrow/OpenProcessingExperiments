
/*
3. Collage
Set a theme then develop a collage system in Processing based on
that theme. Every time your 800 x 800 program is run,
a new collage will be generated.

Name: Kuo-Ang Huang
UID: 703-783-811

*/

int bgchoice = 0;

PImage defbg;

PImage pbg1, pbg2, pbg3;

PImage p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;

PShape ps1;

PFont txt1;

void setup()
{
  size(800,800);
  smooth();
  
  pbg1 = loadImage("Milky_Way_Galaxyr.jpg");
  pbg2 = loadImage("PelicanNebula1_shahar_r.jpg");
  pbg3 = loadImage("dso_m1_HSTr.jpg");
  
  p1 = loadImage("Venus.png");
  p2 = loadImage("Mercury.png");
  p3 = loadImage("Earth.png");
  p4 = loadImage("Mars.png");
  p5 = loadImage("Jupiter.png");
  p6 = loadImage("Saturn.png");
  p7 = loadImage("Uranus.png");
  p8 = loadImage("Neptune.png");
  p9 = loadImage("pluto.png");
  p10 = loadImage("sun.png");
  p11 = loadImage("comet.jpg");
  p12 = loadImage("comet_1.jpg");
  p13 = loadImage("west2.jpg");
  p14 = loadImage("space-shuttle-atlantis-sts-27-in-1972-ga.jpg");
  p15 = loadImage("spaceship2.jpg");

  ps1 = loadShape("johnny_automatic_International_Space_Station.svg");
  
  txt1 = loadFont("CenturyGothic-48.vlw");
  textFont(txt1);
  
  image(pbg1, 0, 0, 800, 800);
  defbg = pbg2;
  mousePressed();
}

void draw ()
{
  // Svg images cannot be resized to 0
  //int Psizex = constrain(mouseX, 50, 800);
  //int Psizey = constrain(mouseY, 50, 800);
  
}

// Random Planetary
void mousePressed()
{
  image(defbg, 0, 0, 800, 800);
  
  for(int i = 1; i <21; i++)
  {
    int pnum = round(random(1, 16));
    
    int posX = round(random(100, width -100));  
    int posY = round(random(100, height -100));
    float angle = random(0, 2*PI);
    float psize = random(0.2, 1.2);
    float tclr = random(0, 1);
    
    pushMatrix(); 
    translate(posX, posY);
    rotate(angle);
    scale(psize);
    
    colorMode(HSB, 360, 100, 100);
    fill(360*tclr, 100, 100);
    text("Universe is Beautiful!", 50, 50);
    noFill();
    colorMode(RGB, 255, 255, 255);    
    
    if(pnum ==1)
      image(p1, -100, -100, 200, 200);
    else if(pnum ==2)
      image(p2, -100, -100, 200, 200);
    else if(pnum ==3)
      image(p3, -100, -100, 200, 200);
    else if(pnum ==4)
      image(p4, -100, -100, 200, 200);
    else if(pnum ==5)
      image(p5, -100, -100, 200, 200);
    else if(pnum ==6)
      image(p6, -200, -100, 400, 194);
    else if(pnum ==7)
      image(p7, -100, -100, 200, 200);
    else if(pnum ==8)
      image(p8, -100, -100, 200, 200);
    else if(pnum ==9)
      image(p9, -100, -100, 200, 200);
    else if(pnum ==10)
      image(p10, -100, -100, 200, 200);
    else if(pnum ==11)
      image(p11, -100, -80, 200, 160);
    else if(pnum ==12)
      image(p12, -100, -90, 200, 178);
    else if(pnum ==13)
      image(p13, -100, -150, 200, 298);  
    else if(pnum ==14)
      image(p14, -100, -70, 200, 138); 
    else if(pnum ==15)
      image(p15, -100, -150, 200, 295);
    else if(pnum ==16)
      shape(ps1, -100, -100, 200, 200);
    
    popMatrix();
  }
  
}

/*
// Change Background
void keyPressed()
{
  if(key ==' ')
  {
    if(bgchoice == 0)
    {
      image(pbg2, 0, 0, 800, 800);
      defbg = pbg2;
      bgchoice++;
    }
    else if(bgchoice == 1)
    {
      image(pbg3, 0, 0, 800, 800);
      defbg = pbg3;
      bgchoice++;
    }
    else
    {
      image(pbg1, 0, 0, 800, 800);
      defbg = pbg1;
      bgchoice = 0;
    }

    key = '?';
  }
  
}
*/

