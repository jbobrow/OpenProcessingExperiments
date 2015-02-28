
class FloatColour
{
  FloatColour(){r = 0; g=0;b=0;}
  FloatColour(float fR,float fG,float fB)
  {
    r = fR;
    g = fG;
    b = fB;
  }
  float r;
  float g;
  float b;
};

class LightSource
{
  LightSource()
  {
    colour = new FloatColour();
  }
  FloatColour colour;
  int x;
  int y;
  int movecounter;
}

int movedelay = 10;
int boxwidth = 10;
int boxheight = 10;
int texturewidth = 100;
int textureheight = 100;
int lightCount = 0;
float fBrightness = 60.0f;

int MAX_LIGHTS = 2000;


LightSource mousePos = new LightSource();
LightSource[] emitters = new LightSource[MAX_LIGHTS];
FloatColour[][][] lightpixels = new FloatColour[texturewidth][textureheight][2];

boolean[][] wall = new boolean[texturewidth][textureheight];

int oldbuffer = 0;
int newbuffer = 1;

void fillRandom()
{
  for(int i=0;i<texturewidth;i++)
  {
    for(int j=0;j<textureheight;j++)
    {
       if(random(0,100) < 20)
       {
         wall[i][j] = true;
       }
       else if(random(0,10) < 1)
       {
         if(lightCount<MAX_LIGHTS)
         {
           emitters[lightCount].colour.r = random(0.0f,fBrightness);
           emitters[lightCount].colour.g = random(0.0f,fBrightness);
           emitters[lightCount].colour.b = random(0.0f,fBrightness);
           emitters[lightCount].x = i;
           emitters[lightCount].y = j; 
           emitters[lightCount].movecounter = (int) random(1,movedelay);
           lightCount++;    
         }
       }
    }
  }
}

void mouseMove()
{
  
}

//PGraphics pg;

void setup() {
  
  size(boxwidth*texturewidth,boxheight*textureheight,P2D);
  stroke(255);
  background(192, 64, 0);
  
  for(int i=0;i<MAX_LIGHTS;i++)
  {
    emitters[i] = new LightSource();
  }
  
  for(int i=0;i<texturewidth;i++)
  {
    for(int j=0;j<textureheight;j++)
    {  
       lightpixels[i][j][0] = new FloatColour();
       lightpixels[i][j][1] = new FloatColour();
       
       wall[i][j] = false;
    }
  }
  fillRandom();
} 

FloatColour GetColour(int x,int y)
{
  if(x<0 || x>=texturewidth || y<0 || y>= textureheight || wall[x][y])
  {
    return new FloatColour(0,0,0);
  }
  return lightpixels[x][y][oldbuffer];
}

float Propagate()
{
    float avgLuminance = 0.0f;
    
    //blur
    for(int i=0;i<texturewidth;i++)
    {
      for(int j=0;j<textureheight;j++)
      {
          FloatColour top = GetColour(i,j-1);
          FloatColour bottom = GetColour(i,j+1);   
          FloatColour topleft = GetColour(i-1,j-1);
          FloatColour left = GetColour(i-1,j);
          FloatColour bottomleft = GetColour(i-1,j+1);
          FloatColour topright = GetColour(i+1,j-1);
          FloatColour right = GetColour(i+1,j);
          FloatColour bottomright = GetColour(i+1,j+1);
     
          lightpixels[i][j][newbuffer].r = (topleft.r + left.r + bottomleft.r
                                            + topright.r + right.r + bottomleft.r 
                                            + top.r + bottom.r) * 0.125f;
          lightpixels[i][j][newbuffer].g = (topleft.g + left.g + bottomleft.g
                                            + topright.g + right.g + bottomleft.g 
                                            + top.g + bottom.g) * 0.125f;
          lightpixels[i][j][newbuffer].b = (topleft.b + left.b + bottomleft.b
                                            + topright.b + right.b + bottomleft.b 
                                            + top.b + bottom.b) * 0.125f;
          float luminance = lightpixels[i][j][newbuffer].r * 0.3f + 
                              lightpixels[i][j][newbuffer].g * 0.59f +
                              lightpixels[i][j][newbuffer].b * 0.11f;
          avgLuminance += luminance;
      }
    }  
    
    for(int i=0;i<MAX_LIGHTS;i++)
    {
      lightpixels[emitters[i].x][emitters[i].y][newbuffer].r += emitters[i].colour.r;
      lightpixels[emitters[i].x][emitters[i].y][newbuffer].g += emitters[i].colour.g;
      lightpixels[emitters[i].x][emitters[i].y][newbuffer].b += emitters[i].colour.b;
    }
    
    oldbuffer ^=1;
    newbuffer ^=1;
    return avgLuminance / (texturewidth*textureheight);
}

void MoveLights()
{
  for(int i=0;i<MAX_LIGHTS;i++)
  {       
      emitters[i].movecounter--;
      if( emitters[i].movecounter<=0)
      {
         emitters[i].movecounter = (int) random(1,movedelay);
        int iter = 0;
        while(iter<5)
        {
          int x = emitters[i].x + (int)(random(0,3)) - 1;
          int y = emitters[i].y + (int)(random(0,3)) - 1;
          if(x > 0 && x < texturewidth && y > 0 && y< textureheight &&  wall[x][y] == false)
          {
            emitters[i].x = x;
            emitters[i].y = y;
            break;
          }
          iter++;
        }
      }
  }
}

FloatColour AverageColour(int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4)
{
  FloatColour c1 = GetColour(x1,y1);
  FloatColour c2 = GetColour(x2,y2);
  FloatColour c3 = GetColour(x3,y3);
  FloatColour c4 = GetColour(x4,y4);
  
  return new FloatColour( (c1.r+c2.r+c3.r+c4.r) * 0.25f,
                          (c1.g+c2.g+c3.g+c4.g) * 0.25f,
                          (c1.b+c2.b+c3.b+c4.b) * 0.25f);
}

void draw() 
{
  float luminance = Propagate();
  MoveLights();
  
  for(int i=0;i<texturewidth;i++)
  {
    for(int j=0;j<textureheight;j++)
    {
      
      int startPixelX =  i*boxwidth; 
      int startPixelY =  j*boxheight; 
      
      color c1;
      if(wall[i][j])
      {
        c1 = color(64, 64, 64);
        fill(c1);
        noStroke();
        rect(i*boxwidth, j*boxheight,boxwidth,boxheight);
      }
      else
      {
        float multiplier = 5;
        
        /*FloatColour left = GetColour(i-1,j);
        FloatColour right = GetColour(i+1,j);
        FloatColour top = GetColour(i,j-1);
        FloatColour bottom = GetColour(i,j+1);
        

        float fGradientXR = right.r - left.r;
        float fGradientXG = right.g - left.g; 
        float fGradientXB = right.b - left.b;

        float fGradientYR = bottom.r - top.r;
        float fGradientYG = bottom.g - top.g; 
        float fGradientYB = bottom.b - top.b; 
        
        
       
        for(int x=0;x<boxwidth;x++)
        { 
          for(int y=0;y<boxheight;y++)
          {
            float u = float(x) / (boxwidth-1);
            float v = 1.0f - float(y) / (boxheight-1);
           
            float resultR = (left.r + fGradientXR * u) + (top.r + fGradientYR * v); 
            float resultG = (left.g + fGradientXG * u) + (top.g + fGradientYG * v);              
            float resultB = (left.b + fGradientXB * u) + (top.b + fGradientYB * v); 
            
            c1 = color(resultR,resultG,resultB);
            fill(c1);
            stroke(c1);
            point(x+startPixelX,y+startPixelY);
          }
        }*/
        
        
        FloatColour topleft = AverageColour(i-1,j-1,
                                              i,j-1,
                                              i-1,j,
                                              i,j);
 
         FloatColour topright = AverageColour(i,j-1,
                                              i+1,j-1,
                                              i+1,j,
                                              i,j);
        
        FloatColour bottomleft = AverageColour(i-1,j+1,
                                      i,j+1,
                                      i-1,j,
                                      i,j);
                                      
        FloatColour bottomright = AverageColour(i,j+1,
                              i+1,j+1,
                              i+1,j,
                              i,j);

        c1 = color(lightpixels[i][j][oldbuffer].r * multiplier,
                   lightpixels[i][j][oldbuffer].g * multiplier,
                    lightpixels[i][j][oldbuffer].b * multiplier);
                    
         
        beginShape(QUADS);
        fill(color(topleft.r * multiplier,topleft.g*multiplier,topleft.b*multiplier));
        vertex(startPixelX,startPixelY);
        fill(color(topright.r * multiplier,topright.g*multiplier,topright.b*multiplier));
        vertex(startPixelX + boxwidth,startPixelY);
        fill(color(bottomright.r * multiplier,bottomright.g*multiplier,bottomright.b*multiplier));
        vertex(startPixelX + boxwidth,startPixelY + boxheight);
        fill(color(bottomleft.r * multiplier,bottomleft.g*multiplier,bottomleft.b*multiplier));
        vertex(startPixelX,startPixelY + boxheight);
        endShape();
      }
      //fill(c1);
      //noStroke();
      //rect(i*boxwidth, j*boxheight,boxwidth,boxheight);
    }
  }
}

