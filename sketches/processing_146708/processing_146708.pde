
int sQs = 20;

Dot[][] dots = new Dot[sQs][sQs];
int m;
int n;
int o;
int p;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  for (int i = 0; i < sQs; i++)
  for (int j = 0; j < sQs; j++)
    dots[i][j] = new Dot((i*500/sQs)+50,(j*500f/sQs)+50,1,1,int(random(255)), int(random(255)), int(random(255)), 10, 10, 10);
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
  fill(255,255,255,20);
  rect(0,0,width*2,height*2);  
  stroke(0,0,0,100);
  m=int(random(26767)%sQs);
  n=int(random(27878)%sQs);
  o=int(random(27878)%sQs);
  p=int(random(27878)%sQs);
  line(dots[m][n].position.x,dots[m][n].position.y,dots[o][p].position.x,dots[o][p].position.y);
  ellipse(dots[m][n].position.x,dots[m][n].position.y,15,15);
  fill(0,0,0);
  ellipse(dots[o][p].position.x,dots[o][p].position.y,5,5);
  dots[m][n].position.x += (dots[o][p].position.x-dots[m][n].position.x)*0.5;
  dots[m][n].position.y += (dots[o][p].position.y-dots[m][n].position.y)*0.5;
  
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
    Bcolor.x += random(-3,3);
    Bcolor.y += random(-3,3);
    Bcolor.z += random(-3,3);
    position.x+= random(-.5,.5);
    position.y+= random(-.5,.5); 
  }
  
  void display() {
    noStroke();
    fill (Bcolor.x, Bcolor.y, Bcolor.z, 30);
    ellipse (position.x, position.y, quip, ripp);
    fill (0,0,0,5);
    ellipse (position.x+2, position.y+2, quip/2, ripp/2);
  }
  
  void awayFrom(float x, float y) {
    float falloff = dist(mouseX, mouseY, position.x, position.y)*0.1;
    falloff *= falloff;
    position.x += (position.x-x)/falloff;
    position.y += (position.y-y)/falloff;
  }
}
