

/** Hyo Jin Yoo
* second assignment using mouseX, mouseY
* Color changing forest by pressing mouse and mouseX, mouseY
**/


// keypressed variables
boolean monoColor = false;
boolean mouseDragging=false;
boolean bearTrapped=false;

//tree variables
float treeDiameter;
float rectH ;
float rectW;
float stepSize;

//color variables
int r =0;
int g =0;
int b =0;
int transparancy = 170;

color bg = color(0);
color tree1;
color tree2;
color tree3;
color tree4;
color tree5;

//bear class
Bear bear;

void setup() 
{
  bear = new Bear();
  size(720, 480);
  smooth();
  noStroke();
  fill(0);
  noCursor();
  stepSize = width/20;
}

void draw() {
  
  //bg day to night by mouseY
  int bgVar = (int)map(mouseY, 0, height, 255, 100);
  //background(0);
 fill(bg);
  rect(0, 0, width, height);

  
  //tree's color change by mouseS
  r = (int)map(mouseX, 0, width, 0, 255);
  g = (int)map(mouseX, 0, width, 0, 255);
  b = (int)map(mouseX, 0, width, 0, 255);
  
  if(monoColor)
  {
    bg = color(bgVar-50,255);
    tree1= tree2= tree3= tree4= tree5= color(0);//, transparancy-100);
    /*
    tree1= color(r, 0, 0, transparancy-80);
    tree2= color(0, g, 0, transparancy-20);
    tree3= color(r, 0, b, transparancy-60);
    tree4= color(r, g, 0, transparancy-40);
    tree5= color(0, g, b, transparancy-100);
    */
  }
  else
  {
    bg = color(bgVar-70,bgVar,0,255);
    //bg = color(bgVar-70,bgVar,0,100);
    tree1= color(0, g, b, transparancy-20);
    tree2= color(r, 0, b, transparancy-50);
    tree3= color(r, g, 0, transparancy-20);
    tree4= color(0, g, b, transparancy-40);
    tree5= color(r, 0, b, transparancy-20);
  }
  
  
  drawTree();
  
   if(dist(width-width/4, height/2, mouseX, mouseY)< 30 )
  {
    fill(255);
    for(int i=0; i <=100; i +=10)
    {
      for(int j=0; j <=100; j +=10)
      {
          ellipse(width-width/4-30+i, height/2-50+j,5,5);
      }
    }
  }
  
  if(mouseDragging == true)
  {
     bear.bearWalk(mouseX, mouseY);
    
  }
  else if(bearTrapped == true)
  {
    bear.bearCry(mouseX, mouseY);
  }else
  {
    bear.bearDraw(mouseX, mouseY);
  }
  
  if(dist(width/4, height/2, mouseX, mouseY)< 30 )
  {
    bearTrapped=true;
    stroke(0);
    strokeWeight(0.3);
    noFill();
     for(int i=0; i <=120; i +=20)
    {
      for(int j=0; j <=120; j +=20)
      {
         ellipse(mouseX, mouseY,120,j);
         ellipse(mouseX, mouseY,j,120);

      }
    }
  }else  bearTrapped=false;
  
 
   
}

void drawTree()
{
  
   for (int x=0; x<=width; x+=stepSize) 
  {
    //tree1(triangle)==========================================================================================================================================
    for (int y=0; y<=height; y+=stepSize)
    {
      float distanceToMouse = dist(x, y, mouseX, mouseY);
      treeDiameter = distanceToMouse*0.2;
      rectH =treeDiameter*0.5-distanceToMouse*0.01;
      rectW =treeDiameter/4;
      fill(tree1);
      noStroke();
      rect(x+stepSize/2-rectW/2, y+stepSize/2+stepSize*0.1+treeDiameter*0.2, rectW, rectH);
      triangle((x+stepSize/2), (y+stepSize/2-stepSize*0.1)-treeDiameter*0.2, (x+stepSize/2-stepSize*0.1)-treeDiameter*0.2,
               (y+stepSize/2+stepSize*0.1)+treeDiameter*0.2, (x+stepSize/2+stepSize*0.1)+treeDiameter*0.2, (y+stepSize/2+stepSize*0.1)+treeDiameter*0.2);
    }
  }

  //tree2==========================================================================================================================================
  for (int i=0; i<2; i++) {
    for (int x=0; x<=width; x+=stepSize*2) 
    {
      for (int y=0; y<=height; y+=stepSize*2)
      {
        float distanceToMouse = dist(x, y, mouseX, mouseY);
        treeDiameter = distanceToMouse*0.2;
        rectH =treeDiameter;
        rectW =treeDiameter/4;
        
        if(i==0)
        {
          tree2= color(r, 0, b, transparancy-20);
        }else
        {
          tree2= color(0, g, b, transparancy-20);
        }
        fill(tree3);
        fill(tree2);
        ellipse(x+i*stepSize, y+i*stepSize, treeDiameter, treeDiameter);
        rect(x+i*stepSize-rectW/2, y+i*stepSize, rectW, rectH);
      }
    }
  }
  //tree3==========================================================================================================================================
  for (int i=0; i<2; i++) 
  {
    for (int x=0; x<=width; x+=stepSize*2) 
    {
      for (int y=0; y<=height; y+=stepSize*2)
      {
        float distanceToMouse = dist(x, y, mouseX, mouseY);
        treeDiameter = distanceToMouse*0.2;
        rectH =treeDiameter;
        rectW =treeDiameter/4;
        if(i==0)
        {
          tree3= color(r, g, 0, transparancy-20);
        }else
        {
          tree3= color(0, g, b, transparancy-20);
        }
        fill(tree3);
        ellipse(x+stepSize+i*stepSize, y+i*stepSize, treeDiameter, treeDiameter);
        rect(x+stepSize-rectW/2+i*stepSize, y+i*stepSize, rectW, rectH);
      }
    }
  }
}

void mousePressed() {
  monoColor = !monoColor;
}

void mouseDragged()
{
  mouseDragging = true;
 
}

void mouseReleased()
{
  mouseDragging = false;
 
}
class Bear
{
  color bearC;
  color eyeC;
  float bearCenterX;
  float bearCenterY;
  int earSize=24;
  float legLeft;
  float legRight;
  
  float tears;
  
  float dirL = -1;
  float dirR = 1;
  
  int bearUnit =3;
  
  Bear()
  {
    bearC = color(255, 0, 0);
    eyeC = color(255);
  }

  void bearDraw(int _mouseX,int _mouseY)
  {
    bearCenterX =_mouseX+61;
    bearCenterY =_mouseY+21;
    legLeft=15;
    legRight=15;
    tears =0;
    noStroke();
    fill(bearC);
    
    //head
    ellipse(bearCenterX-62, bearCenterY-44, 62, 62);
    
    //body
    ellipse(bearCenterX-62, bearCenterY-5, 36, 32);
    rect(bearCenterX-80, bearCenterY-4, 36, 22);
    ellipse(bearCenterX-62, bearCenterY+62-47, 36, 32);
    ellipse(bearCenterX-84, bearCenterY+62-127, earSize, earSize);
    ellipse(bearCenterX-62+25, bearCenterY+62-127, earSize, earSize);
    //legs
    rect(bearCenterX-77, bearCenterY+24, earSize/2, legLeft);
    ellipse(bearCenterX-71, bearCenterY+29, earSize/2, earSize/2);
    rect(bearCenterX-59, bearCenterY+24, earSize/2, legRight);
    ellipse(bearCenterX-71, bearCenterY+29, earSize/2, earSize/2);
    
     //lip
    stroke(eyeC);
    strokeWeight(1);
    line(bearCenterX-67, bearCenterY-29, bearCenterX-58, bearCenterY-29);
    noStroke();

    //eye
    fill(eyeC);
    ellipse(bearCenterX-72, bearCenterY-43, earSize/4, earSize/4);
    ellipse(bearCenterX-50, bearCenterY-43, earSize/4, earSize/4);

    
  }
  
  void bearWalk(int _mouseX, int _mouseY)
  {
    bearCenterX =_mouseX+61;
    bearCenterY =_mouseY+21;

    noStroke();
    fill(bearC);
    
    //head
    ellipse(bearCenterX-62, bearCenterY-44, 62, 62);
    
    //body
    ellipse(bearCenterX-62, bearCenterY-5, 36, 32);
    rect(bearCenterX-80, bearCenterY-4, 36, 22);
    ellipse(bearCenterX-62, bearCenterY+62-47, 36, 32);
    ellipse(bearCenterX-84, bearCenterY+62-127, earSize, earSize);
    ellipse(bearCenterX-62+25, bearCenterY+62-127, earSize, earSize);
    //legs
    
    legLeft +=01*dirL;
    legRight +=1*dirR;
    
    rect(bearCenterX-77, bearCenterY+24, earSize/2, legLeft);
    ellipse(bearCenterX-71, bearCenterY+29, earSize/2, earSize/2);
    rect(bearCenterX-59, bearCenterY+24, earSize/2, legRight);
    ellipse(bearCenterX-71, bearCenterY+29, earSize/2, earSize/2);
    println("legLeft : "+legLeft+"legRight : "+legRight);
     //lip
    stroke(eyeC);
    strokeWeight(1);
    line(bearCenterX-67, bearCenterY-29, bearCenterX-58, bearCenterY-29);
    noStroke();
    //eye
    fill(eyeC);
    ellipse(bearCenterX-72, bearCenterY-43, earSize/4, earSize/4);
    ellipse(bearCenterX-50, bearCenterY-43, earSize/4, earSize/4);

   
    
    if(legLeft ==10 && legRight ==20)
    {
      dirL =1;
      dirR=-1;
      
    }else if(legLeft ==20 && legRight ==10)
    {
      dirL =-1;
      dirR =1;
    }
    
  }
  
  void bearCry(float _mouseX,float _mouseY)
  {
    bearCenterX =_mouseX+61;
    bearCenterY =_mouseY+21;
    //legLength=15;
    noStroke();
    fill(bearC);
    
    //head
    ellipse(bearCenterX-62, bearCenterY-44, 62, 62);
    
    //body
    ellipse(bearCenterX-62, bearCenterY-5, 36, 32);
    rect(bearCenterX-80, bearCenterY-4, 36, 22);
    ellipse(bearCenterX-62, bearCenterY+62-47, 36, 32);
    ellipse(bearCenterX-84, bearCenterY+62-127, earSize, earSize);
    ellipse(bearCenterX-62+25, bearCenterY+62-127, earSize, earSize);
    //legs
    rect(bearCenterX-77, bearCenterY+24, earSize/2, 15);
    ellipse(bearCenterX-71, bearCenterY+29, earSize/2, earSize/2);
    rect(bearCenterX-59, bearCenterY+24, earSize/2, 15);
    ellipse(bearCenterX-71, bearCenterY+29, earSize/2, earSize/2);
     //lip
    stroke(eyeC);
    strokeWeight(1);
    line(bearCenterX-67, bearCenterY-29, bearCenterX-58, bearCenterY-29);
    noStroke();
    
    tears ++;

    //eye
    fill(eyeC);
    ellipse(bearCenterX-72, bearCenterY-43, earSize/4, earSize/4);
    ellipse(bearCenterX-50, bearCenterY-43, earSize/4, earSize/4);
    rect(bearCenterX-72-(earSize/4)/2, bearCenterY-43,earSize/4,tears);
    rect(bearCenterX-50-(earSize/4)/2, bearCenterY-43 ,earSize/4,tears);
   
    if(tears ==20)
    {
      tears =0;
    }
  }

}



