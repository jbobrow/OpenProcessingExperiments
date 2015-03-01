
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
  
  ArrayList<PVector> aroundX(float x)
  {
    PVector lastPos = curves.get(0).verts.get(0);
    ArrayList<PVector> returnValues = new ArrayList();
    
    for(curveGroup grp : curves)
    {
      for(PVector vrt : grp.verts)
      {
        if(x > vrt.x)
        {
          lastPos = vrt;
        }
        else
        {
          returnValues.add(lastPos);
          returnValues.add(vrt);
          return returnValues;
        }   
      }
    }
    
    return null;
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

class skier
  {
    PVector pos;
    terrainLayer myLayer;
    float initialGrav = 0.2;
    float grav = 0.2;
    
    float xspd = 1;
    
    public skier(terrainLayer tl, float xpos)
    {
      grav = initialGrav;
      pos = new PVector(xpos, 0);
      myLayer = tl;
    }
    
    void draw()
    {
      //get control points closest to x position
      ArrayList<PVector> points = myLayer.aroundX(pos.x);
      
      if(points == null || points.size() < 1)
      {
        return;
      }
      
      //lerp to find line
      float distX = points.get(1).x - points.get(0).x;
      
      float percentileDist = (pos.x - points.get(0).x) / distX;
      
      //tgr : this lerp has no idea of the actual terrain. it is linear
      //also, why on earth can't i lerp PVectors in processingjs?
      
      float lerpedX = lerp(points.get(0).x, points.get(1).x, percentileDist);
      float lerpedY = lerp(points.get(0).y, points.get(1).y, percentileDist);
      
      PVector hitPoint = new PVector(lerpedX, lerpedY);

      //we can conveniently use the hitpoint to draw the skier's shadow, i guess.
      fill(128,128,128,128);
      ellipse(hitPoint.x, hitPoint.y+2, 6, 3);
      
      //this means we are in the air
      if( pos.y < hitPoint.y )
      {
        pos.y += grav;
        grav += 0.05;
        xspd *= 0.97;
      }
      else
      {
        //this means we are on the ground
        pos.y = hitPoint.y;
        if(grav > initialGrav)
        {
          //retain momentum...
          xspd += grav - initialGrav;
        }
        grav = initialGrav;
        
        xspd += 0.1;
        
      }
      
      fill(255,0,0);
      ellipse(pos.x, pos.y, 5, 5);
    }
    
  }

ArrayList<terrainLayer> layers = new ArrayList();
skier ski;
float terrainPointSpacing = 30;
void setup()
{
  terrainLayer skiLayer = new terrainLayer(0,0,1, color(255,255,255)); 
  layers.add(skiLayer);
  layers.add(new terrainLayer(0,280,1.5, color(178,178,255)));
  
  size(500, 400);
  
  ski = new skier(skiLayer, width/2);
  
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
  
  ski.draw();
  
  for(int i = 0; i < layers.size(); i++)
  {
    layers.get(i).moveSpd = ski.xspd * (i+1);
  } 
}

