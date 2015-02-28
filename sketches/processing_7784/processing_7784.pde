

int [] xPosities = new int [15];
int [] yPosities = new int [15];


int [] xposities = new int [100];
int [] yposities = new int [100];



void setup ()
{
  size (300, 500);
  smooth ();
  
  for(int i=0;i<15;i++) 
  { xPosities[i] = int(random(0,280));
    yPosities[i] = int(random(0,200));
 }
 
  frameRate(25);
}

void draw ()
{
 
  background (100,190,255);
  
  rectMode (CORNER); //sneeuw
  fill (255);
  rect (0,400,300,500);
  
  tekenSneeuwman();
  
  for(int i=0;i<15;i++) //loop van 0 tot met 14
  { 
    int xPositie = xPosities[i]+int(random(-4,4));
    int yPositie = yPosities[i]++;

    tekenKristallen(xPositie,yPositie); //teken kristallen met de waarde uit de xPosities array en de yPosities array
   
  }
}
void mousePressed () //sneeuwstrorm
{
   for(int i=0;i<200;i++) //loop van 0 tot met 199
   {
    int xpositie = int(random(250))*10;
    int ypositie = int(random(250))*10;
    
    tekenBolletjes(xpositie,ypositie);
   }
}
    
  
void tekenKristallen (int x, int y)
{
  //sneeuwkristallen
    rectMode (CENTER);
    fill(255,255,255,100);
    rect (x,y,10,10);
    rect (x,y,10,50);
    rect (x,y,50,10);
    rect (x-20,y,5,20);
    rect (x+20,y,5,20);
    rect (x,y-20,20,5);
    rect (x,y+20,20,5);
}

void tekenSneeuwman()
{ 
  //bolletjes
  ellipseMode (CENTER);
  fill (255);
  ellipse (150,370,150,150);
  ellipse (150,270,125,125);
  ellipse (150,170,100,100);
  
  //ogen
  fill (0);
  ellipse (135,160,7,7);
  ellipse (165,160,7,7);
  
  //mond
  fill (0);
  ellipse (150,200,7,7);
  ellipse (140,197,7,7);
  ellipse (130,194,7,7);
  ellipse (160,197,7,7);
  ellipse (170,194,7,7);
  
  // knopjes
  fill (0);
  ellipse (150,240,7,7);
  ellipse (150,270,7,7);
  ellipse (150,300,7,7);
  
  //hut
  fill (0);
  ellipse (150,130,90,20);
  rect (115,90,70,40);
  
  //neus
  fill (200,120,100);
  triangle (150,170,150,180,110,160);
  
}


void tekenBolletjes ( int x, int y)
{
   //sneuwvlokken
  fill (255,255,255,50);
  ellipse (x,y,30,30);
  fill(255,255,255,200);
  ellipse(x-120,y-300,15,15);
  fill (255,255,255,255);
  ellipse (x-100,y-150,40,40);
}

