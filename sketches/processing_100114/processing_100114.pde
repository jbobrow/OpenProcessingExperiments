


boolean gauche=false,droite=false;
PImage bground,sandman1;
int x,y;
void setup()
{
  size(400,266);
  bground = loadImage("bground.png");
  sandman1 = loadImage("sandman1.png");
  x=200;
  
  
}

void draw()
{
 
  background(bground);
  imageMode(CENTER);
  
  image(sandman1,x,y);
  if(gauche) x-=3;
  if(droite) x+=3;
  if(x>380) x=380;
  if(x<20) x=20;
  if(x<=338 && x>=257) y=197;
  else if(x<=158 && x>=62) y=183;
  else y=190;
  print(x);
 }
 
 
 void keyPressed ()
  {
    if(keyCode == LEFT) gauche=true;
    if(keyCode == RIGHT)droite=true;
    }

void keyReleased ()
{
  if(keyCode == LEFT) gauche=false;
  if(keyCode == RIGHT) droite=false;
}


