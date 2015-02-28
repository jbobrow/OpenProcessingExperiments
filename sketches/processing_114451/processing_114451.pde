

SpriteObject night;
SpriteObject space;
SpriteObject sun;
SpriteObject water;

float counter;
float a = 425;
float b = 420;
float c = 75;
float d = 70;
float e = 0;
float f = -5;
float g = -150;
float h = -155;
float aa = 240;
float bb = 235;
float cc = 90;
float dd = 85;
float ee = 0;
float ff = -5;
float gg = -150;
float hh = -155;
float aaa = 360;
float bbb = 355;
float ccc = 210;
float ddd = 205;
float eee = 0;
float fff = -5;
float ggg = -150;
float hhh = -155;
float i = 150;
float j = 50;
float k = 10;
float l = 70;



void setup()
{
  size(500, 500);
  frameRate(12);
  
  night = new SpriteObject("NightSky.jpg");
  night.x = width/2;
  night.y = height/2;
  space = new SpriteObject("Space.jpg");
  sun = new SpriteObject("Sun.jpg");
  water = new SpriteObject("Underwater.jpg");

}

void draw()
{
  counter ++;
 
  if (counter > 0)
  {
    night.render();
  }
  
    if (counter < 48)
  {
    fill(255); 
    textSize(50);
    text("FIGHT", 180, 200);
  }

  
  if (counter < 60)
  {
  }
     fill(#9B732A);
  rect(-10, 420, 520, 90);
  fill(#AF822C);
  rect(-10, 400, 520, 20);
  rect(125, 380, 20, 40);
  rect(250, 380, 20, 40);
  rect(375, 380, 20, 40);
  rect(-1, 380, 20, 40);
  rect(499, 380, 20, 40);
  
  if (counter > 60)
  {
    fill(255); 
    textSize(20);
    text("I don't want to fight!", 280, 360);
  }
  
  if (counter < 96)
  {
     fill(255, 0, 0);
  ellipse(a, 400, 50, 50);
  rect(b, 400, 10, 70); 
  fill(0, 0, 255);
  noStroke();
  ellipse(c, 400, 50, 50);
  rect(d, 400, 10, 70);
  }
  
  if (counter > 96)
  {
  fill(255, 0, 0);
  ellipse(a, 400, 50, 50);
  rect(b, 400, 10, 70); 
  fill(0, 0, 255);
  noStroke();
  ellipse(c, 400, 50, 50);
  rect(d, 400, 10, 70);
  a = a + 10;
  b = b + 10;
  c = c + 10;
  d = d + 10;
  }
  
  if (counter > 144)
  {
    space.render();
  }
  
  if (counter > 156)
  {
    fill(255, 0, 0);
    ellipse(e, 400, 50, 50);
    rect(f, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(g, 400, 50, 50);
    rect(h, 400, 10, 70);
    e = e + 10;
    f = f + 10;
    g = g + 10;
    h = h + 10;
  }
  
  if (counter > 180)
  {
    space.render();
  }
  
    if (counter > 180)
  {
    fill(255, 0, 0);
    ellipse(240, 400, 50, 50);
    rect(235, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(90, 400, 50, 50);
    rect(85, 400, 10, 70);
  }
  
  if (counter > 180)
  {
    fill(255); 
    textSize(20);
    text("How did we get into space?", 160, 360);
  }
  
  if (counter > 204)
  {
    space.render();
  }
  
      if (counter > 204)
  {
    fill(255, 0, 0);
    ellipse(240, 400, 50, 50);
    rect(235, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(90, 400, 50, 50);
    rect(85, 400, 10, 70);
  }
   
   if (counter > 204)
  {
    fill(255); 
    textSize(30);
    text("Roar", 75, 350);
  }
  
    if (counter > 228)
  {
    space.render();
  }
  
  if (counter > 228)
  {
    fill(255, 0, 0);
    ellipse(aa, 400, 50, 50);
    rect(bb, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(cc, 400, 50, 50);
    rect(dd, 400, 10, 70);
    aa = aa + 10;
    bb = bb + 10;
    cc = cc + 10;
    dd = dd + 10;
  }
  
  if (counter > 264)
  {
    sun.render();
  }
  
  if (counter > 276)
  {
    fill(255, 0, 0);
    ellipse(ee, 400, 50, 50);
    rect(ff, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(gg, 400, 50, 50);
    rect(hh, 400, 10, 70);
    ee = ee + 10;
    ff = ff + 10;
    gg = gg + 10;
    hh = hh + 10;
  }
  
    if (counter > 312)
  {
    sun.render();
  }
  
  if (counter > 312)
  {
    fill(255, 0, 0);
    ellipse(360, 400, 50, 50);
    rect(355, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(210, 400, 50, 50);
    rect(205, 400, 10, 70);
  }
  
  if (counter > 313)
  {
    fill(255); 
    textSize(15);
    text("How are we not burning right now?", 225, 360);
  }
  
      if (counter > 336)
  {
    sun.render();
  }
  
    if (counter > 337)
  {
    fill(255); 
    textSize(30);
    text("Fight me!", 150, 350);
  }
  
  if (counter > 336)
  {
    fill(255, 0, 0);
    ellipse(aaa, 400, 50, 50);
    rect(bbb, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(ccc, 400, 50, 50);
    rect(ddd, 400, 10, 70);
    aaa = aaa + 10;
    bbb = bbb + 10;
    ccc = ccc + 10;
    ddd = ddd + 10;
  }
  
  if (counter > 360)
  {
    water.render();
  }
  
  if (counter > 360)
  {
  fill(255, 0, 0);
  ellipse(eee, 400, 50, 50);
  rect(fff, 400, 10, 70); 
  fill(0, 0, 255);
  noStroke();
  ellipse(ggg, 400, 50, 50);
  rect(hhh, 400, 10, 70);
  eee = eee + 10;
  fff = fff + 10;
  ggg = ggg + 10;
  hhh = hhh + 10;
  }
  
  if (counter > 390)
  {
    water.render();
  }
  
  if (counter > 390)
  {
    fill(255, 0, 0);
    ellipse(300, 400, 50, 50);
    rect(295, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(150, 400, 50, 50);
    rect(145, 400, 10, 70);
  }
  
  if (counter > 390)
  {
    fill(255); 
    textSize(20);
    text("I just do not get this world.", 240, 280);
  }
  
    if (counter > 420)
  {
    water.render();
  }
  
    if (counter > 420)
  {
    fill(255, 0, 0);
    ellipse(300, 400, 50, 50);
    rect(295, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(150, 400, 50, 50);
    rect(145, 400, 10, 70);
  }
  
    if (counter > 420)
  {
    fill(255); 
    textSize(30);
    text("DIE", 150, 350);
  }
  
  if (counter > 432)
  {
    water.render();
  }
  
      if (counter > 432)
  {
    fill(255, 0, 0);
    ellipse(300, 400, 50, 50);
    rect(295, 400, 10, 70); 
    fill(0, 0, 255);
    noStroke();
    ellipse(150, 400, j, j);
    rect(145, 400, k, l);
    j = j + 10;
    k = k + 10;
    l = l + 10;
  }
  
  if (counter > 444)
  {
    fill(0, 0, 255);
    ellipse(i, 400, 20, 20);
    i = i + 10;
  }

  fill(#9B732A);
  rect(-10, 450, 520, 90);
  
  if (counter > 500)
  {
    background(0);
        fill(255); 
    textSize(30);
    text("Fin", 245, 250);
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



