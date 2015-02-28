
boolean MouseIsDown=false;
Circle [] circle = new Circle[50];
Circle R;
Circle G;
Circle B;
int countsize=0;
int count=3;
int lastCount=0;

void setup()
{
  size(1200,640);

  
  circle [0]=new Circle(50,0.01,255,0,0);
  circle [1]=new Circle (50,0.02,0,255,0);
  circle [2]=new Circle(50,0.05,0,255,0);
  
  
}

void draw()
{
  background(255);

  
  for (int i = 0; i<count;i++)
  {
    Circle I = circle[i];
    
    I.makeCircle();
    I.update();
    
  }
  //INSTRUCTIONS
  {fill(13,211,103,70);
  text("Click and hold to see a new birth. /nThe cycle will restart after 50 births", 0,20+ mouseY/9);}
  
  
  if (!MouseIsDown)
  {
    
     //GRID/LAYOUT
  noStroke();
  fill(200,140,170,50);
  rect (500,600-mouseX/2,400,50);
  fill(0,62,85,40);
  rect( 0,height/2,400-mouseX/2,300 );
  fill( 0,167,32,40 );
  rect( 0, height/5, 500-mouseY/2, 30 );
  fill( 255,205,23,60 );
  rect( 0,height/3,mouseX+50,300  );
  fill( 255,23,77,40 );
  rect( width/6,mouseY/5,40,300 );
  fill(255,112,3,30);
  rect( width/5+mouseY/7, height/3.5,width,mouseX/4 );
  fill( 232,255,62,75 );
  rect( (width/4)*3, (height/6)*4, mouseX/2, 100+mouseY/8);
    
  }

  
  if (MouseIsDown)
  {
    countsize++;
    fill(129);
    ellipse(mouseX,mouseY,countsize,countsize);
    
          //JITTER
          noStroke();
          fill(200,140,170,50);
          rect (random(500, 500+countsize/2),600-mouseX/2,400,50);
          fill(0,62,85,40);
          rect( random(0,countsize/2),height/2,400-mouseX/2,300 );
          fill( 0,167,32,40 );
          rect( random(0,countsize/2), height/5, 500-mouseY/2, 30 );
          fill( 255,205,23,60 );
          rect( random(0,countsize/2),height/3,mouseX+50,300  );
          fill( 255,23,77,40 );
          rect(random(width/6,(width/6)+countsize/2),mouseY/5,40,300 );
          fill(255,112,3,30);
          rect( random(width/5+mouseY/7,(width/5+mouseY/7)+countsize/2), height/3.5,width,mouseX/4 );
          fill( 232,255,62,75 );
          rect( random((width/4)*3,((width/4)*3)+countsize/2), (height/6)*4, mouseX/2, 100+mouseY/8);
    
  }
  
  
  
  
  
  if (count==50)
  {
    count=3;
  }
  

  
}
void mousePressed()
{
  
  if (countsize!=0)
    {countsize=0;}
  MouseIsDown=true;
}
void mouseReleased()
{ 
  circle[count] = new Circle(countsize,random(.001,.09),random(255),random(255),random(255));
  MouseIsDown=false;
  count++;
}




class Circle
{
  float mehX;
  float mehY;
  float easing;
  float x;
  float y;
  float R;
  float G;
  float B;
  float size;
  
  Circle (float S, float E,float r, float g, float b)
      {
        mehX=0;
        mehY=0;
        easing=E;
        x=0;
        y=0;
        R=r;
        G=g;
        B=b;
        size=S;
        
       }
        
          
         void update()
         {
             mehX = mouseX-x;
            if (abs(mehX)>1)
              {x = x + mehX * easing ;}
            
             mehY = mouseY-y;
            if (abs(mehY)>1)
              {y = y + mehY * easing ;}
         
         }
           
         void makeCircle()
         {
           noStroke();
           fill(R, G, B, 50);
           ellipse (x,y,size,size);
         }
          
  }
  
  


  


