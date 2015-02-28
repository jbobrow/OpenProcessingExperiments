
int _width,_height,minX,minY,maxX,maxY;
Mountain mountain;
Mountain mountain2;
TreeLayer trees;
Sky sky;
UFO ufo;
UFO ufo2;

void setup()
{
  minX = 0;
  minY = 0;
  maxX = 640;
  maxY = 480;
  _width = maxX - minX;
  _height = maxY - minY;
  size(maxX,maxY);

  mountain = new Mountain(32,1);
  mountain2 = new Mountain(128,3);
  trees = new TreeLayer(255,15);
  sky = new Sky(128);
  ufo = new UFO(64,.25,6);
  ufo2 = new UFO(32,.5,15);
}

void draw()
{
  background(0);
  sky.draw();
  ufo.draw();
  ufo2.draw();
  mountain.draw();
  mountain2.draw();
  trees.draw();
}

class Mountain
{
  int minheight,maxheight,minwidth,maxwidth,speed;
  PVector[] points;
  int r,g,b;
  int q;

  Mountain(int g, int speed)
  {
    this.q = 10;
    this.points = new PVector[q];
    this.minheight = round(_height / 4);
    this.maxheight = round(3 * _height / 4);
    this.minwidth = round(2 * _width / points.length);
    this.maxwidth = round(_width / 2);
    this.speed = speed;
    this.r = 0;
    this.g = g;
    this.b = 0;
 
    int prevX;
    
    points[0] = new PVector(-round(random(30,100)),round(random(this.minheight,this.maxheight)),0);
    for(int i = 1; i < q; i++)
    {
      prevX = int (this.points[i - 1].x);
      this.points[i] = new PVector(round(random(prevX+this.minwidth,prevX+this.maxwidth)),round(random(this.minheight,this.maxheight)),0);
    }
  }
  
  void draw()
  {
    int i;

    fill(0);
    strokeWeight(1);
    stroke(this.r,this.g,this.b);
    beginShape();
    vertex(this.points[0].x,maxY);
    for(i = 0; i < this.q; i++)
    {
      vertex(this.points[i].x,this.points[i].y);
      this.points[i].x -= this.speed;
    }
    i--;
    vertex(this.points[i].x,maxY);
    endShape(CLOSE);
    if(this.points[1].x < minX)
    {
      for(i = 1; i < this.q; i++)
        this.points[i-1] = this.points[i];
      i--;
      this.points[i] = new PVector(round(random(this.points[i-1].x+this.minwidth,this.points[i-1].x+this.maxwidth)),round(random(this.minheight,this.maxheight)),0);
    }
  }
}

class Tree
{
  int x,y,width,height,g;
  
  Tree(int x, int y, int width, int height, int g)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.g = g;
  }
}
class Moon
{
  int x,y,diam,g;
  
  Moon(int x, int y, int diam, int g)
  {
    this.x = x;
    this.y = y;
    this.diam = diam;
    this.g = g;
  }
}

class TreeLayer
{
  int minheight,maxheight,minwidth,maxwidth,mindistance,minposy,maxdistance,maxposy,speed;
  Tree[] points;
  int r,g,b;
  int q;

  TreeLayer(int g, int speed)
  {
    this.q = 10;
    this.points = new Tree[q];
    this.minheight = round(_height/15);
    this.maxheight = round(_height/7);
    this.minwidth = round(this.minheight/2);
    this.maxwidth = this.minheight;
    this.maxposy = _height - round(_height/7);
    this.minposy = _height - round(2*_height/7);
    this.maxdistance = _width * 2;
    this.mindistance = 0;
   
    this.speed = speed;
    this.r = 0;
    this.g = g;
    this.b = 0;
 
    int prevX;
    
    points[0] = new Tree(round(random(minX+this.mindistance,minX+this.maxdistance)),
                          round(random(this.minposy,this.maxposy)),round(random(this.minwidth,this.maxwidth)),round(random(this.minheight,this.maxheight)),
                          round(random(0,this.g/2)));
    for(int i = 1; i < q; i++)
    {
      prevX = int (this.points[i - 1].x);
      this.points[i] = new Tree(round(random(prevX+this.mindistance,prevX+this.maxdistance)),
                          round(random(this.minposy,this.maxposy)),round(random(this.minwidth,this.maxwidth)),round(random(this.minheight,this.maxheight)),
                          round(random(0,this.g/2)));
    }
  }
  
  void draw()
  {
    int i;

    strokeWeight(3);
    stroke(this.r,this.g,this.b);
    rectMode(CORNER);
    for(i = 0; i < this.q; i++)
    {
      fill(0,this.points[i].g,0);
      rect(this.points[i].x,this.points[i].y,this.points[i].width,this.points[i].height);
      this.points[i].x -= this.speed;
    }
    if(this.points[1].x < minX)
    {
      for(i = 1; i < this.q; i++)
        this.points[i-1] = this.points[i];
      i--;
      this.points[i] = new Tree(round(random(this.points[i-1].x+this.mindistance,this.points[i-1].x+this.maxdistance)),
                          round(random(this.minposy,this.maxposy)),round(random(this.minwidth,this.maxwidth)),round(random(this.minheight,this.maxheight)),
                          round(random(0,this.g/2)));
    }
  }
}

class Sky
{
  PVector[] stars;
  Moon[] moons;
  int r,g,b;
  int q,qm;

  Sky(int g)
  {
    int moonMinDiam,moonMaxDiam,moonMaxY;
    moonMinDiam = round(_height/30);
    moonMaxDiam = round(_height/20);
    moonMaxY = round(_height/4);
    
    this.q = round(random(50,100));
    this.stars = new PVector[q];
    this.qm = round(random(1,3));
    this.moons = new Moon[qm];
    this.r = 0;
    this.g = g;
    this.b = 0;
    for(int i = 0; i < this.q; i++)
    {
      g = this.g + round(random(-16,16));
      this.stars[i] = new PVector(round(random(minX,maxX)),round(random(minY,maxY)),g);
    }
    for(int i = 0; i < this.qm; i++)
    {
      g = this.g + round(random(-32,0));
      this.moons[i] = new Moon(round(random(minX,maxX)),round(random(0,moonMaxY)),round(random(moonMinDiam,moonMaxDiam)),g);
    }
  }
  
  void draw()
  {
    strokeWeight(1);
    for(int i = 0; i < this.q; i++)
    {
      stroke(this.r,this.b,this.stars[i].z);
      point(this.stars[i].x,this.stars[i].y);
    }
    for(int i = 0; i < this.qm; i++)
    {
      stroke(this.r,this.moons[i].g,0);
      strokeWeight(0.5);
      fill(this.r,this.moons[i].g/8,0);
      ellipse(this.moons[i].x,this.moons[i].y,this.moons[i].diam,this.moons[i].diam);
    }
  }
}

class UFO
{
  int minheight,maxheight,width,height,rarity;
  float speed;
  PVector pos;
  boolean visible;
  int g,b;
  float r,dr,cr;

  UFO(int r, float speed, int rarity)
  {
    this.pos = new PVector();
    this.minheight = round(_height / 10);
    this.maxheight = round(2 * _height / 10);
    this.speed = speed;
    this.r = r;
    this.g = 0;
    this.b = 0;
    this.cr = this.r - 16;
    this.dr = speed * 2;
    this.width = round(_width/30);
    this.height = round(_height/80);
    this.rarity = rarity * 1000;

    pos = new PVector(-(this.width*2),round(random(this.minheight,this.maxheight)),0);
    this.visible = false;
  }
  
  void draw()
  {
    if(!this.visible)
    {
      if(round(random(0,this.rarity)) < 10)
        this.visible = true;
    }
    
    if(this.visible)
    {
      strokeWeight(map(this.cr,this.r - 16,this.r + 16,1,2));
      if((this.cr < (this.r - 16)) || (this.cr > (this.r + 16)))
        this.dr = -this.dr;
      this.cr += this.dr;
      stroke(this.cr,this.g,this.b);
      fill(this.cr-16,this.g,this.b);
      rectMode(CENTER);
      rect(this.pos.x,this.pos.y,this.width,this.height);
      this.pos.x += this.speed;
      if(this.pos.x > round(maxX + (this.width * 2)))
      {
        this.visible = false;
        pos.x = -(this.width*2);
        pos.y = round(random(this.minheight,this.maxheight));
      }
    }
  }
}


