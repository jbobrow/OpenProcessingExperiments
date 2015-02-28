
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}int [] speedX = {1,2,3,4,5};
int x1=40, x2=40, x3=40, x4=40, x5=40;
int r=127, g=127, b=127;
int rr;
int gr;
int br;

void setup()
{
  background(0);
  size(240,220);
}

void whitearea()
{
  stroke(0);
  fill(255);
  rect(20,0,200,200);
}
void draw()
{

  whitearea();
  fill(r,g,b);
  ellipse(x1,20,20,20);
  ellipse(x2,60,20,20);
  ellipse(x3,100,20,20);
  ellipse(x4,140,20,20);
  ellipse(x5,180,20,20);
  x1 = x1+speedX[0];
  x2 = x2+speedX[1];
  x3 = x3+speedX[2];
  x4 = x4+speedX[3];
  x5 = x5+speedX[4];
  if(mouseX<20||mouseX>220||mouseY>200)
  {
    rr = (int)random(-10,10);
    gr = (int) random(-10,10);
    br = (int) random(-10,10);
    r=r+rr;
    g=g+gr;
    b=b+br;
  }
  if(x4<20||x4>220)
  {
    speedX[3]=speedX[3]*-1;
  }
  if(x3<20||x3>220)
  {
    speedX[2]=speedX[2]*-1;
  }
  if(x2<20||x2>220)
  {
    speedX[1]=speedX[1]*-1;
  }
  if(x1<20||x1>220)
  {
    speedX[0]=speedX[0]*-1;
  }
  if(x5<20||x5>220)
  {
    speedX[4]=speedX[4]*-1;
  }
}
