
  int n;
  int switchdir;
  int startsize;
  int sizedim;
  int x;
  int y;
  float hyp;
  int divi = 1;
  int layers = 1;
void setup()
{
  background(200);
  n = 1;
  switchdir = 0;
  startsize = 50;
  sizedim = 500;
  x = sizedim/2;
  y = sizedim/2;
  size(500, 500);

}

void draw()
{
  smooth();
  fill(random(255), random(255), random(255), 180);
  draw_this(n, x, y, startsize, startsize);
  hyp = 30;
  for(int i = 1; i < layers; i++)
  draw_in_circle(x, y, i*hyp, divi);
delay(200);
  if(mousePressed){
    switchdir++;
    if(switchdir %50 == 0)
    n=1;
    n++;}
    
    
}
void draw_in_circle(int x, int y, float hyp, int divi)
{
  if(random(1) == 0)
  fill(random(255), random(255), random(255), 55);
  ellipse(x, y, startsize, startsize);
  for(float f = 0.0; f < 2 * PI; f += PI/divi)
  {
    ellipse(x+hyp*cos(f), y+hyp*sin(f), startsize/2, startsize/2);
}
}

void draw_this(int n, int x, int y, int xdim, int ydim)
{
  if(n != 0){
    if(random(1) == 0)
  fill(random(255), random(255), random(255), 55);
  ellipseMode(RADIUS);
  ellipse(x, y, xdim, ydim);
    if(switchdir < 50){
  draw_this(n-1, x - xdim/2, y- ydim/2, xdim*11/12, ydim*11/12);}
  else if(50 < switchdir && switchdir < 100){
  draw_this(n-1, x + xdim/2, y - ydim/2, xdim*11/12, ydim*11/12);}
  else if(100 < switchdir && switchdir < 150){
  draw_this(n-1, x + xdim/2, y + ydim/2, xdim*11/12, ydim*11/12);}
  else if(150 < switchdir && switchdir < 200)
  {
  draw_this(n-1, x - xdim/2, y + ydim/2, xdim*11/12, ydim*11/12);} 
  //setup();
}
}

void keyPressed(){
  if(keyCode == UP)
  divi++;
  else if(keyCode == DOWN)
    if(divi > 1)
      divi--;
      else{}
  else if(keyCode == LEFT)
  if(layers > 0)
    layers--;
    else{}
    else if(keyCode == RIGHT)
    if(layers < 20)
    layers++;
    else{}
    else if(keyCode == SHIFT)
    setup();
}


