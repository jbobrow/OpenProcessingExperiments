
//project 1: processing b-boy
//copyright kyree 2012 
//section 257-757
//Andrew ID kholmes
//music by M/A/R/R/S "Pump Up the Volume"

//instructions
//use the left and right arrows to spin the dancer horizontally
//use the up and down arrows to spin the dancer vertically
//use the space bar to spin him on the z-axis
//press the letter 's' to change his size
//press the letters 'l' and 'r' to move him left and right
//press the TAB key to make him stop



import ddf.minim.*;

AudioPlayer player;
Minim minim;

float a, k, x, y, z, dx, dy, dz;

void setup()
{
  size(800, 400, P3D);
  
  minim = new Minim(this);
  player = minim.loadFile("pumpupthevolume.mp3", 2048);
  player.play();

  x = 1;
  dx = 0;
  
  y = 1;
  dy = 0;
  
  z= 1;
  dz = 0;
  
  k = 100;
  
  a =width/2;
  
}


void draw()
{
  background(#C8D5DB);
  
  translate(a, height/2, 0);
  drawBboy();
  drawHeadphones();
  spinBboy();
  soundwaves();
}
 
  
void drawBboy()
{
  noStroke();
  fill(#A1ADA8);
  
  rotateX(radians(x));
  rotateY(radians(y));
  rotateZ(radians(z));

//head
  sphere(k);
  
//  pushMatrix();
//  translate(0, 0, -10);
//  sphere(k);
//  popMatrix();
 
//feet
  fill(#A1ADA8);
  ellipse(k,k, k, k/2);
  ellipse(-k,k, k, k/2);
  
}

void drawHeadphones()

{
  fill(255);
  pushMatrix();
  translate(-k+.1*k, -k/4, 0);
  sphere(k/2);
  popMatrix();

  pushMatrix();
  translate(k-.1*k, -.05*k, 0);
  sphere(k/2);
  popMatrix();

//eyes
  fill(0, 200);
  pushMatrix();
  translate(-k/4, -.05*k,k);
  sphere(k/7);
  popMatrix();  

  fill(0,255,0);
  pushMatrix();
  translate(-k/4, -.05*k,k);
  sphere(k/15);
  popMatrix();  
  
  fill(0, 200);
  pushMatrix();
  translate(k/4, -.05*k,k);
  sphere(k/7);
  popMatrix();  
  
  fill(0,255,0);
  pushMatrix();
  translate(k/4, -.05*k,k);
  sphere(k/15);
  popMatrix();  
  
}

void soundwaves() 
{
  float n = frameCount;
  for (int i =20; i< 300; i +=20) 
  {
    for (int j =5; j< 100; j +=j) 
    {
    noFill();
    stroke(255, 255, 255, 20);
    strokeWeight(5);
    arc(0, 0, (mouseX+i)/2, (mouseX+i)/2, radians(n+j+mouseY), radians(n+i+mouseY));
    rotate(radians(120));
    }
  }
}


void spinBboy()
{
  x = x + dx;
  y = y + dy;
  z = z + dz;
}

//dance controls
void keyPressed()
{
  if(keyCode == UP)
  {
    dx = dx + .1;
  }
  else if(keyCode == DOWN)
  {
    dx = dx - .1;
  }
  else if(keyCode == LEFT)
  {
    dy = dy + .1;
  }
  else if(keyCode == RIGHT)
  {
    dy = dy - .1;
  }
  
  else if(keyCode == ' ')
  {
    dz = dz - .1;
  }  
  
    else if(keyCode == TAB)
  {
    dx = 0;
    dy = 0;
    dz = 0;
  }
  
   else if(key == 's')
  {
    k = k - 1;
  }
  else if(key == 'l')
  {
    a = a - 1;
  }
  
  else if(key == 'r')
  {
    a = a+1;
  }
}


void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


