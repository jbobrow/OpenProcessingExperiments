
float r, b, g, gl, bl, rl;
int blocksize, w;



void mouseDragged()
{
  stroke(rl, bl, gl);
  strokeWeight(10);
  line(0, 0, mouseX-50, mouseY-50); 

  line(0, height, mouseX-50, mouseY+50); 

  line(width, 0, mouseX+50, mouseY-50); 

  line(width, height, mouseX+50, mouseY+50);
  if (gl>255 && bl>255 && rl>255 )
  {
    gl=gl-220;
    rl=rl-210;
    bl=bl-200;
  }
  else
  {
    gl=gl+30;
    rl=rl+20;
    bl=bl+10;
  }
} 

void setup()
{
  size(780, 800);
  noStroke();
  blocksize = 20;
  r=60;
  g=255;
  b=60;
  w=0;
}

void draw()
{
  noStroke();
  fill(0, 8);
  rectMode(CORNER);
  rect(0, 0, width, height);
  for (int i=0; i<1000; i++) 
  {
    rectMode(CENTER);
    fill(random(r-60, r), random(g-60, g), random(b-60, b));
    rect(mouseX+random(-50, 50), mouseY+random(-50, 50), 20, 20);
  }
  for (int y=0; y<height; y+=blocksize) 
  {
    for (int x=0; x<width; x+=blocksize) 
    {
      fill(random(0, 64), random(64), random(223), 30);
      rect(x, y, blocksize, blocksize);
    }
  }
  fill(random(160, 255), random(64), random(64), 30);
  text("Click to change colors, Drag for effect. By Edmond Chew", 160, 50);
}

void mouseClicked()
{
  if (g>r && g>b)
  {
    g=g-195;
    r=r+195 ;
  }
  else if (r>g && r>b)
  {
    r=r-195;
    b=b+195 ;
  }
  else if (b>r && b>g)
  {
    b=b-195;
    g=g+195 ;
  }
}


