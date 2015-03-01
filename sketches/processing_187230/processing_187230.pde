
class curveGroup
{
  Boolean passed = false;
  ArrayList<PVector> verts;
  terrainLayer mylr;
  public curveGroup(float startx, float starty, terrainLayer lr)
  {
    verts = new ArrayList();
    int pointN = (int)(random(1)*10);
    mylr = lr;
    for(int i = 0; i < 1 + pointN; i++)
    {
      float xo = startx+(terrainPointSpacing*(i+1));
      float yo = starty+(terrainPointSpacing*(i+1)) + (-20 + random(40));
      
      verts.add(new PVector(xo, yo));
    }
  }
  
  void move(float globalSpeed)
  {
    if(passed) return;
    //move all towards 0,0 with globalSpeed
    for(PVector v : verts)
    {
      v.x -= globalSpeed;
      v.y -= globalSpeed;
    }
  }
  
  public PVector getLastVector()
  {
    return verts.get(verts.size()-1);
  }
  
  void apply()
  {
    if(passed) return;
    passed = true;
    for(PVector v : verts)
    {
      curveVertex(v.x, v.y);
      if(v.x > 0)
      {
        passed = false;
      }
      else
      {
        mylr.origin = v;
      }
    }
  }
  
  void debug()
  {
   if(passed) return; 
    for(PVector v : verts)
    {
      fill(255, 0, 0);
      noStroke();
      ellipse(v.x, v.y, 3, 3);
    }
  }  
}

class terrainLayer
{
  ArrayList<curveGroup> curves;
  PVector origin = new PVector(0,0);
  float offsetX = 0;
  float offsetY = 0;
  float moveSpd = 1;
  color terrainColor;

  public terrainLayer(float offsetx, float offsety, float moveSpeed, color col)
  {
    curves = new ArrayList();
    addCurveGroup();
    offsetX = offsetx;
    offsetY = offsety;
    moveSpd = moveSpeed;
    terrainColor = col;
  }

  void addCurveGroup()
  {
    PVector LastCurveVector = new PVector(width, height);
    if(curves.size() > 0)
    {
      LastCurveVector = curves.get(curves.size()-1).getLastVector();
    }
    curves.add(new curveGroup(LastCurveVector.x, LastCurveVector.y, this));
  }  
  
  void draw()
  {
    //draw 'terrain'
    pushMatrix();
    translate(offsetX, offsetY);
    fill(terrainColor);
    noStroke();
    beginShape();
    curveVertex(origin.x, origin.y); // the first control point
    curveVertex(origin.x, origin.y); // is also the start point of curve
    
    for(curveGroup grp : curves)
    {
      grp.move(moveSpd);
      grp.apply();
    }
   
    curveVertex(width, height); // the last point of curve
    curveVertex(width, height); // is also the last control point
    vertex(0, height);
    vertex(0,0);
    endShape(CLOSE);
     
    //clean up passed curve groups
    for(int i=curves.size()-1; i > 0; i--)
    {
      if(curves.get(i).passed)
      {
        curves.remove(i);
      }
    }
    
    while(curves.size() < 8)
    {
      addCurveGroup();
    }
    /*
    for(curveGroup grp : curves)
    {
      grp.debug();
    }
    */
    popMatrix();
  }
}

ArrayList<terrainLayer> layers = new ArrayList();
float terrainPointSpacing = 30;
void setup()
{
  layers.add(new terrainLayer(0,0,1, color(255,255,255)));
  layers.add(new terrainLayer(0,80,1.5, color(178,178,255)));
  
  size(500, 400);
  background(255);
  smooth();
}

void draw()
{
  background(90,90,255);
  
  fill(228,228,0);
  ellipse(width-(width/4), (height/4), 48, 48);
  
  fill(210,210,255);
  rect(0, height/2, width, height/2);
  
  for(terrainLayer lr : layers)
  {
    lr.draw();
  }
}

