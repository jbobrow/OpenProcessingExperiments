
import ddf.minim.*;

int l_c1x = 50;
int l_c1y = 50;
int centerX;
int centerY;
int distance;
int rad = 1;
float initX,initY;
float mainAngle = 0;

//--- Audio stuff---
Minim minim;
AudioInput snd;
float snd_level;
//----------

BHandle[] bhan = new BHandle[1];

void setup()
{
  size(750,750);
  smooth();
  centerX = height/2;
  centerY = width/2;
  bhan[0] = new BHandle(centerX-200,centerY-250,centerX,centerY,100);
  minim = new Minim(this);
  snd = minim.getLineIn(Minim.STEREO, 512);
  frameRate(30);

}


void draw()
{  
  fill(255,30);
  //background(255);
  rect(0,0,width,height);
  ellipse(centerX,centerY, 20,20);
  noFill();
  snd_level =snd.mix.level()*70;
  if(bhan.length > 200)
    snd_level= 0;
    
  if(mousePressed)
    snd_level = random(5,30);

  initX = centerX + cos(radians(mainAngle))*rad;
  initY = centerY + sin(radians(mainAngle))*rad;
  strokeWeight(10);
  point(initX,initY);

  bhan[0].handle();
  bhan[0].render();
  strokeWeight(1);
  beginShape();
  vertex(centerX, centerY); // first point
  bezierVertex(centerX,centerY,bhan[0].v1.x,bhan[0].v1.y,bhan[0].center.x, bhan[0].center.y);
  
  for(int i = 1; i < bhan.length; i++){
    if(snd_level > 5)
      bhan[i].d = int(snd_level*7);    
    bhan[i].handle();
    bhan[i].render();
    bezierVertex(bhan[i-1].v2.x,bhan[i-1].v2.y,bhan[i].v1.x,bhan[i].v1.y,bhan[i].center.x, bhan[i].center.y);
  }

  println("frameRate-->" + frameRate);
  println("arraySize-->" + bhan.length);
  endShape();
  if(snd_level> 5){
    mainAngle = mainAngle + snd_level*3;
    rad = rad+int(snd_level/5);
    BHandle h = new BHandle(int(random(snd_level)),int(random(snd_level*100)),int(initX),int(initY), int(random(snd_level*-1,snd_level*10)));
    bhan = (BHandle[]) append(bhan,h);
    println("snd_level > 1");
  }
  else
  {
    if(rad > 5)
      rad = rad-1;
  }
}

//void mousePressed()
//{
//  saveFrame("bezierArray--####.jpg");
//}

class BHandle
{
  PVector v1;
  PVector v2;
  PVector center;
  float angle = random(90);
  float acc = random(10);
  float angle2;
  int d;
  int t = 255;

  BHandle(int c1x, int c1y, int x_, int y_, int d_)
  {
    v1 = new PVector(c1x,c1y);

    center = new PVector(x_, y_);
    d = d_;

  }

  void handle()
  {
    //println("v1 --> "+ v1);
    //println("v2 -->" + v2);
    angle = angle + acc;
    if(acc >= 2)
      acc = acc - .1;
    if(d > 30)
      d = d -1;
    angle2 = (angle-180);
    v1.add(center);
    v1= new PVector(center.x + cos(radians(angle))*d, center.y + sin(radians(angle))*d);
    v2 = new PVector(center.x + cos(radians(angle2))*d, center.y + sin(radians(angle2))*d);
    if(angle>=360)
      angle = 0;

  }
  void render()
  {
    if(t>50)
      t = t - 5;
    pushStyle();
    strokeWeight(1);
    stroke(0,0,t,t);
    line(v1.x, v1.y, v2.x, v2.y);
    rectMode(CENTER);
    rect(center.x, center.y, 3,3);
    ellipse(v1.x,v1.y,5,5);
    ellipse(v2.x,v2.y,5,5);
    popStyle();
  }
}

