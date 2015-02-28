
ArrayList elementList=new ArrayList();
int elementSize=10;

//Which element is selected to be placed. 1=fire,2=water,3=plant,4=sand
int selectedElement=1; 
boolean rain=false;


void setup()
{
  size(450,450,P3D);
  noStroke();
}


void draw()
{
  backgroundAndLights();
  drawSelectElements(); //Draws bottom selectors
  drawElements();
  moveElements();
  selector();//Draws the pink one to know where a block will be put
}

void backgroundAndLights()
{
  background(179,255,255);
  lights();
}

void drawSelectElements()
{
  pushMatrix();
  translate(25,0);
  fill(255,0,0);
  rect(0,406,100,50); //Fire
  fill(0,0,255);
  rect(100,406,100,50); //Water
  fill(0,255,0);
  rect(200,406,100,50); //Plant
  fill(230,230,60); //Sand
  rect(300,406,100,50);
  popMatrix();
}

void drawElements()
{
 
 if(rain&&frameCount%2==0)
 {
  int place = int(random(width-20)+5);
  int rgbColors[]={0,0,255};
  Element tempElement = new Element(place-(place%elementSize)+elementSize/2,-10+elementSize/2,0, rgbColors,2);
  elementList.add(tempElement);
 }
 for(int x=0;x<elementList.size();x++)
 {
  ((Element)elementList.get(x)).drawElement();
 }
  
}

void moveElements()
{
 if(frameCount%4==0)
 for(int x=0;x<elementList.size();x++)
 {
  ((Element)elementList.get(x)).moveElement();
 }
  
}
 
 
/* CLASS Element*/

class Element
{
  int xDisplacement;
  int yDisplacement;
  int zDisplacement;
  int rgbColors[];
  int elementType;
  int gensAlive=0;
  


  Element(int xDisplacement,int yDisplacement,int zDisplacement,int rgbColors[],int elementType)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.zDisplacement=zDisplacement;
   this.rgbColors=rgbColors;
   this.elementType=elementType;
   } 
   
  int getX(){return xDisplacement;}
  int getY(){return yDisplacement;}
  int getZ(){return zDisplacement;}
  void moveDown(){yDisplacement+=elementSize;}
  int getElementType(){return elementType;}
  void changeElementType(int x){elementType=x;}
  void resetGens(){gensAlive=0;}
  void changeRed(){rgbColors[0]=255;rgbColors[1]=0;rgbColors[2]=0;}
  void changeGreen(){rgbColors[0]=0;rgbColors[1]=255;rgbColors[2]=0;}
  
  void drawElement()
  {
   gensAlive++;
   pushMatrix();
   fill(rgbColors[0],rgbColors[1],rgbColors[2]);
   if(gensAlive>20&&elementType==1)
   fill(rgbColors[0],rgbColors[1]+=4,rgbColors[2]);
   translate(xDisplacement,yDisplacement,zDisplacement);
   box(elementSize); 
   popMatrix();
  }
  
  void moveElement()
  {
    if(elementType!=1&&elementType!=3) //Water and Sand
    {
      
    boolean moveD=true;
    for(int x=0;x<elementList.size();x++)
    {
     if(((Element)elementList.get(x)).getY()-elementSize==getY()&&((Element)elementList.get(x)).getX()==getX())
     moveD=false;     
    }
    
    if(moveD&&getY()<390)
    moveDown();
    
    }
    else if (elementType==1) //Fire
    {
    if(random(1)>.6)    
    for(int x=0;x<elementList.size();x++)
    {
     Element tempElement=((Element)elementList.get(x));
     if(tempElement.getY()-elementSize==getY()&&tempElement.getX()==getX()&&tempElement.getElementType()==3)
     {
     ((Element)elementList.get(x)).changeElementType(elementType); 
     ((Element)elementList.get(x)).resetGens();
     ((Element)elementList.get(x)).changeRed();
     break;
     }
     if(tempElement.getY()+elementSize==getY()&&tempElement.getX()==getX()&&tempElement.getElementType()==3)
     {
     ((Element)elementList.get(x)).changeElementType(elementType); 
     ((Element)elementList.get(x)).resetGens();
     ((Element)elementList.get(x)).changeRed();
     break;
     }
     if(tempElement.getX()-elementSize==getX()&&tempElement.getY()==getY()&&tempElement.getElementType()==3)
     {
     ((Element)elementList.get(x)).changeElementType(elementType); 
     ((Element)elementList.get(x)).resetGens();
     ((Element)elementList.get(x)).changeRed();
     break;
     }
     if(tempElement.getX()+elementSize==getX()&&tempElement.getY()==getY()&&tempElement.getElementType()==3)
     {
     ((Element)elementList.get(x)).changeElementType(elementType); 
     ((Element)elementList.get(x)).resetGens();
     ((Element)elementList.get(x)).changeRed();
     }
    }
     
     if(gensAlive>50)
     elementList.remove(this); 
    }
    else if (elementType==3) //plant
    {
    if(random(1)>.7)
    for(int x=0;x<elementList.size();x++)
    {
     Element tempElement=((Element)elementList.get(x));
     if(tempElement.getY()-elementSize==getY()&&tempElement.getX()==getX()&&tempElement.getElementType()==2)
     {
     ((Element)elementList.get(x)).changeElementType(elementType); 
     ((Element)elementList.get(x)).changeGreen();
     break;
     }
     if(tempElement.getY()+elementSize==getY()&&tempElement.getX()==getX()&&tempElement.getElementType()==2)
     {
     ((Element)elementList.get(x)).changeElementType(elementType);
     ((Element)elementList.get(x)).changeGreen();
     break;
     }
     if(tempElement.getX()-elementSize==getX()&&tempElement.getY()==getY()&&tempElement.getElementType()==2)
     {
     ((Element)elementList.get(x)).changeElementType(elementType);
     ((Element)elementList.get(x)).changeGreen(); 
     break;
     }
     if(tempElement.getX()+elementSize==getX()&&tempElement.getY()==getY()&&tempElement.getElementType()==2)
     {
     ((Element)elementList.get(x)).changeElementType(elementType);
     ((Element)elementList.get(x)).changeGreen(); 
     break;
     }
     if(tempElement.getX()+elementSize==getX()&&tempElement.getY()==getY()-elementSize&&tempElement.getElementType()==2)
     {
     ((Element)elementList.get(x)).changeElementType(elementType);
     ((Element)elementList.get(x)).changeGreen(); 
     break;
     }
     if(tempElement.getX()-elementSize==getX()&&tempElement.getY()==getY()-elementSize&&tempElement.getElementType()==2)
     {
     ((Element)elementList.get(x)).changeElementType(elementType);
     ((Element)elementList.get(x)).changeGreen(); 
     break;
     }
    }
       if(gensAlive>50&&rgbColors[0]<139&&frameCount%10==0)
       {
       rgbColors[0]+=4;
       rgbColors[2]+=2;
       rgbColors[1]-=2;
       }
    }
    
  }
  
}




void mousePressed()
{
  
  
  if(mouseY<400&&mouseX<440&&mouseX>elementSize)
  {
  Element tempElement;
  int rgbColors[]=new int[3];
  
  switch(selectedElement)
  {
   case 1:rgbColors[0]=255;rgbColors[1]=0;rgbColors[2]=0;break;
   case 2:rgbColors[0]=0;rgbColors[1]=0;rgbColors[2]=255;break;
   case 3:rgbColors[0]=0;rgbColors[1]=255;rgbColors[2]=0;break;
   case 4:rgbColors[0]=230;rgbColors[1]=230;rgbColors[2]=60;break;
   default:rgbColors[0]=0;rgbColors[1]=0;rgbColors[2]=0;break;
  }
  
  switch(selectedElement)
  {
   case 1:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,1);break;
   case 2:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,2);break;
   case 3:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,3);break;
   case 4:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,4);break;
   default:tempElement= new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,1);
  }
  
  if(checkOverlap(tempElement)==false)
  {
  elementList.add(tempElement);
  }
  }
  else
  {
    
    if(mouseX>25&&mouseX<125)
    selectedElement=1;
    else if (mouseX>125&&mouseX<225)
    selectedElement=2;
    else if (mouseX>225&&mouseX<325)
    selectedElement=3;
    else if(mouseX>325)
    selectedElement=4;
    
    
    
  }
 
}


void mouseDragged()
{
  if(mouseY<400&&mouseX<440&&mouseX>elementSize)
  {
  Element tempElement;
  int rgbColors[]=new int[3];
  
  switch(selectedElement)
  {
   case 1:rgbColors[0]=255;rgbColors[1]=0;rgbColors[2]=0;break;
   case 2:rgbColors[0]=0;rgbColors[1]=0;rgbColors[2]=255;break;
   case 3:rgbColors[0]=0;rgbColors[1]=255;rgbColors[2]=0;break;
   case 4:rgbColors[0]=230;rgbColors[1]=230;rgbColors[2]=60;break;
   default:rgbColors[0]=0;rgbColors[1]=0;rgbColors[2]=0;break;
  }
  
  switch(selectedElement)
  {
   case 1:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,1);break;
   case 2:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,2);break;
   case 3:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,3);break;
   case 4:tempElement = new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,4);break;
   default:tempElement= new Element(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0, rgbColors,1);
  }
  
  if(checkOverlap(tempElement)==false)
  {
  elementList.add(tempElement);
  }
  }
  
}

boolean checkOverlap(Element tempElement)
{
  boolean overlap=false;
  for(int x=0;x<elementList.size();x++)
  {
    if(((Element)elementList.get(x)).getX()==tempElement.getX()&&((Element)elementList.get(x)).getY()==tempElement.getY())
    {
    elementList.remove(x);
    overlap=true;
    break;
    }
  }
  
  return overlap;
}


void selector()
{
 if(mouseY<400)
 {
 pushMatrix();
 translate(mouseX-(mouseX%elementSize)+elementSize/2,mouseY-(mouseY%elementSize)+elementSize/2,0);
 fill(255,100,255);
 box(elementSize);
 popMatrix(); 
 }
}

void keyPressed()
{
 if(key =='c')
 elementList.clear();

 if(key =='r')
 {
  rain=!rain;
 } 
 
 
  
}



