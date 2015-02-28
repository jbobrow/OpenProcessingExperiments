
int eSize = 30; //maru shikaku ookisa
int timer = 0;  //timer
int mode = 0; // 0:ellipse 1:rect
int touka = 360; //toumeido
int sikisou3 = 0;//sikisou color ver
int saido = 360;
int meido = 360;
void setup() 
{
  size(600, 600);
  background(255); //haikei
  smooth();
  noStroke();
  frameRate(30);
}


void draw() 
{
colorMode(HSB, 360);
if(keyPressed)//key nyu-ryoku
{
  
  
//maru or sikaku  
rectMode(CENTER); 
if(mousePressed==true)//mause no doragguzinomi
  { 
    
    
 


  if(mode == 0) 
{
    ellipse(mouseX, mouseY, eSize, eSize);
} 
else 
{
    rect(mouseX, mouseY, eSize, eSize);
}
  }
if(key == 'k') 
{

    mode = (mode + 1) % 2;
}




//tansyoku kuro  
  if(key=='b')//tansyoku b no toki
  {
      fill(0,0,meido,touka);//kuro
  }
//tansyoku aka 
  if(key == '1')//tansyoku 1 to r no toki
  {
      fill(0,saido,meido,touka);//aka
  }
//tansyoku orange  
  if(key == '2')//tansyoku 2 toki
  {
      fill(36,saido,meido,touka);//orange
  }
//tansyoku kiiro 
    if(key == '3')//tansyoku 3 to r no toki
  {
      fill(72,saido,meido,touka);//kiiro
  }
//tansyoku kimidori 
    if(key == '4')//tansyoku 4 no toki
  {
      fill(108,saido,meido,touka);//kimidori
  } 
//tansyoku midori
    if(key == '5')//tansyoku 5 no toki
  {
      fill(144,saido,meido,touka);//midori
  }
//tansyoku aomidori
    if(key == '6')//tansyoku 6 no toki
  {
      fill(180,saido,meido,touka);//aomidori  
  }
//tansyoku ao
    if(key == '7')//tansyoku 7 no toki
  {
      fill(216,saido,meido,touka);//ao
  }
//tansyoku aomurasaki
    if(key == '8')//tansyoku 8 no toki
  {
      fill(252,saido,meido,touka);//aomurasaki   
  }
//tansyoku murasaki
    if(key == '9')//tansyoku 9 no toki
  {
      fill(288,saido,meido,touka);//murasaki  
  }
//tansyoku akamurasaki
    if(key == '0')//tansyoku 0 no toki
  {
      fill(324,saido,meido,touka);//akamurasaki  
  }



//size henka
if(key=='q')//size ookiku
{
  eSize++;
}
if(key=='w')//size tiisaku
{
  if(eSize>1)
  {
    eSize--;
  }
}
if(key=='e')//size tiisaku
{
  eSize=30;
}  


//toumeido henka
if(key=='s')//toukado sage
{
  if(touka>=0)
  {
    touka-=5;
  }
}
if(key=='a')//toukado age
{
  if(touka<=360)
  {
    touka+=5;
  }
}
if(key=='z')//toukado nasi
{
    touka=360;
}
if(key=='x')//toukado hanbun
{
    touka=180;
}





//saido henka
if(key=='f')//saido age
{
  if(meido<=360)
      {
        meido+=5;
      }
}
if(key=='g')//saido sage
{
  if(meido<=360)
      {
        meido-=5;
      }
}
if(key=='h')//saido nasi
{
    meido=360;
}
if(key=='j')//saido max
{
    meido=0;
}



//saido henka
if(key=='r')//saido age
{
  if(saido<=360)
      {
        saido+=5;
      }
}
if(key=='t')//saido age
{
  if(saido>=0)
      {
        saido-=5;
      }
}
if(key=='y')//saido nasi
{
    saido=360;
}
if(key=='u')//saido max
{
    saido=0;
}



//irohenka 
if(key=='c')//c no toki
{  
//zikan
if(timer<=360)
   {
      timer ++;
      sikisou3++;
   }
if(timer>360)
   {
      timer=0;
      sikisou3=0;
   }

    fill(sikisou3,saido,meido,touka);
}


//syokika
if(key=='R')//syokigamen
{
  background(0,0,360);
  meido=360;
  saido=360;
}





//kesigomu
if(key=='d')//d no toki
{
   fill(0,0,360);
}



}
}


