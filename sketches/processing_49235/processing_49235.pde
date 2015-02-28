
float angle, angle2;
float adding, adding2;
float addmax, addmax2;
float hoehe;
float y;
float modfreq;
float freq2 = 4;
float ampli = 8;
void setup()
{
  size(500, 500);
  adding = TWO_PI*4/width;
  addmax = adding*width;
  hoehe = width/8;
}


void draw()
{
  background(255);
  for(int x = 0; x <width+1; x++)
  {
    //adding = (TWO_PI*map(mouseY, height, 0, 0, 2))/width;
    //hoehe = width/map(mouseX, 0, width, 10, 1);
    angle+= adding;
    addmax = adding*width;
    if(angle > addmax) angle = 0;
    modfreq = ((sin(angle) * ampli) )+ ampli;
    
    adding2 = (TWO_PI*(modfreq+freq2))/width;
    angle2 += adding2;
    addmax2 = adding2*width;
    if(angle2 > addmax2) angle2 = 0;
    y = (sin(angle2) * (hoehe)) + hoehe+ (height/3);
    strokeWeight(5);
    point(x,y);
  }
}
    
    

