
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/21418*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// see also http://www.openprocessing.org/sketch/30861

//==========================================================
//  sketch:    PG_Magnetic
//  Edit scenery with magnetic sticks and show magnetic field
//  version:   v1.0  2014-11-11  initial release
//                   added: class Magnets
//                   improved: classes, Mouse input, keyboard input 
//             v1.1  2014-11-24  added colored fields
//  tags:      magnet, magnetic, plus, minus, vector, field, force
//==========================================================
/**  commands:  
 r  reset all magnets
 a  add magnet
 d  delete magnet 
 c  toggle colors
 v  toggle vectors
 s  save picture 'PG_Magnetic.png'
*/

boolean androidMode = false;
boolean viewColored = false;
boolean viewVectors = true;

//----------------------------------------------
//  startup routine
//----------------------------------------------
void setup()
{
/*
  orientation(PORTRAIT);
  androidMode = (displayWidth < displayHeight);   // important for Android!!!
  if (androidMode) 
    size (displayWidth, displayHeight);
  if (!androidMode)
*/
  size(640, 480);    // for Java + JavaScript

  smooth();
  int uWidth = int(width / unitSize)+1;
  int uHeight = int(height / unitSize)+1;
  textAlign(CENTER, CENTER);
  magnets = new Magnets(uWidth, uHeight);
  frameRate(30);
  mouseX = width/2;
  mouseY = height/2;
  textSize(14);
}
//----------------------------------------------------------
void draw() 
{
  background(255);
  fill(255);
  magnets.update();
  magnets.drawAll();
  
  fill(0);
  text(magnets.currMagnet + " magnets, 'r' clear all magnets, left mouse button to add & rotate,"
      + " right to remove a magnet." 
      ,width/2, height-10);
}
//----------------------------------------------------------
void keyPressed()
{
  //println (" keyPressed: Key="+key+" ("+int(key)+")  keyCode="+keyCode+ " CODED="+CODED);
  switch (key)
  {        case 'r':  magnets.clearAll();
    break; case 'd' : magnets.deleteOne();
    break; case  8 :  magnets.deleteOne();  // del key
    break; case 'a':  magnets.addOne();
    break; case ' ':  magnets.addOne();
    break; case 'c':  viewColored = !viewColored;
    break; case 'v':  viewVectors = !viewVectors;
    break; case 's':  save ("PG_Magnetic.png");
  }
}
//----------------------------------------------------------
void mousePressed() 
{
  if (mouseButton == RIGHT)
    magnets.deleteOne();
  else
    magnets.addOne();
}
//----------------------------------------------------------
void mouseReleased() 
{
  if (mouseButton == LEFT)
    magnets.addOne();
}


//----------------------------------------------------------
//  magnet.pde
//----------------------------------------------------------

// edit modes:
final int mm_move   = 0;   // move with mouse
final int mm_rotate = 1;   // position set, now rotate
final int mm_locked = 2;   // position and direction set

//==========================================================
//  class to handle a bar magnet
//==========================================================
class Magnet 
{
  VectorField vf;
  PVector pos, dir;        // position, direction 
  PVector posNeg, posPos;  // pole positions
  int mode = 0;            // current mode
  
  //--- constructor ---  
  Magnet(int w, int h, int unitSize)
  {
    vf = new VectorField(w,h, unitSize);
    pos = new PVector(0, 0);     // position of magnet
    posNeg = new PVector(0, 0);  // position of negative pole
    posPos = new PVector(0, 0);  // potition of positive pole
    dir = new PVector(200, 0);   // direction facing
  }
  
  //--- set magnet to mouse location ---  
  void update()
  {
    if (mode == mm_move) 
    {
      pos.x = mouseX;
      pos.y = mouseY;
    }
    
    // rotate magnet by mouse location (and set poles)
    if (mode == mm_rotate) 
    {
      dir.x = mouseX - pos.x;
      dir.y = mouseY - pos.y;
      if ((dir.x == 0.0) && (dir.y == 0.0))   // direction undefined ? 
        dir.x = 1.0;                          // horizontal orientation  
      dir.normalize();
      posNeg.x = posPos.x = dir.x;
      posNeg.y = posPos.y = dir.y;
      posNeg.mult(-poleSize*2);
      posPos.mult(poleSize*2);
      posNeg.add(pos);
      posPos.add(pos);
      vf.polarize(posPos, posNeg);
    }
  }

  //--- draw a magnet ---  
  void show()
  {
    // draw magnet
    float ps2 = poleSize*2;
    float ps4 = poleSize*4;
    stroke(0);
    strokeWeight(1);
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(dir.y, dir.x));
      fill(127,127);
      rect(-poleSize*2, -poleSize, ps4, ps2, 2);

      fill(255,111,111);   ellipse(+ps2, 0,poleSize, poleSize);  // + pol
      fill(111,111,255);   ellipse(-ps2, 0,poleSize, poleSize);  // - pol
    
      // draw pole signs
      if (mode > 0) 
      { 
        stroke (0,0,55);
        line(-ps2-3, 0, -ps2+3, 0);  // -
        stroke (55,0,0);
        line(ps2-3, 0, ps2+3, 0);    // +
        line(ps2, -3, ps2, +3);
      }
    popMatrix();
  }
  
}  // class Magnet


//----------------------------------------------------------
//  magnets.pde
//----------------------------------------------------------

final int poleSize = 10;   // magnet size is proportional increased by poleSize
final int unitSize = 12;   // each vector on a field is a "unit"

Magnets magnets;     // magnetic sticks

//==========================================================
//  class to handle many magnets
//==========================================================
class Magnets 
{
  int uWidth, uHeight;       // number of "units" that can fit in the screen
  int currMagnet = 0;        // current magnet index
  Magnet md;                 // current magnet
  ArrayList<Magnet> magnets; // uses ArrayList to handle all magnets
  VectorField masterField;   // each magnet has its own field, the master is for summarization
  
  //--- constructor ---
  Magnets(int unitWidth, int unitHeight)
  {
    uWidth = unitWidth;
    uHeight = unitHeight;
    masterField = new VectorField(uWidth, uHeight, unitSize);
    magnets = new ArrayList();
    magnets.add(new Magnet(uWidth, uHeight, unitSize));
  }
  
  //--- draw all magnets ---
  void drawAll()
  {
    for (int ni = 0; ni <= currMagnet; ni++) 
      magnets.get(ni).show();
  }
  
  //--- update the current magnet (or get a new one) ---
  void addOne()
  {
    Magnet cm = magnets.get(currMagnet);
    //println ("Magnets.addOne: " + currMagnet + ", m=" + m.mode);  
    if (cm.mode > 0) 
    {
      Magnet newMagnet = new Magnet(uWidth, uHeight, unitSize);
      magnets.add(newMagnet);
      update();
      currMagnet++;
      newMagnet.update();
    }
    cm.mode++;
  }
    
  //--- delete last magnet ---  
  void deleteOne()
  {
    int mc = magnets.size();
    //println ("Magnets.deleteOne: " + mc);
    if (mc <= 1)
    {
      magnets.get(currMagnet).mode = 0;
      return;
    }
    magnets.remove(mc-1);
    currMagnet--;
    magnets.get(currMagnet).mode = 0;
  }
  
  //--- clear all magnets ---  
  void clearAll()
  {
    //println ("Magnets.clearAll: ");
    magnets.clear();
    magnets.add(new Magnet(uWidth, uHeight, unitSize));
    currMagnet = 0;
  }
  
  //--- move all magnets ---
  private void move()
  {
    for (int i1 = 0; i1 < currMagnet; i1++)
    {
      Magnet m1 = magnets.get(i1);
      for (int i2 = i1+1; i2 < currMagnet; i2++) 
      {
        Magnet m2 = magnets.get(i2);
        float dist = PVector.dist(m1.pos, m2.pos);
        if (dist < 4*poleSize)
        {
          PVector moveVec = PVector.sub(m2.pos, m1.pos);
          
          if (moveVec.mag() == 0.0)
          { switch (currMagnet % 4)
            {        case 0:  moveVec.x = -1.0;
              break; case 1:  moveVec.x = 1.0;
              break; case 2:  moveVec.y = -1.0;
              break; case 3:  moveVec.y = 1.0;
            }
          }
          moveVec.normalize();
          moveVec.mult((4*poleSize - dist)*0.5);
          m1.pos.sub(moveVec);
          m2.pos.add(moveVec);
        }
      }
    }
  }
  
  //--- update current magnet and masterField ---  
  void update()
  {
    // update current magnet
    md = magnets.get(currMagnet);
    md.update();

    // summarize and show master field
    masterField.degauss();
    for (int ni = 0; ni < currMagnet; ni++) 
    {
      Magnet m = magnets.get(ni);
      masterField.add(m.vf);
    }
    md = magnets.get(currMagnet);
    if (md.mode > 0) masterField.add(md.vf);
    masterField.show();

    move();
  }
  
}   // class Magnets

//----------------------------------------------------------
//  vectorField.pde
//----------------------------------------------------------

//==========================================================
//  class to handle magnetic direction field
//==========================================================
class VectorField 
{
  int uw, uh;          // dimension 
  int vfSize;          // vector field size
  PVector[] v;         // vector field values
  int unitSize;        // unit size
  float halfU;         // half unit size
  
  //--- constructor ---  
  VectorField (int w, int h, int uSize)
  {
    uw = w;
    uh = h;
    vfSize = uw * uh;
    unitSize = uSize;
    halfU = unitSize / 2.0;
    v = new PVector[vfSize];
    for (int ni = 0; ni < vfSize; ni++) 
      v[ni] = new PVector(0,0);
  }
  
  //--- draw each arrow from center of each field "unit" ---
  void show() 
  {
    if (viewColored)  showColoredFields();
    if (viewVectors || (!viewVectors && !viewColored)) showFieldArrows();
  }

  //--- draw colorized fields ---
  void showColoredFields() 
  {
    colorMode (HSB, 255);
    noStroke();
    PVector tmp = new PVector();
    for (int yi=0; yi < uh; yi++)
    {
      float yd = yi * unitSize + halfU;
      for (int xi=0; xi < uw; xi++) 
      {
        pushMatrix();
          translate(xi * unitSize + halfU, yd);
          int offset = yi * uw + xi;
          tmp.set (v[offset].x, v[offset].y, 0.0);
          tmp.limit (unitSize*1.41);
          drawField (tmp.x, tmp.y);
        popMatrix();
      }
    }
    colorMode (RGB, 255);
  }
  
  //--- draw each arrow from center of each field "unit" ---
  void showFieldArrows() 
  {
    strokeWeight(0.8);
    fill(155,155);
    PVector tmp = new PVector();
    for (int yi=0; yi < uh; yi++)
    {
      float yd = yi * unitSize + halfU;
      for (int xi=0; xi < uw; xi++) 
      {
        pushMatrix();
          translate(xi * unitSize + halfU, yd);
          int offset = yi * uw + xi;
          tmp.set (v[offset].x, v[offset].y, 0.0);
          tmp.limit (unitSize*1.41);
          drawArrow (tmp.x, tmp.y);
        popMatrix();
      }
    }
  }

  //--- draw field rectangle at given position ---
  void drawField (float x, float y) 
  {
    float len = constrain (50*sqrt(sq(x) +sq(y)), 0, 255);
    float ang = map(atan2(y, x), -PI, PI, 0, 255);
    fill (color (ang, len*0.5, 222));
    rect(-halfU,-halfU, unitSize, unitSize);
  }  
  
  //--- draw arrow at given position ---
  void drawArrow (float x, float y) 
  {
    colorMode (RGB, 255);
    float len = sqrt(sq(x) +sq(y)) * 0.8;
    line(0,0, x*0.5, y*0.5);
    pushMatrix();
      rotate(atan2(y, x));
      noStroke();
      triangle (0,len/4, len,0, 0,-len/4);
    popMatrix();
    stroke(0);
  }  
  
  //--- update all vectors based on proximity to poles ---
  void polarize(PVector posPos, PVector posNeg) 
  {
    int vOffset = 0;
    for (int y = 0; y < uh; y++)
      for (int x = 0; x < uw; x++) 
      {
        PVector fPos = new PVector(x*unitSize+halfU, y*unitSize+halfU);
        PVector dist1 = PVector.sub(fPos, posPos);
        PVector dist2 = PVector.sub(posNeg, fPos);
        float div1 = dist1.mag();
        float div2 = dist2.mag();
        dist1.normalize();
        dist2.normalize();
        dist1.div(div1 * 0.001);
        dist2.div(div2 * 0.001);
        v[vOffset] = PVector.add(dist1,dist2);
        vOffset++;
      }
  }
  
  //--- add another vector field to this one ---
  void add(VectorField f) 
  {
    for (int ni = 0; ni < vfSize; ni++) 
    {
      v[ni].add(f.v[ni]);
    }
  }
  
  //--- set all vectors to zero ---
  void degauss() 
  {
    for (int ni = 0; ni < vfSize; ni++) 
    {
      v[ni].x = 0;
      v[ni].y = 0;
    }
  }
  
}   // class VectorField


