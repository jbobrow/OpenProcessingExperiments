
float[][] RandNums = new float[3][1000];
int [][] Rand123= new int[2][1000];

boolean mouseIsPressed=false;
int count=0;


void setup()
{
  size (600,600);
  
  
 
    for(int x=0;x<1000;x++)
    {
        {RandNums[0][x]=random(0,600);}
        {RandNums[1][x]=random(0,200);}
        {RandNums[2][x]=random(-45,45);}
    }
  
    for(int x=0;x<1000;x++)
    {
        {  Rand123[0][x]=(int)random(1,4);
           Rand123[1][x]=(int)random(1,4);  }
    }

  
  
}


void draw()
{
  //CONTSANT
  background(252,222,187);

 
  float randradians;


  for (int x=0 ;x<1000 ;x++)
    {
      randradians=RandNums[2][x];
    }
    
    
    
  for(int x=0;x<1000;x++)
  {
    
      pushMatrix();
      translate((RandNums[0][x]),(RandNums[1][x]));
      rotate(radians(   (RandNums[2][x]     )   ));
  
       leaf( (RandNums[0][x]), (RandNums[1][x]),x );
       
      popMatrix();
   }
   
   fill(100,40,30);
   rect(200,375,200,15);
   rect(200,400,200,15);
   rect(200,425,200,15);
   fill(64,22,15); 
   rect(200,440,200,20);
   triangle(200,440,200,460,180,460);
   triangle(400,440,400,460,420,460);
   
   stroke(168,0,34);
   strokeWeight(3);

   
   line(225,460,225,490);
   line(375,460,375,490);
  
   noStroke();
   fill(255,252,227);
   rect(0,500,600,50);
   
   stroke(227,225,206);
   line(100,500,30,550);
   line(200,500,160,550);
   line(300,500,300,550);
   line(400,500,440,550);
   line(500,500,560,550);
     
 //ENDCONSTANT
 
 
 for(int x=0;x<(mouseX/50);x++)
 { 
   float randy= RandNums[0][x];
   float randyy= RandNums[1][x];
   int col= Rand123[0][x];
   pushMatrix();
   translate(randy+count/2,randyy+count);
   rotate(radians(  -45  ));
     leaf(randy+count/2 ,randyy+count,col);
   popMatrix();
 }
   

   if(count<650)
      {count+=2;}
   else
      {count=0;}

  
}





void leaf(float XPos, float YPos, int randx)
{
  int rand1=Rand123[0][randx];
  int rand2=Rand123[1][randx];
 
  
  if (rand1==1)
    {fill(168,0,34);}
  if (rand1==2)
    {fill(100,0,15);}
  if (rand1==3)
    {fill(250,197,137);}  
  if (rand1==4)
    {fill(250,200,180);}
  
  //LEAF
  noStroke();
  arc(0, 0, 24, 24, -PI, 0);  //
  triangle((0-12), (0-.5) , (0+12) , (0-.5) , (0) , (0+24));
  
  if (rand2==1)
    {fill(250,197,137);}
  if (rand2==2)
    {fill(250,200,180);}
  if (rand2==3)
    {fill(168,0,34);}
    
  //STEM
  rect(  (0-.05), (0-20), 1, 30);
  
}


void mousePressed()
{mouseIsPressed=true;}

void mouseReleased()
{mouseIsPressed=false;}


