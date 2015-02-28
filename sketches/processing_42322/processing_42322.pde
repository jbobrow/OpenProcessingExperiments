
/*
JUSTIN LEE
MY IDEA WAS HERE FIRST. I WIN. PLEASE CLICK LIKE. YOU KNOW YOU WANT TO.
*/
Rectangle[] s;

int controls = 2500;

void setup()
{
  size(400, 300);
  smooth();
  s = new Rectangle[controls];
  
  for( int i = 0; i < controls; i++)
  {
    s[i] = new Rectangle();
    s[i].X = random(width  - s[i].r);
    s[i].Y = random(height  - s[i].r);
    s[i].speedx = s[i].speedy = round(random(1,6));
    s[i].r = random(1, 4);
    s[i].u = false;
    s[i].d = true;
  }
}

void draw()
{
  background(0);
  //click mouse to scatter the dots
  if(mousePressed)
  {
    fill(256,256,256);
  }
  else
  {
    fill(#F58311);
  }
  //press w to subtract the blurry
  if(keyPressed)
  {
    if(key == 'w'){
    controls+=-5;}
  }
  for( int i = 0; i < controls; i++)
  {
    s[i].show();
    s[i].run();
    //s[i].run2();

  }
  
}

/*
Couldn't find the like button huh? TROLLED
*/

