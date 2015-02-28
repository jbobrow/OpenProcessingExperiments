
int sQs = 20;

Dot[][] dots = new Dot[sQs][sQs];
int m;
int n;
int o;
int p;
PFont font;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER);
  font = loadFont("AvenirNext-Medium-9.vlw");
  textFont(font, 9);
  for (int i = 0; i < sQs; i++)
  for (int j = 0; j < sQs; j++)
    dots[i][j] = new Dot((i*500/sQs)+50,(j*500f/sQs)+50,1,1,(255-(i*12)), (255-(i*12)), (255-(i*6)-(j*6)), 10, 1, int(i));
}


void draw(){
  if(mousePressed)
  {
  for (int i = 0; i < sQs; i++)
  for (int j = 0; j < sQs; j++)
  {
    dots[i][j].awayFrom(mouseX, mouseY);
  }
  }
  fill(0,0,0,20);
  rect(0,0,width*2,height*2);  
  stroke(255,255,255,100);
  m=int(random(26767)%sQs);
  n=int(random(27878)%sQs);
  o=int(random(27878)%sQs);
  p=int(random(27878)%sQs);
  line(dots[m][n].position.x,dots[m][n].position.y,dots[o][p].position.x,dots[o][p].position.y);
  rect(dots[m][n].position.x,dots[m][n].position.y,15,15);
  fill(0,0,0);
  ellipse(dots[o][p].position.x,dots[o][p].position.y,5,5);
  dots[m][n].position.x += (dots[o][p].position.x-dots[m][n].position.x)*0.5;
  dots[m][n].position.y += (dots[o][p].position.y-dots[m][n].position.y)*0.5;
  fill(255,255,255);
  rect(dots[m][n].position.x,dots[m][n].position.y,20,20);
  
  for (int i = 0; i < sQs; i++)
  for (int j = 0; j < sQs; j++)
  {
    dots[i][j].update();
    dots[i][j].display();
  }
}

class Dot {
  PVector position;
  PVector velocity;
  PVector Bcolor;
  float quip;
  float ripp;
  float sipp;
  
  Dot(float x, float y, float a, float c, float r, float g, float b, float q, float z, float s) {
    position = new PVector(x, y);
    velocity = new PVector (a, c);
    Bcolor = new PVector(r,g,b);
    quip = q;
    ripp = z;
    sipp = s;
  }
  
  void update() {
    if(keyPressed)
    {
    ripp=20;
    }
    else
    {
    ripp=1;
    }
    Bcolor.x += random(-1,1);
    Bcolor.y += random(-1,1);
    Bcolor.z += random(-1,1);
    position.x+= random(-ripp/10,ripp/10);
    position.y+= random(-ripp/10,ripp/10); 
  }
  
  void display() {
    noStroke();
    fill (Bcolor.x, Bcolor.y, Bcolor.z, 30);
    rect (position.x, position.y, quip+10, quip+10);
    fill (255,255,255);
    text (int(sipp), position.x, position.y+4);
  }
  
  void awayFrom(float x, float y) {
    float falloff = dist(mouseX, mouseY, position.x, position.y)*0.1;
    falloff *= falloff;
    position.x += (position.x-x)/falloff;
    position.y += (position.y-y)/falloff;
  }
}
