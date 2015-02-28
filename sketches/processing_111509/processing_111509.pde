
// The orinigal falling Matrix effect is downloaded from openprocessing, and is not my code.
// Matrix font is created by Norfok Incredible Font Design on http://www.dafont.com/matrix-code-nfi.font
// The Tengwar Annatar MordorLetters font is created by Johan Winge on http://www.thehutt.de/tolkien/fonts.html
//* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/57113*@* *
// The Devil Face from imageEvil is created by Eriviym on http://erivium.deviantart.com/art/Devils-face-85994133
int gridsize = 20;
int cont = 30;
String chrlist = "abcdefghijklmnopqrstuvwxyz0123456789";
ArrayList symbolhead = new ArrayList();

PImage myImage;
PImage imageEvil;
int imageGood = 0;
void setup()
{
    size(480, 640, P2D);
    background(0);

    myImage = requestImage("photo.JPG");
    imageEvil = requestImage("photoEvil4.jpg");
    
    SymbolHead letra = new SymbolHead((int) random(width/gridsize), -1); 
    symbolhead.add(letra);
}
 
void draw() 
{
    if (imageGood == 0)
    {
      textFont(loadFont("MatrixCodeNFI-16.vlw"), 22);
    }
    else 
    {
      textFont(loadFont("MordorLetters.vlw"), 22);
    }
    if (myImage.width > 0 && imageGood == 0)
    {
      image(myImage, 0, 0, width, height);
      filter(POSTERIZE, random(2, 20));
    }
    if (imageEvil.width > 0 && imageGood == 1)
    {
      image(imageEvil, 0, 0, width, height);
      filter(POSTERIZE, random(2, 20));
    }
    strokeWeight(2);
    int rnd = (int) random(50, 50);
        if (imageGood == 0)
        {
        stroke(rnd, 255, rnd);
        }
        else
        {
        stroke(255, rnd, rnd);
        }
    float x = 0;
    float y = 20;
    float prevX = x;
    float prevY = y;
    while (x < 960)
    {
      x += random(-10, 30);
      y += random(-10, 30);
      line(prevX, prevY, x, y);
      prevX = x;
      prevY = y;
    }
      float a = 960;
      float b = 0;
      float prevA = a;
      float prevB = b;
     while ( a > -20)
    {
      a += random(-30, 10);
      b += random(5, -10);
      line(prevA, prevB, a, b);
      prevA = a;
      prevB = b;
    }
 
    if ((int) random(0, cont) == 0) 
    {
        SymbolHead letra = new SymbolHead((int) random(width/gridsize), -1);
        symbolhead.add(letra);
        if(cont > 5) cont--;
    }
 
    for (int i = 0; i < symbolhead.size(); i++) {
        SymbolHead letra = (SymbolHead) symbolhead.get(i);
        letra.draw();
        if(!letra.alive) { symbolhead.remove(i); }
    }
}
 
char getRandomChar() 
{
    return chrlist.charAt((int) random(chrlist.length()));
}

void mouseClicked()
{
  if (imageGood == 0)
  {
    imageGood = 1;
  }
  else
  {
    imageGood = 0;
  }
}


