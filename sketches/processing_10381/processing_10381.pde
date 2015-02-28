
import ddf.minim.*;
XMLElement xml;

int l_c1x = 50;
int l_c1y = 50;
int centerX;
int centerY;
int distance;
int rad = 1;
float initX,initY;
int yMove=0;
int pointsDraw;

//----XML stuff-----
int numSites, numShapes,totalPoints; 
float[][] x1;
float[][] y1 = new float[0][0];
int[] shapeArray;
int jMain, iMain;


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
  background(255);
  centerX = height/2;
  centerY = width/2;
  bhan[0] = new BHandle(0,0,0,0,0);
  minim = new Minim(this);
  snd = minim.getLineIn(Minim.STEREO, 512);
  //frameRate(25);
  xml = new XMLElement(this, "Untitled-1.svg");
  numSites = xml.getChildCount();

  shapeArray = new int[numSites];

  println("sh " + shapeArray.length);
  println("sh[0] " + shapeArray[0]);

  for (int i = 0; i < numSites; i++){
    numShapes = xml.getChild(i).getChildCount();
    shapeArray[i] = numShapes;
    println("shapeArray[i]"+ shapeArray[i]);
    totalPoints += numShapes;
  }
  println("totalPoints: " + totalPoints);
  println("numShapes: " + numShapes);

  x1 = new float[numSites][totalPoints];
  y1 = new float[numSites][totalPoints];

  for (int i = 0; i < numSites; i++){
    numShapes = xml.getChild(i).getChildCount();

    for (int j = 0; j < numShapes; j++){ 
      XMLElement kid = xml.getChild(i).getChild(j);
      x1[i][j] = kid.getFloatAttribute("x1");
      y1[i][j] = kid.getFloatAttribute("y1");

    }
  }

}


void draw()
{
  fill(255,120);
  //background(255);
  rect(0,0,width,height);
  noFill();
  translate(width/2,height/2);
  snd_level =snd.mix.level()*50;
//  if(mousePressed)
//    snd_level = random(5,30);

  initX = x1[iMain][jMain];
  initY = y1[iMain][jMain] + yMove;

  //println(initX + "<-- initX");

  strokeWeight(10);
  point(initX,initY);

  bhan[0].handle();
  //bhan[0].render();
  strokeWeight(1);

    beginShape();
    vertex(x1[0][0],y1[0][0]); // first point
    //bezierVertex(x1[0][0],y1[0][0],bhan[0].v1.x,bhan[0].v1.y,bhan[0].center.x, bhan[0].center.y);
    for(int i = 1; i < bhan.length; i++){
      if(snd_level > 5)
        bhan[i].d = int(snd_level*3);    
      bhan[i].handle();
      bhan[i].render();
      bezierVertex(bhan[i-1].v2.x,bhan[i-1].v2.y,bhan[i].v1.x,bhan[i].v1.y,bhan[i].center.x, bhan[i].center.y);
      
    }
  endShape(CLOSE);
  
  //println("jMain--> " + jMain +  " // shapeArray[iMain]: " + shapeArray[iMain]);

  if(snd_level> 3){
    BHandle h = new BHandle(int(random(snd_level)),int(random(snd_level*100)),int(initX),int(initY), int(random(snd_level*-1,snd_level*10)));
    bhan = (BHandle[]) append(bhan,h);


    if(jMain < shapeArray[iMain]){
      jMain +=1;
      pointsDraw += 1;

  }
  }

  if(jMain == shapeArray[iMain]){
    println(iMain);
    jMain = 0;
    if(iMain<shapeArray.length-1){
      iMain += 1;
    }
  }
  ///--- restart
  if(pointsDraw == totalPoints){
    yMove = yMove + 150;
    jMain = 0;
    iMain = 0;
    pointsDraw = 0;
//      noLoop();
  }
}
void mousePressed()
{
  saveFrame("helveticaCode-####.jpg");
}

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
    if(d > 0)
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
    if(t>20)
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

