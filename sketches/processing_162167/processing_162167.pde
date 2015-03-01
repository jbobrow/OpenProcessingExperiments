
class TerrainSection
{
  float X, Y;
  PVector[][] points;
  
  PShape prshape;
  boolean shapeSet = false;
  
  PShape GetShapeLazy()
  {
    //processing can't get decent lazy loaders right.
    if(shapeSet == false)
    {
      prshape = createShape();
      prshape.beginShape(QUADS);
      //prshape.noStroke();
      //todo : DLOD
    
      for(int xp = 0; xp < tileSubSections-1.0; xp++)
      {
        for(int yp = 0; yp < tileSubSections-1.0; yp++)
        {
          PVector pt =points[xp][yp]; 
          
          
          float low = pt.z;
          float high = pt.z;
          
          PVector[] pts = new PVector[4];
          pts[0] = points[xp+1][yp];
          low = pts[0].z;
          high = pts[0].z;
          
          pts[1] = points[xp+1][yp+1];
          low = min(low, pts[1].z);
          high = max(high, pts[1].z);
          
          pts[2] = points[xp][yp+1];
          low = min(low, pts[2].z);
          high = max(high, pts[2].z);
          
          pts[3] = points[xp][yp];
          low = min(low, pts[3].z);
          high = max(high, pts[3].z);
          
          float dist = high - low;
          
          //steep ones should look different. 
          if(abs(dist) > 24.0)
          {
            prshape.fill(128);
          }
          else
          {
            prshape.fill(255);
          }
          
          prshape.vertex(pts[0].x, pts[0].z,pts[0].y);
          prshape.vertex(pts[1].x, pts[1].z,pts[1].y);
          prshape.vertex(pts[2].x, pts[2].z,pts[2].y);
          prshape.vertex(pts[3].x, pts[3].z,pts[3].y);
          
        }
      }
      prshape.endShape(CLOSE);
      shapeSet = true;
    }
    
    return prshape;
    
  }
  
  public TerrainSection(float wx, float wy, int seed)
  {
    points  = new PVector[tileSubSections][tileSubSections];
    X=(wx*(TerrainScale)*(tileSubSections-1.0));
    Y=(wy*(TerrainScale)*(tileSubSections-1.0));
    
    for(int xp = 0; xp < tileSubSections; xp++)
    {
      for(int yp = 0; yp < tileSubSections; yp++)
      {
        noiseSeed(seed);
        float nse = noise(wx+(xp/(tileSubSections-1.0)),wy+(yp/(tileSubSections-1.0)),0.0);
        noiseSeed(detailSeed);
        
        
        nse += GetHeightModifier(
               (wx + (xp/(tileSubSections-1.0))), 
               (wy + (yp/(tileSubSections-1.0))), 
             nse);
        
        nse*=TerrainHeightScale;
        nse += noise(wx+(xp/(tileSubSections-1.0)),wy+(yp/(tileSubSections-1.0)),0.0)*detailScale;
        //simple ass noise
        points[xp][yp] = new PVector((float)xp*TerrainScale, (float)yp*TerrainScale, nse);
        
      }
    }
  }
 
  
  float GetHeightModifier(float wx, float wy, float hi)
  {
    float coffset = 0;
    
    //add sharp mountain ranges.
    //these would naturally occur on the middle of the island
    if((sin(wx) < 0.0) && (sin(wy) < 0.0))
    {
      if(hi > 0.4 && hi < 0.5)
      {
        coffset += ((sin(wx) + sin(wy))/2.0)/5.0;
      }
    }
    
    
    //CANYONS!
    if((sin(wx) < 0.7) && (sin(wy) < 0.7))
    {
      if(hi > 0.6 && hi < 0.65)
      {
        coffset -= min(0,(((sin(wx) + sin(wy))/2 )));
      }
    }
    
    //add highland craters
    if(hi > 0.8 && hi < 0.85)
    {
      if(hi > 0.7 && hi < 0.75)
      {
        coffset += 0.3;
      }
    }
    
    
    
    //default island curve. (sin mapping)
    float maxX = worldTilesX;
    float maxY = worldTilesY;
    
    //we need to flip it since sin x plus sin y is negative in the 0-3 range
    float heightOffset = 1.3;
    coffset-=(((sin(map(wx, 0.0,maxX,0.0, 3.0)) + sin(map(wy, 0.0,maxY,0.0, 3.0)))-heightOffset));
    
    return coffset;
  }
  
  void draw()
  {
    pushMatrix();
    translate(X, 0, Y);
    shape(GetShapeLazy());
    popMatrix();
  }
}

float TerrainScale = 20;
float TerrainHeightScale = 200;
TerrainSection[][] sections;

int worldTilesX = 9;
int worldTilesY = 9;

int tileSubSections = 42;//33;

int seed = 10;
int detailSeed = 10;
float detailScale = 120;

float FieldOfView = PI/3.0;

void setup()
{
  seed = (int)Math.floor(random(100));
  size(1024,768,P3D);
  sections = new TerrainSection[worldTilesX][worldTilesY];
  for(int xp =0; xp < worldTilesX; xp++)
  {
    for(int yp =0; yp < worldTilesY; yp++)
    {
      sections[xp][yp] = new TerrainSection((float)xp, (float)yp,seed);
    }
  } 
  noStroke();
}

void draw()
{
  
  hint(DISABLE_DEPTH_MASK);
  background(128,128,212);
  hint(ENABLE_DEPTH_MASK);
  
  
  directionalLight(255, 255, 255, -1, 1, 1);
  
  float xCenter =(worldTilesX*(TerrainScale*(tileSubSections-1.0)))/2;
  float yCenter =(worldTilesX*(TerrainScale*(tileSubSections-1.0)))/2; 
  float cDistance = mouseY * 20.0;
  
  //perspective(FieldOfView, (float)width/(float)height, 0, -40960);
  camera(xCenter + sin((float)mouseX/(width/3))*cDistance,0-500, yCenter + cos((float)mouseX/(width/3))*cDistance, xCenter,0,yCenter, 0,1,0);
  
  //lol wut ocean
  fill(0,0,255, 64);
  beginShape();
  vertex(0-23000,370,  0-23000);
  vertex(23000,  370,  0-23000);
  vertex(23000,  370,  23000);
  vertex(0-23000,370,  23000);
  
  endShape();
  
  fill(255);
  
  for(int xp =0; xp < worldTilesX; xp++)
  {
    for(int yp =0; yp < worldTilesY; yp++)
    {
      sections[xp][yp].draw();
    }
  }
}
