
PShape[] shapes;
PImage pal;

void setup()
{
  background(255);
  size(800,700);
shapes = new PShape[7];
//s = loadShape("octopus.svg");
pal=loadImage("pal.jpg");
for (int i = 0; i < 7; i++) 
    {
      // Use nf() to number format 'i' into four digits
      String filename = "s" + nf(i,0) + ".svg";
      shapes[i] = loadShape(filename);
      shapes[i].disableStyle();
      count[i]=0;
    }
smooth();
}


int[] count = new int[7];
int px, py; //Random Holds for Palette color selections.
color pix; //The color var


void draw()
{
    
  
  
 //shape0- octopus
 
  
  shapeMode(CENTER);
if(abs(sqrt(sq(mouseX-pmouseX)+sq(mouseY-pmouseY)))>2)
{
  //octopus
   if(mouseX>620 && mouseX<790)
  {
    if(mouseY>320 && mouseY<420)
    {
      drawshape(620,720,320,420,0,80,120);
    }
  }
  //sun
    if(mouseX>520 && mouseX<700)
  {
    if(mouseY>200 && mouseY<300)
    {
      drawshape(520,620,220,320,2,50,80);
    }
  }
  //flower
   if(mouseX>400 && mouseX<640)
  {
    if(mouseY>420 && mouseY<520)
    {
      drawshape(400,640,420,520,1,30,50);
    }
  }
  //cloud
   if(mouseX>400 && mouseX<490)
  {
    if(mouseY>250 && mouseY<380)
    {
      drawshape(400,520,250,400,3,100,150);
    }
  }
  
  if(mouseX>490 && mouseX<600)
  {
    if(mouseY>300 && mouseY<400)
    {
      drawshape(490,620,300,420,3,100,150);
    }
  }

  //ribbon
   if(mouseX>100 && mouseX<400)
  {
    if(mouseY>200 && mouseY<250)
    {
      drawshape(100,400,200,300,5,150,200);
    }
  }
  
   //ribbondown
   if(mouseX>200 && mouseX<450)
  {
    if(mouseY>450 && mouseY<500)
    {
      drawshape(200,450,400,500,6,150,200);
    }
  }
  
  //bubble
   if(mouseX>200 && mouseX<400)
  {
    if(mouseY>300 && mouseY<400)
    {
      drawshape(200,400,300,400,4,50,60);
    }
  }
  
   //flower
   if(mouseX>0 && mouseX<200)
  {
    if(mouseY>250 && mouseY<450)
    {
      drawshape(0,200,250,450,1,30,50);
    }
  }


}

if(minute()%2==0)
{
  if(second()<1)
  {
  fill(255,60);
  rect(0,0,800,700);
  }
  if(second()>1 && second()<2)
  {
  fill(255,40);
  rect(0,0,800,700);
  }
  if(second()>2 && second()<3)
  {
  fill(255,20);
  rect(0,0,800,700);
  }
  if(second()>3 && second()<4)
  {
  fill(255);
  rect(0,0,800,700);
  }
}


}










public void drawshape(int x1,int x2,int y1,int y2,int num,int s1,int s2)
{
      int a= int(random(90,100));
      int x= int(random(x1,x2));
      int y= int(random(y1,y2));
      int s3= int(random(s1,s2));
      int s4=0;
      if(num==3)
      {
       s4=s3-30;
      }
      else if(num==5 || num==6)
      {
        s4=s3-50;
      }
      else
      {
       s4=s3;
      }
      // fill(119,27,83,a);
      fill(255,1);
      rect(0,0,800,700);
       if(count[num]%3==0)
       {
         fill(255);
         stroke(0);
       }
       else if(count[num]%5==0)
       {
         fill(0);
       }
       else
       {
       px = int(random(pal.width));
       py = int(random(pal.height));
       pix = pal.get(px,py);
       fill(pix);
       stroke(0);
       }
      // stroke(a);
       shape(shapes[num],mouseX, mouseY, s3,s4);
       count[num]=count[num]+1;
}





