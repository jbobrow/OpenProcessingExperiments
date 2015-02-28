
//movement
float xpos;
float ypos;
//Eyes1 
float m1=325;
float m2=350;
//Eyes2
float m3=475;
float m4=350;
//Background color
float c1=128;
//Bezier
float x1=300;
float x2=500;
float zx1=350;
float zy1=475;
float zx2=450;
float zy2=475;
float y1=475;
float y2=y1;

void setup ()
{
  size (800,800);
  background (128);
  smooth();
  noStroke();
  frameRate(45);

  
}

void draw ()
{
  //setting_____________________________
  background(128);
  xpos=mouseX;
  ypos=mouseY;
  
 //Eyes up_______________________________
  if (ypos < 400) 
  { m2=m2+1;
    m4=m4+1;}
  
  if (m2 < 325)
  { m2=325;
    m4=325;}
   //Eyes left______________________________
  if (xpos<400)
  { m1=m1-1;
    m3=m3-1;}
  
  if (m1<310)
  { m1=310;
    m3=460;}
  //Eyes down________________________________
  if (ypos > 400)
  { m2=m2-1;
    m4=m4-1;}
 
   if (m2> 375)
  { m2=375;
    m4=375;}
  //Eyes right________________________________
  if (xpos> 400)
  { m1=m1+1;
    m3=m3+1;}
  
  if (m3>490)
  { m1=340;
    m3=490;}
    
  //Mouth______________________________________
  if (ypos<400)
  {zy1=zy1-2;
   zy2=zy2-2;}
   
   if (zy1>575)
   {zy1=575;
    zy2=575;}
  
  if (ypos>400)
  {zy1=zy1+2;
   zy2=zy2+2;}
   
   if (zy1< 425)
   {zy1=425;
    zy2=425;}
  
  //background__________________________________
  if(ypos>400)
  {c1=c1+10;
   background (c1);}
  
  if(ypos<400)
  {c1=c1-10;
   background (c1);}
 
  //face_________________________________________
  ellipseMode(CENTER);
  fill (220,250,0);
  ellipse (400,400,350,350);
  fill (255);
  ellipse (325,350,100,100);
  ellipse (475,350,100,100);
  fill (0);
  ellipse (m1,m2,50,50);
  ellipse (m3,m4,50,50);
  strokeWeight(5);
  fill(255,0,0);
  bezier (x1, y1, zx1, zy1, zx2, zy2, x2, y2);
  
  //Snowflakes
  fill(255);
  ellipse (100,100,50,50);
  ellipse (200,200,50,50);
  ellipse (300,100,50,50);
  ellipse (100,400,50,50);
  ellipse (700,400,50,50);
  ellipse (700,100,50,50);
  ellipse (500,100,50,50);
  ellipse (600,200,50,50);
  ellipse (700,700,50,50);
  ellipse (500,700,50,50);
  ellipse (600,600,50,50);
  ellipse (100,700,50,50);
  ellipse (300,700,50,50);
  ellipse (200,600,50,50);
  //flowers
  if(c1>240)
  {
    //Flower 1
   fill(random(255),random(255),random(255));
    ellipse (120,100,100,50);
    ellipse (80,100,100,50);
    ellipse (100,80,50,100);
    ellipse (100,120,50,100);
    ellipse (120,120,50,50);
    ellipse (120,80,50,50);
    ellipse (80,120,50,50);
    ellipse (80,80,50,50);
    fill(255,20,20);
    ellipse (100,100,50,50);
    //Flower2
    fill(random(255),random(255),random(255));
    ellipse (220,200,100,50);
    ellipse (180,200,100,50);
    ellipse (200,180,50,100);
    ellipse (200,220,50,100);
    ellipse (220,220,50,50);
    ellipse (220,180,50,50);
    ellipse (180,220,50,50);
    ellipse (180,180,50,50);
    fill(255,20,20);
    ellipse (200,200,50,50);
    //flower3
    fill(random(255),random(255),random(255));
    ellipse (320,100,100,50);
    ellipse (280,100,100,50);
    ellipse (300,80,50,100);
    ellipse (300,120,50,100);
    ellipse (320,120,50,50);
    ellipse (320,80,50,50);
    ellipse (280,120,50,50);
    ellipse (280,80,50,50);
    fill(255,20,20);
    ellipse (300,100,50,50);
    //Flower4
    fill(random(255),random(255),random(255));
    ellipse (120,400,100,50);
    ellipse (80,400,100,50);
    ellipse (100,380,50,100);
    ellipse (100,420,50,100);
    ellipse (120,420,50,50);
    ellipse (120,380,50,50);
    ellipse (80,420,50,50);
    ellipse (80,380,50,50);
    fill(255,20,20);
    ellipse (100,400,50,50);
    //Flower5
     fill(random(255),random(255),random(255));
    ellipse (720,400,100,50);
    ellipse (680,400,100,50);
    ellipse (700,380,50,100);
    ellipse (700,420,50,100);
    ellipse (720,420,50,50);
    ellipse (720,380,50,50);
    ellipse (680,420,50,50);
    ellipse (680,380,50,50);
    fill(255,20,20);
    ellipse (700,400,50,50);
    //Flower6
    fill(random(255),random(255),random(255));
    ellipse (720,100,100,50);
    ellipse (680,100,100,50);
    ellipse (700,80,50,100);
    ellipse (700,120,50,100);
    ellipse (720,120,50,50);
    ellipse (720,80,50,50);
    ellipse (680,120,50,50);
    ellipse (680,80,50,50);
    fill(255,20,20);
    ellipse (700,100,50,50);
    //Flower7
     fill(random(255),random(255),random(255));
    ellipse (520,100,100,50);
    ellipse (480,100,100,50);
    ellipse (500,80,50,100);
    ellipse (500,120,50,100);
    ellipse (520,120,50,50);
    ellipse (520,80,50,50);
    ellipse (480,120,50,50);
    ellipse (480,80,50,50);
    fill(255,20,20);
    ellipse (500,100,50,50);
    //Flower8
     fill(random(255),random(255),random(255));
    ellipse (620,200,100,50);
    ellipse (580,200,100,50);
    ellipse (600,180,50,100);
    ellipse (600,220,50,100);
    ellipse (620,220,50,50);
    ellipse (620,180,50,50);
    ellipse (580,220,50,50);
    ellipse (580,180,50,50);
    fill(255,20,20);
    ellipse (600,200,50,50);
    //Flower9
    fill(random(255),random(255),random(255));
    ellipse (720,700,100,50);
    ellipse (680,700,100,50);
    ellipse (700,680,50,100);
    ellipse (700,720,50,100);
    ellipse (720,720,50,50);
    ellipse (720,680,50,50);
    ellipse (680,720,50,50);
    ellipse (680,680,50,50);
    fill(255,20,20);
    ellipse (700,700,50,50);
    //Flower10
     fill(random(255),random(255),random(255));
    ellipse (520,700,100,50);
    ellipse (480,700,100,50);
    ellipse (500,680,50,100);
    ellipse (500,720,50,100);
    ellipse (520,720,50,50);
    ellipse (520,680,50,50);
    ellipse (480,720,50,50);
    ellipse (480,680,50,50);
    fill(255,20,20);
    ellipse (500,700,50,50);
    //Flower11
     fill(random(255),random(255),random(255));
    ellipse (620,600,100,50);
    ellipse (580,600,100,50);
    ellipse (600,580,50,100);
    ellipse (600,620,50,100);
    ellipse (620,620,50,50);
    ellipse (620,580,50,50);
    ellipse (580,620,50,50);
    ellipse (580,580,50,50);
    fill(255,20,20);
    ellipse (600,600,50,50);
    //Flower12
    fill(random(255),random(255),random(255));
    ellipse (120,700,100,50);
    ellipse (80,700,100,50);
    ellipse (100,680,50,100);
    ellipse (100,720,50,100);
    ellipse (120,720,50,50);
    ellipse (120,680,50,50);
    ellipse (80,720,50,50);
    ellipse (80,680,50,50);
    fill(255,20,20);
    ellipse (100,700,50,50);
    //Flower13
     fill(random(255),random(255),random(255));
    ellipse (320,700,100,50);
    ellipse (280,700,100,50);
    ellipse (300,680,50,100);
    ellipse (300,720,50,100);
    ellipse (320,720,50,50);
    ellipse (320,680,50,50);
    ellipse (280,720,50,50);
    ellipse (280,680,50,50);
    fill(255,20,20);
    ellipse (300,700,50,50);
    //Flower14
     fill(random(255),random(255),random(255));
    ellipse (220,600,100,50);
    ellipse (180,600,100,50);
    ellipse (200,580,50,100);
    ellipse (200,620,50,100);
    ellipse (220,620,50,50);
    ellipse (220,580,50,50);
    ellipse (180,620,50,50);
    ellipse (180,580,50,50);
    fill(255,20,20);
    ellipse (200,600,50,50);
 
  }
    
}


