
Vignette border;
int type, resolution, thickness, mX, mY;

void setup()
{
  size(500,500);
  border = new Vignette(0, 5, 50);
  type = 0;
  resolution = 3;
  thickness = 4;
}

void draw()
{
  background(255);
  mX = round(map(mouseX, 0, width, 1, 50));
  mY = round(map(mouseY, 0, height, 1, 50));
  resolution = round(map(mouseX, 0, width, 3, 50));
  thickness = round(map(mouseY, 0, height, 3, height*1.1));
  
  border = new Vignette(type, resolution, thickness);
  border.vDraw();
}

void mouseClicked()
{
  if(type == 1) {type = 0;} else if(type==0){type = 1;}
}
class Vignette
{
  float wid;
  float widScale;
  color vCol[];
  int vType;
  float radius;
  
  Vignette(int mode, int vResolution, int thick)
  {
    //top
    vCol = new color[vResolution];
    vType = mode;
    if(vType == 1)
    {
        wid = thick*2;
    } else {
        wid = thick;
    }
    widScale = wid/vCol.length;
    radius = sqrt(sq(width/2),sq(height/2));
    
    for (int i = 0; i<vCol.length;i++)
    {
      vCol[i] = round(map(i,vCol.length,0, 0, 150));
    }
    
    
  }
  
  void vDraw()
  {
    if(type == 0)
    {
      for (int i = 0; i<vCol.length;i++)
      {
        noFill();
        stroke(0,vCol[i]);
        strokeWeight(widScale);
        
        //MITER, BEVEL, ROUND
        
        strokeJoin(MITER);
        rectMode(CENTER);
        rect(width/2, height/2, width-i*widScale, height-i*widScale);
      }
    }
    
    
    else
    {
      for (int i = 0; i<vCol.length-1;i++)
      {
        noFill();
        stroke(0,vCol[i]);
        strokeWeight(widScale);
        
        //MITER, BEVEL, ROUND
        
        strokeJoin(MITER);
        rectMode(CENTER);
//        ellipse(width/2, height/2, width-i*widScale, height-i*widScale);
        ellipse(width/2, height/2, width - i*widScale + radius, height - i*widScale + radius);

      }
      
      //stroke(vCol[vCol.length-1]);
      //strokeWeight(width/3.135);
      //ellipse(width/2, height/2, width+width/3.14, height+height/3.14);
    }
  }
}


