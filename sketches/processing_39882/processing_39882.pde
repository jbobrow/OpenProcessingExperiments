
int lastMillis;
float sec;

void setup( )
{
  size(500,500);
  smooth();
  lastMillis = millis();
  sec = 0;
}


void draw()
{
  int tmp = millis();
  float dt = (tmp-lastMillis)/1000.0;
  lastMillis = tmp;
  
  sec += dt;
  
  background(255);
  
  noFill();
  noStroke();
  strokeWeight(2);
  for( int i=50; i>=0; i-- )
  {
    float t = sec-2.0*i/frameRate;
    float d1 = lerp( width/9,width/2,noise(t,0)); 
    float d2 = lerp( height/9,height/2,noise(t,3));
    float s1 = lerp( -1,3,noise(t/2.5,5));
    float s2 = lerp( -1,3,noise(t/2.2,10));
    float s3 = lerp( -1,3,noise(t/2.1,15));
    float s4 = lerp( -1,3,noise(t/2.0,20));
    stroke(255,55+i*4,55+i*4);
    if( i==0 )
    {
      stroke(255,0,0);
      fill(0,0,0,64);
      strokeWeight(3);
    }
    d1*=50.0/(i+50);
    d2*=50.0/(i+50);
    squellipse( width*2/3-4*i,height*2/3-4*i, d1,d2,s1,s2,s3,s4);
  }
 }

//------------------------
// squellipse

float ctrl = 4*(sqrt(2)-1)/3;
void squellipse( float x, float y, float d1, float d2, float sqAll )
{
  squellipse( x,y,d1,d2,sqAll,sqAll,sqAll,sqAll);
}

void squellipse( float x, float y, float d1, float d2, float sqHorz, float sqVert )
{
  squellipse( x,y,d1,d2,sqHorz,sqVert,sqHorz,sqVert);
}

void squellipse( float x, float y, float d1, float d2, float sql, float sqt,float sqr, float sqb )
{
  float r1 = d1/2;
  float r2 = d2/2;
  float c1t = r1*lerp(ctrl,1,sqt);
  float c1b = r1*lerp(ctrl,1,sqb);
  float c2l = r2*lerp(ctrl,1,sql);
  float c2r = r2*lerp(ctrl,1,sqr);
  
  beginShape();
    vertex( x,y-r2);
    bezierVertex( x+c1t,y-r2,
      x+r1,y-c2r,
      x+r1,y);
    bezierVertex( x+r1,y+c2r,
      x+c1b,y+r2,
      x,y+r2);
    bezierVertex( x-c1b,y+r2,
      x-r1,y+c2l,
      x-r1,y);
    bezierVertex( x-r1,y-c2l,
      x-c1t,y-r2,
      x,y-r2);
    
  endShape(CLOSE);
}


