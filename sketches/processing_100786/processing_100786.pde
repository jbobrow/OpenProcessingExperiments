
//square et image

PImage img;


void setup()
{
size (1400,1000);
img = loadImage("jmb.jpg");// prendre aussi d' autres images
}

void draw()

{
image(img,mouseX,mouseY,random(0,50),random(0,50));// on peut changer les 4 valeurs
}


void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");
}


