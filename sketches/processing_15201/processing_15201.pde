
int xpos;
int ypos;

void setup()

{

  size(600,600);
  smooth();
}
  
void draw()

{

  background(255);  
  xpos = width/2;
  ypos = height/2;
  
//  xpos = mouseX;
//  ypos = mouseY;


int r =int(random(1,200));
 frameRate(map(r,1,200,1,10));
 

star(150,150,10,5,50,1,200);
star(150,300,20,60,60,2,10);
star(150,r,30,r,7,3,r);
star(300,150,40,80,8,4,200);
star(300,r,50,9,90,5,r);
star(300,450,r,100,100,r,10);
star(450,150,70,11,11,7,r);
star(450,r,80,50,12,8,20);
star(450,450,90,130,r,9,r);
}

void mousePressed ()
{background (255);
int r =int(random(1,200));
star(mouseX,mouseY,r,r,r,r,r);}


void mouseDragged()
{background (255);
int r =int(random(1,200));
star(mouseX,mouseY,r,r,r,r,r);}


void star(int x, int y, int s, int xoff, int yoff, int w, int o)
{
  
  stroke(s,o);
  strokeWeight(w);
line(x, y +50, x, y);
line(x-xoff, y+yoff, x, y);
line(x+xoff, y+yoff, x, y);
line(x-xoff, y- (yoff+20), x, y);
line(x-xoff, y + 2*yoff, x, y);
  
 }

