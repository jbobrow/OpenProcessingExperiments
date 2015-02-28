
//Paint with a swarm
// original by @digehode


class Blip {
  float xpos,ypos;
  float dx, dy;
  float lxpos,lypos;
  Blip (float x, float y) {  
    ypos = y;
    xpos=x;
    dx=0;
    dy=0;
    lxpos=0;
    lypos=0;
  }


  void update() {
    dx+=(x-xpos)/100;
    dy+=(y-ypos)/100;

    dx+=random(-2,2);
    dy+=random(-2,2);

    // dampen the speed if the
    // swarm is far away, otherwise
    // it reaches the mouse too soon
    if(dist(dx,dy,0,0)>10){
      dx*=0.90;
      dy*=0.90;
    }

    lxpos=xpos;
    lypos=ypos;

    xpos+=dx;
    ypos+=dy;

fill(mouseX-dy,mouseY,random(0,255),random(0,255));
//line(lxpos,lypos,xpos,ypos);
//triangle(lxpos,lypos,xpos,ypos,lxpos+10,lypos+10);
ellipse(lxpos, lypos, tan(xpos), tan(ypos/100));
  }
}

float x=0;
float y=0;
int maxblips=40;

Blip[] blips=new Blip[maxblips];
void setup() {
  smooth();
  size(920,500);
  background(255);
  for(int i=0;i<maxblips;i++)
    blips[i]=new Blip(random(width),random(height));
}

  
void draw() {  
  //noStroke();
  //fill(255,99);
  //rect(0,0,width,height);
  
  //stroke(200);
  x=mouseX;
  y=mouseY;
  fill(y-mouseX,x-mouseY,random(0,255),random(0,255));
  //rect(mouseX,mouseY, 10,10);

  for(int i=0;i<maxblips;i++)  {
    blips[i].update();
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
