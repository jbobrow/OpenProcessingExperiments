
int H;
int M;
int S;
int lastS;
int countscore=0;
int countS=0;
int countM=0;
int countH=0;
int lastM;
PImage smile;
PImage sad;
PImage bomb;
int[] squaresX = new int[28];
int[] squaresY = new int[23];



void setup()
{
  frameRate(1);
  smile= loadImage("smile.jpg");
  sad = loadImage ("sad.jpg");
  bomb = loadImage ("bomb.png");
  
  fill(0);
  
  size(600,600);
  background(206);
  fill(4,23,137);
  rect(0,0,600,30);
  fill(255);
  text("Minesweeper",10,20);
  fill(206);
  rect(529,5,20,20);
  rect(550,5,20,20);
  rect(571,5,20,20);
  fill(0);
  text("_     []    X" , 535,20);
  fill(206);
  rect(0,30,600,25);
  fill(0);
  text(" Game     Help" , 0,50);
  
  fill(190);
  rect(0,55,600,545);
  
  //SETSQUARES
  for(int x=0;x<(560/20);x++)
    {
        //line((20*x + 20),120,(20*x+20),580);
        squaresX[x]=(20*x + 20);
    }
   for(int y=0; y<(460/20);y++)
   {
        //line(20,(20*y + 120),580,(20*y + 120));
        squaresY[y]=(20*y + 120);
   }
      
  
}


void draw()
{
  
  fill(206);
  noStroke();
  //rect(15,70,570,25);
  fill(255);
  H= hour();
  M= minute();
  S= second();
  
          //text( H + " : " + M + " : " + S,20,85);
          fill(206);
          rect (15,70,570,45);
          
          fill(0);
          rect(100,75,75,35);
          rect(430,75,75,35);
          
          fill(250,0,8);
          textSize(26);
          text(countM+ ":"+countS, 105, 100);
          text(countscore, 435, 100);
          textSize(10);
          
          image(smile, 280,75,40,40);
 

  
  if (S != lastS)
  {
    //println("A second elapsed");
    lastS = S;
    countS++;
  }
  /*
  if (countM != lastM)
  {
    //println("A Minute elapsed");
    lastM = countM;
    fill(190);
    rect(20,122,579,582);
  }*/
   if(countS ==1)
   {
      fill(190);
      rect(0,120,600,545);
   }
   

    //Every5Secs
  if ((countS%5 -1)== 0 && countS !=59 && countS !=1  )//countS !=58)
    {
            int randomX=int(random(0,28));
            int randomY=int(random(0,23));
            int random3=int(random(0,2));
            int PointRandX = squaresX[randomX];
            int PointRandY = squaresY[randomY];
            
            fill(210,210,210);
            rect(PointRandX,PointRandY,20,20);
            textSize(10);
            if(random3==0)
            {
              fill(38,101,198);
              text("1",(PointRandX+10), (PointRandY+15));
            }
           
            if(random3==1)
            {
              fill(42,129,0);
              text("2",(PointRandX+10), (PointRandY+15));
            }
            
            if(random3==2)
            {
              fill(255,0,0);
              text("3",(PointRandX+10), (PointRandY+15));
            }
     
    }
  if(countscore==12)
   {
              fill(210);
              rect(40,140,20,20);
              image(bomb,40, 140,20,20);
     
   }
    if ((countS%5)== 0  && countS !=60)//countS !=58)
    {
       countscore++;  
    }
    
    
   if(countS ==60)
   {
              int randomX=int(random(0,28));
              int randomY=int(random(0,23));
              int PointRandX = squaresX[randomX];
              int PointRandY = squaresY[randomY];
              
              fill(210);
              rect(PointRandX,PointRandY,20,20);
              image(bomb,(PointRandX), (PointRandY),20,20);
              
              fill(38,101,198);
              textSize(10);
              
              image(sad, 280,75,40,40);
              countscore=0;
              countM=0;
              countS=0;
   }
   
  
   
  
  stroke(0);
  strokeWeight(1);
  for(int x=0;x<=(560/20);x++)
  {
    line((20*x + 20),120,(20*x+20),580);
    
      for(int y=0; y<=(460/20);y++)
      {
        line(20,(20*y + 120),580,(20*y + 120));
      }
      
  }
  noStroke();
  
  
 
  if (countS==60)
  {
    countS=0;
    countM++;
  }
  if (countM==60)
  {
    //countS=0;
    countH++;
  }
  
  

  
  
}































