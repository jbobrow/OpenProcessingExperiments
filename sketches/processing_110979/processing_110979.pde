
PImage back;

void setup ()
{
  size (800,500);
  back = requestImage("Background.jpg");
  frameRate(30);
}

void draw ()
{
  if (back.width > 0);
  {
    back.filter(GRAY);
    back.filter(POSTERIZE, 6);
    image(back, 0, 0, width, height);
  }
    int xx = 0;
    int yy = 0;
    strokeWeight(2);
    while (yy < height)
  {
    stroke(#FFFFFF);
    line(0, yy, width, yy);
    yy += 80;
  }
  
//RIGHT TOP//
    fill(#FFFFFF);
    rect(780, 10, 10, 10);
    rect(760, 10, 10, 10);
    rect(740, 10, 10, 10);
    rect(720, 10, 10, 10);
    rect(700, 10, 10, 10);
    rect(680, 10, 10, 10);
    rect(660, 10, 10, 10);
    rect(640, 10, 10, 10);
    rect(620, 10, 10, 10);
    rect(600, 10, 10, 10);
    rect(780, 30, 10, 10);
    rect(760, 30, 10, 10);
    rect(740, 30, 10, 10);
    rect(700, 30, 10, 10);
    rect(680, 30, 10, 10);
    rect(660, 30, 10, 10);
    rect(640, 30, 10, 10);
    rect(620, 30, 10, 10);
    rect(600, 30, 10, 10);
    rect(720, 30, 10, 10);
    rect(780, 50, 10, 10);
    rect(760, 50, 10, 10);
    rect(740, 50, 10, 10);
    rect(720, 50, 10, 10);
    rect(700, 50, 10, 10);
    rect(680, 50, 10, 10);
    rect(660, 50, 10, 10);
    rect(640, 50, 10, 10);
    rect(620, 50, 10, 10);
    rect(600, 50, 10, 10);
    rect(780, 70, 10, 10);
    rect(760, 70, 10, 10);
    rect(740, 70, 10, 10);
    rect(720, 70, 10, 10);
    rect(700, 70, 10, 10);
    rect(680, 70, 10, 10);
    rect(660, 70, 10, 10);
    rect(640, 70, 10, 10);
    rect(620, 70, 10, 10);
    rect(600, 70, 10, 10);
    
    rect(680, 110, 14, 17);
    rect(666, 238, 21, 20);
    rect(678, 244, 23, 22);
    rect(644, 300, 52, 10);
    rect(647, 388, 10, 19);

//LEFT TOP//

    rect(10, 10, 10, 10);
    rect(30, 10, 10, 10);
    rect(50, 10, 10, 10);
    rect(70, 10, 10, 10);
    rect(90, 10, 10, 10);
    rect(110, 10, 10, 10);
    rect(130, 10, 10, 10);
    rect(150, 10, 10, 10);
    rect(170, 10, 10, 10);
    rect(190, 10, 10, 10);
    rect(10, 30, 10, 10);
    rect(30, 30, 10, 10);
    rect(50, 30, 10, 10);
    rect(70, 30, 10, 10);
    rect(90, 30, 10, 10);
    rect(110, 30, 10, 10);
    rect(130, 30, 10, 10);
    rect(150, 30, 10, 10);
    rect(170, 30, 10, 10);
    rect(190, 30, 10, 10);
    rect(10, 50, 10, 10);
    rect(30, 50, 10, 10);
    rect(50, 50, 10, 10);
    rect(70, 50, 10, 10);
    rect(90, 50, 10, 10);
    rect(110, 50, 10, 10);
    rect(130, 50, 10, 10);
    rect(150, 50, 10, 10);
    rect(170, 50, 10, 10);
    rect(190, 50, 10, 10);
    rect(10, 70, 10, 10);
    rect(30, 70, 10, 10);
    rect(50, 70, 10, 10);
    rect(70, 70, 10, 10);
    rect(90, 70, 10, 10);
    rect(110, 70, 10, 10);
    rect(130, 70, 10, 10);
    rect(150, 70, 10, 10);
    rect(170, 70, 10, 10);
    rect(190, 70, 10, 10);
    
// CHAOS BLOCKS //
    rect(16, 150, 12, 15);
    rect(23, 198, 33, 17);
    rect(29, 234, 19, 36);
    rect(15, 322, 56, 47);
    rect(47, 366, 39, 20);
    rect(56, 440, 17, 36);
    rect(110, 465, 33, 17);
    rect(256, 456, 56, 13);
    rect(568, 388, 65, 40);
    rect(138, 459, 39, 20);
    rect(788, 469, 45, 5); 
    rect(250, 250, 20, 32);
    rect(623, 234, 19, 11);
    rect(555, 450, 54, 52);
    rect(690, 311, 50, 13);
    rect(335, 440, 71, 50);
    rect(770, 365, 40, 48);
    rect(458, 233, 8, 68);
    rect(169, 399, 46, 54);
    rect(713, 412, 36, 63);
    
    
stroke(0);
strokeWeight(10);
float ly = 0.0;
float lx = 413.0;
while (lx < width)
{
  float nextX = lx + random(3);
  float nextY = ly + random(30);
  line(lx, ly, nextX, nextY);
  ly = nextY;
  lx = nextX;  
}

stroke(0);
strokeWeight(10);
float bly = 0.0;
float blx = 92.0;
while (blx < width)
{
  float bnextX = blx + random(3);
  float bnextY = bly + random(30);
  line(blx, bly, bnextX, bnextY);
  bly = bnextY;
  blx = bnextX;  
}

stroke(0);
strokeWeight(10);
float cly = 0.0;
float clx = 214.0;
while (clx < width)
{
  float cnextX = clx + random(3);
  float cnextY = cly + random(30);
  line(clx, cly, cnextX, cnextY);
  cly = cnextY;
  clx = cnextX;  
}

stroke(0);
strokeWeight(10);
float dly = 0.0;
float dlx = 298.0;
while (dlx < width)
{
  float dnextX = dlx + random(3);
  float dnextY = dly + random(30);
  line(dlx, dly, dnextX, dnextY);
  dly = dnextY;
  dlx = dnextX;  
}

stroke(0);
strokeWeight(10);
float ely = 0.0;
float elx = 505.0;
while (elx < width)
{
  float enextX = elx + random(3);
  float enextY = ely + random(30);
  line(elx, ely, enextX, enextY);
  ely = enextY;
  elx = enextX;  
}

stroke(0);
strokeWeight(10);
float fly = 0.0;
float flx = 619.0;
while (flx < width)
{
  float fnextX = flx + random(3);
  float fnextY = fly + random(30);
  line(flx, fly, fnextX, fnextY);
  fly = fnextY;
  flx = fnextX;  
}

stroke(0);
strokeWeight(10);
float gly = 0.0;
float glx = 711.0;
while (glx < width)
{
  float gnextX = glx + random(3);
  float gnextY = gly + random(30);
  line(glx, gly, gnextX, gnextY);
  gly = gnextY;
  glx = gnextX;  
}

stroke(0);
strokeWeight(1);
float ply = 242.0;
float plx = 000.0;
while (ply < width)
{
  float pnextX = plx + noise(30);
  float pnextY = ply + noise(30);
  line(plx, ply, pnextX, pnextY);
  ply = pnextY;
  plx = pnextX;  
}




strokeWeight(1);

}


