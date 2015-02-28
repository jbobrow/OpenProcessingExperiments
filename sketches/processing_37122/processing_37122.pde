
//press space to reset
PFont font;

float dx,dy;
float dr,dg,db;
float r=random(256),g=random(256),b=random(256);
float redX, blueX, greenX;



void setup()
{

  size(500,500);
  smooth();
  background(0);
  font = loadFont("Menlo-Italic-48.vlw");
}

void draw()
{
  colorSelect();
  drawing();
  reset();
}


void drawing()
{
  cursor();

  dr=dr+.0029;
  dg=dg+.003;
  db=db+.0028;


  if(mouseY>60)
  {
    r+=noise(dr)-noise(dg);
    g+=noise(dg)-noise(db);
    b+=noise(db)-noise(dr);
    r= constrain(r,0,255);
    g=constrain(g,0,255);
    b=constrain(b,0,255);
  }

  dx = mouseX - pmouseX;
  dy = mouseY - pmouseY;

  stroke(r,g,b);
  strokeWeight(abs(40-abs((dx+dy)/2)));

  if (mousePressed)
  {
    if(mouseY>65)
    {
      line(pmouseX,pmouseY,mouseX,mouseY);
      noCursor();
    }
  }
}

void colorSelect()
{
  redX= map(r,0,255,100,355);
  greenX = map(g,0,255,100,355);
  blueX = map(b,0,255,100,355);
  
  noStroke();
  fill(0);
  rect(0,0,width,60);

  fill(255);
  textFont(font,12);
  textAlign(CENTER);
  text("Red",60,25);
  text("Green",60,40);
  text("Blue",60,55);

  text("Press Space Bar to Erase Drawing",250,10);


  fill(200);
  rect(100,15,255,10);
  rect(100,30,255,10);
  rect(100,45,255,10);

  fill(100);
  rect(redX,15,5,15);

  if(mouseX>99 && mouseX<356 && mouseY>15 && mouseY< 25)
  {
    if(mousePressed)
    {
      r = mouseX-100;
    }
  }

  fill(100);
  rect(greenX,30,5,15);
  if(mouseX>99 && mouseX<356 && mouseY>30 && mouseY< 40)
  {
    if(mousePressed)
    {
      g = mouseX-100;
    }
  }

  fill(100);
  rect(blueX,45,5,15);
  if(mouseX>99 && mouseX<356 && mouseY>45 && mouseY< 55)
  {
    if(mousePressed)
    {
      b= mouseX-100;
    }
  }
}

void reset()
{
  if(keyPressed)
  {
    if(key == ' ')
    {
      background(0);
    }
  }
}


