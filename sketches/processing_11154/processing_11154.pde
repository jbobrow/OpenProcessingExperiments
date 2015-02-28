
int scanLength = 50;
boolean darkmode = true;

class Dot{
  PVector loc;
  color c;
  float radius;
  
  Dot(PVector _loc, color _c, int _radius){
    loc = _loc;
    c = _c;
    radius = _radius;
  }
  
  public Dot(){
    loc = new PVector(random(width),random(height));
    c = color(random(255),255,255);
    radius = 5;
  }
  
  public void draw(){
    fill(c);
    ellipse(loc.x, loc.y, radius, radius);
  }
  
  public void pulse(){
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(loc);
    float curH = hue(c);
    if(!darkmode)c = color(curH,255,map(mouse.mag(),0,scanLength,0,255));
    else if(darkmode)c = color(map(mouse.mag(),0,sqrt(width * width + height * height),0,255),255,255 - map(mouse.mag(),0,scanLength,0,255));
    radius = map(mouse.mag(),0,25,0,10);
  }
}


int num = 2000;

Dot[] dots = new Dot[num];

void setup(){
  noStroke();
  size(200,200,P2D);
  colorMode(HSB);
  for(int i = 0; i < num; i++){
    dots[i] = new Dot();
  }
}

void draw(){
  background(255,0,0);
  for(int i = 0; i < num; i++){
    dots[i].pulse();
    dots[i].draw();
  }
}

void mouseClicked(){
  for(int i = 0; i < num; i++){
    dots[i].c = color(random(255),255,255);
  }
  println(darkmode + "");
  if(darkmode)darkmode = false;
  else if(!darkmode)darkmode = true;
}

