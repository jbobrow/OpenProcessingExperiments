

int a = 0;
int h = 100;
int k = 3;

int julz = 600;
int lup = 3;

int j = 0;
int gold = 1;

int x = 100;
int y = 200;

int x2 = 150;

int arrow = 0;
int trian = 0;
int laine = 0;

//rectangle
int recX = 80;
int recW = 0;

int speed = 3;

//colours
int c1 = 255;
int c2 = 0;

void setup()
{
  size(700,400);
  background(0);
  smooth();
  stroke(255);

}

float p = 0;

void draw()
{
  stroke(255);
  background(0);
  fill(255);
 // rect(550,0,width,height);
  

  /*
  if(recW == 1){
    
  rect(0,0,recX,height);  
    
  recX = recX+20;
  
  if(recX == 700){recX = 80;}
  
  }
  */
  


  while(p<7)
  {
    if(p%2 == 1)
    {
      fill(c1);

    }
    else {
      fill(c1,c2,c2);
    }

    stroke(255,100);
    
    ellipse(julz,a,h-15*p,h-15*p);
    p = p+1;
    
  }

  p=0;
  a = a+k; 
  if(a>550) {
    a=0;
  }
    
   if((a > 190)&&(a < 200)&&(x > 590)&&(x > 600))
  
{    
    c1 = c1-2;
    c2 = c2+2;   
    k = 0;
       
    if((c2>254)&&(c1<1))
    {
      c1 = 0;
      c2 = 255; 
      if(k == 0){a=height/2;}
      
    }  
}    
   
  // rect(595, 195, 10, 10);
   
   if(c2 == 255)
   {
     julz = julz-lup;   
   } 
   
   if(julz == 150)
     {
       lup = 0;
       julz = 601;
     }
      
    if(julz == 601)
    {
      k = 6;
      c1 = c1+4;
      c2 = c2-4;
      
      if((c2<1)&&(c1>254))
    {
      c1 = 255;
      c2 = 0;          
    }        
}  


   if(laine == 1){
   
     strokeWeight(2);
     
     //upper part of the arrows feathers
     stroke(c1,c2,c2);
     line(x-5,y-7,x2-45,y);
     stroke(c1);
     line(x,y-7,x2-40,y);
     stroke(c1,c2,c2);
     line(x+5,y-7,x2-35,y);
     
     //lower part of the arrows feathers
     stroke(c1,c2,c2);
     line(x-5,y+7,x2-45,y);
     stroke(c1);
     line(x,y+7,x2-40,y);
     stroke(c1,c2,c2);
     line(x+5,y+7,x2-35,y);
   
   }
  
   if(trian == 1){
  
  stroke(255);
  strokeWeight(2);
  triangle(x+50, y-5, x+50, y+5, x+65, y); 
  
    
    strokeWeight(1);
  
 }

  if(arrow == 1) {

    stroke(255);
    strokeWeight(2);    
    line(x,y,x2,y);
   
    x = x+3+speed;
    x2 = x2+3+speed;
    
    strokeWeight(1);
        
  }
  
  line(95,0,95,320);
  line(95,320,0,400);
  line(95,320,700,320);
  stroke(0);
  
} 

void mouseClicked() 
{ 
  recW = 1;
  laine = 1;
  trian = 1;
  arrow = 1;
    if(x > width+50){x=100;}
    if(x2 > width+50){x2=150;}
    
  j = j+1;
  
  speed = 3;
  
}

void mouseReleased()
{
    
  
  if((j > 19)&&(x > 710))
  {
    j = 0;    
  }  
 
  if(x>700)
  {
   x = x+1;
   x2 = x2+1;
  }

  
    
   if((x > 99)&&(x2 > 149))
   {    
     x = 100;
     x2 = 150;
   }
}  

void mouseDragged() 
{
  
 
 if(x>700){
  
  if (mouseX < width/2)
 {      
    x = x-1;
    x2 = x-1;
    
    speed = 30;
    
    if(x < 30)
    {      
      x = 30;
      x2 = 30;
    }
    
  }

}

}



