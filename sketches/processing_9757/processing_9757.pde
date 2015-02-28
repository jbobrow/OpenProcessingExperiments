
/*Libby Riefler er845@bard.edu
 Computer Landscaping
 Based on Mitchell Whitelaw's Harmony Web Remake*/

ArrayList history = new ArrayList(); 
float distthresh = 60; 
int numFrames = 6;
PImage[] images = new PImage[numFrames];
int frame = 0;

void setup()
{ 
  size(800, 500); 
  background(209, 200, 200);
  smooth(); 
  images [0] = loadImage("Picture 2.png");
  images [1] = loadImage("Picture 5.png");
  images [2] = loadImage("Picture 8.png");
  images [3] = loadImage("Picture 9.png");
  images [4] = loadImage("Picture 10.png");
  images [5] = loadImage("Picture 11.png");
}

void draw()//press any key other than e or t to stop drawing tools
{
  if (key== 'e')//draws foreground
  {
    ellipse(mouseX, mouseY, 30, 30);
    noStroke();
    fill(random(80, 90), 82, 70);
  }

  if (key== 't')//draws trees
  {
    frameRate(200);
    stroke(28, random(43, 63), 31); 
    strokeWeight(2);
    line(pmouseX, pmouseY,
    mouseX + random(-20, 20),
    mouseY + random(-20, 20));
  }
}

void mouseDragged()
{
  if (key== 'm')//draws mountains 
  {
    strokeWeight(1);
    stroke(66, 76, 111, 50);
    PVector d = new PVector(mouseX,mouseY,0); 
    history.add(0,d); 

    for (int p=0; p<history.size(); p++)
    { 
      PVector v = (PVector) history.get(p); 
      float joinchance = p/history.size() + d.dist(v)/distthresh; 
      if (joinchance < random(0.4))  line(d.x,d.y,v.x,v.y); 
    }
  }  

  if (key== 'M')//draws mountain shading
  {
    strokeWeight(4);
    stroke(114, 121, 143, 75);
    point(mouseX+random(-5,8), mouseY+random(-5,8));
  }

  if (key== 'T')//draws tree shadings
  {
    strokeWeight(2);
    stroke(83, 142, 72, 75);
    point(mouseX+(random(-5,10)), mouseY+(random(-5, 10)));
  }

  else if (key== 's')//draws sky
  {
    noStroke(); 
    if (mouseY <= 100)
      fill(random(200, 255), 50);
    if (mouseY >= 101 && mouseY <= 170)
      fill(random(180, 230), 80);
    if (mouseY >= 171 && mouseY <= 200)
      fill(random(180, 200), 100);  

    ellipse(mouseX, mouseY, random(25, 40), random(0, 40));
    ellipse(mouseX, mouseY, random(0, 25), random(5, 40));
    ellipse(mouseX+5, mouseY+5, random(5, 40), random(0, 25));
    ellipse(mouseX+5, mouseY+5, random(1, 6), random(6,8));
  }
}

void keyPressed()
{
  if (key== 'b') //draws birds at mouse location; fix: next img, blend
  {
    {
      frame = (frame+1) % numFrames;
      blend(images[frame], 0, 0, images[frame].width, images[frame].height, mouseX, mouseY, images[frame].width, images[frame].height, DARKEST);
    }
  }

  if (key == ' ') //clears sketch
  {
    background(209, 200, 200);
    history.clear(); 
  }
}



