

//done by Gottfried Beyreuther

PImage img;


void setup()
{
size (600,600);

img = loadImage("gbor01.jpg");
}

void draw()

{
 
  image(img,mouseX,mouseY,random(0,50),random(0,50));
}

void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");
}


