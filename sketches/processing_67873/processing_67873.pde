
// cube colours
final color top   = 0xFFFFFFFF;
final color left  = 0xFFCCCCCC;
final color right = 0xFFAAAAAA;

void setup()
{
  size(1280, 720);
  frameRate(30);
  smooth();
  noStroke();
}

int s = 20;
int sDir = -2;

final int minS = 1;
final int maxS = 200;

final int millisSStep = 5;
long lastSStep = 0;
int gridsize  = 10;
int amplitude = 100;
final int propagateTimeMs = 10;
long lastPropagateTsMs = 0;
final float dPhase = 4.0 / (gridsize/2);

int[][] hArr = new int[gridsize][gridsize];


void draw()
{
  // resize s
  if(millis() - millisSStep > lastSStep){
    s += sDir;
    
    if (s <= minS || s >= maxS){
      sDir *= -1;
    }
    
    amplitude = s < 20 ? 5 * s: 100;
    amplitude = s < 20 ? 100 : amplitude;
  }
  
  // calculate height of element at (0,0);
  if(millis() - propagateTimeMs > lastPropagateTsMs){
    for(int x = 0; x < gridsize; x++){
      for(int y = 0; y < gridsize; y++){
        float sx = ((float)(-2.0/gridsize)*(abs(x-(gridsize/2.0)))) + 1.0;
        float sy = ((float)(-2.0/gridsize)*(abs(y-(gridsize/2.0)))) + 1.0;
        
        hArr[x][y] =
                       (int) (sx * (float)(amplitude/2.0) * sin(2.0 * PI * 0.5 * (millis()/1000.0) + (dPhase * abs(x - (gridsize/2))))) +
                       (int) (sy * (float)(amplitude/2.0) * sin(2.0 * PI * 0.5 * (millis()/1000.0) + (dPhase * abs(y - (gridsize/2)))));
      }
    }
    lastPropagateTsMs = millis();
  }
  
  background(color(s,s,s));
  
  fill(top);
  pushMatrix();
  //translate(((-1*width)/(2.0*maxS)*s+(width/2)),
  //          (height/2) - ((gridsize*s)/2) + amplitude);
  translate(width/2,
            (height/2) - ((gridsize*s)/2) + amplitude);
  /*applyMatrix( 1,
              ((1.0/maxS)*s)-1.0,
               0,
               ((-0.5/maxS)*s)+0.5,
               0.5,
               0);*/
   applyMatrix( 1,
               -1.0,
                0,
                0.5,
                0.5,
                0);

  /*stroke(0x10000000);
  for(int i = 0; i <= gridsize; i++){
    line(0,i*s,s*gridsize,i*s);
    for(int j = 0; j <= gridsize; j++){
      line(j*s,0,j*s,s*gridsize);
    }
  }
  pushMatrix();
  translate(-1*amplitude, -1*amplitude);
  stroke(0x10888888);
  for(int i = 0; i <= gridsize; i++){
    line(0,i*s,s*gridsize,i*s);
    for(int j = 0; j <= gridsize; j++){
      line(j*s,0,j*s,s*gridsize);
    }
  }
  translate(-1*amplitude, -1*amplitude);
  stroke(0x10FFFFFF);
  for(int i = 0; i <= gridsize; i++){
    line(0,i*s,s*gridsize,i*s);
    for(int j = 0; j <= gridsize; j++){
      line(j*s,0,j*s,s*gridsize);
    }
  }
  popMatrix();*/
  
  noStroke();
  for(int x = 0; x < gridsize; x++){
    for(int y = 0; y < gridsize; y++){
      pushMatrix();
      translate(hArr[x][y],hArr[x][y]);
      translate(-1 * amplitude, -1 * amplitude);
      int q = 256 - (int)( ( ((float)hArr[x][y] + amplitude) / (2.0*(float)amplitude) ) * 256.0);

      fill(color(q, q, q, 255));
      
      //right side
      beginShape();
      vertex((x*s) + s, (y*s));
      vertex((x*s) + (2*s), (y*s) + s);
      vertex((x*s) + (2*s), (y*s) + (2*s));
      vertex((x*s) + s, (y*s) + s);
      vertex((x*s) + s, (y*s));
      endShape();
      
      //left side
      beginShape();
      vertex((x*s), (y*s) + s);
      vertex((x*s) + s, (y*s) + (2*s));
      vertex((x*s) + (2*s), (y*s) + (2*s));
      vertex((x*s) + s, (y*s) + s);
      vertex((x*s), (y*s) + s);
      endShape();
      
      //top
      rect(x*s, y*s, s, s);
      
      popMatrix();
    }
  }
  popMatrix();
}

public class point{
  public int x;
  public int y;
}

public class icube
{
  
}

