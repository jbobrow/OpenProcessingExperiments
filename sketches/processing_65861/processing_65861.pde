

ArrayList shapes = new ArrayList();

void setup() 
{
  size(600, 600, P3D);
  noStroke();  
  
  
  
  createShapes();
}

void createShapes()
{
  float c=1;
  for(float b=-70;b<50;b+=2)
  {
    
  float coordinates[]=new float[24];
  float h=.5; //slope coming up
  for(int x=0;x<24;x++)
  {
    switch(x)
    {
    case 0: coordinates[x]=c;break;                //-x
    case 1: coordinates[x]=b;break;                //y
    case 2: coordinates[x]=-c;break;                //+z
    case 3: coordinates[x]=-c;break;                //+x
    case 4: coordinates[x]=b;break;                //y
    case 5: coordinates[x]=-c;break;                //+z
    case 6: coordinates[x]=c;break;                //-x
    case 7: coordinates[x]=b;break;                //y
    case 8: coordinates[x]=c;break;                //-z
    case 9: coordinates[x]=-c;break;                //+x
    case 10:coordinates[x]=b;break;                //y
    case 11:coordinates[x]=c;break;                //-z
    case 12:coordinates[x]=c+h;break;                //-x
    case 13:coordinates[x]=b;break;                //y
    case 14:coordinates[x]=-c-h;break;                //+z
    case 15:coordinates[x]=-c-h;break;                //+x                
    case 16:coordinates[x]=b;break;                //y
    case 17:coordinates[x]=-c-h;break;                //+z
    case 18:coordinates[x]=c+h;break;                //-x
    case 19:coordinates[x]=b;break;                //y
    case 20:coordinates[x]=c+h;break;                //-z
    case 21:coordinates[x]=-c-h;break;                //+x
    case 22:coordinates[x]=b;break;                //y
    case 23:coordinates[x]=c+h;break;                //-z
    }
  }
   shapes.add(new eightCorners(coordinates));
   c+=.5;
  }
  
  
}



void draw() 
{
  backgroundTranslateScaleRotate();
  drawShapes();
}

void backgroundTranslateScaleRotate()
{
  background(255,220,150);
  translate(width/2, height/2, 0);
  lights();
  shapeMode(CENTER);
  scale(4);


}

void drawShapes()
{
  

 for(int x=0;x<shapes.size();x++)
  {
     //   rotateY(frameCount/1000.0);
        rotateY(frameCount/1000.0);
    ((eightCorners)shapes.get(x)).drawShape();
  } 
    
 
}



class eightCorners
{
  float cd[]=new float[24];
  
  eightCorners(float coordinates[])
  {
    cd=coordinates;
  }
  
  
  
  void drawShape()
  {

  beginShape(QUADS);
  
  fill(200-abs(sin(frameCount/203.0))*55 ,50+abs(sin(frameCount/297.0))*205 ,255-abs(sin(frameCount/203.0))*255);
  // +Z "front" face 
  corners(0);
  corners(1);
  corners(5);
  corners(4);
  fill(100+abs(sin(frameCount/201.0))*155 ,200-abs(sin(frameCount/203.0))*50 ,50+abs(sin(frameCount/297.0))*200);  
  // -Z "back" face 
  corners(3);
  corners(2);
  corners(6);
  corners(7);
  fill(0,0,0,0);
  // +Y "bottom" 
  corners(4);
  corners(5);
  corners(7);
  corners(6);
  fill(0,0,0,0);
  // -Y "top" face 
  corners(2);
  corners(3);
  corners(1);
  corners(0);
  fill(100+abs(sin(frameCount/297.0))*155 ,200-abs(sin(frameCount/201.03))*150 ,90+abs(sin(frameCount/204.3))*160);  
  // +X "right" face 
  corners(1);
  corners(3);
  corners(7);
  corners(5);
  fill(255-abs(sin(frameCount/200.0))*50 +60 ,abs(sin(frameCount/297.40))*255 ,100+abs(sin(frameCount/204.3))*100);  
  // -X "left" face 
  corners(2);
  corners(0);
  corners(4);
  corners(6);
  
  endShape();
  }
  
  void corners(int cornerNumber)
  {
   switch(cornerNumber)
    {
      case 0: vertex(-1+cd[0],-1+cd[1],1+cd[2]);break;     //UP LEFT FRONT Corner
      case 1: vertex(1+cd[3],-1+cd[4],1+cd[5]);break;      //URF Corner
      case 2: vertex(-1+cd[6],-1+cd[7],-1+cd[8]);break;    //ULB
      case 3: vertex(1+cd[9],-1+cd[10],-1+cd[11]);break;   //URB
      case 4: vertex(-1+cd[12],1+cd[13],1+cd[14]);break;   //DLF
      case 5: vertex(1+cd[15],1+cd[16],1+cd[17]);break;    //DRF
      case 6: vertex(-1+cd[18],1+cd[19],-1+cd[20]);break;   //DLB
      case 7: vertex(1+cd[21],1+cd[22],-1+cd[23]);break;   //DRB
      default: vertex(0,0,0);   //Center Default
    } 
    
    
  }
  
}





