

int a = 0;
int h = 100;
int k = 3;

int j = 0;

int x = 100;
int y = 200;

int x2 = 150;

int arrow = 0;
int trian = 0;
int laine = 0;

int speed = 3;

//colours
int c1 = 255;
int c2 = 0;

void setup()
{
  size(700,400);
  background(0);
  smooth();
  stroke(0);
}

int p = 0;

void draw()
{
  noStroke();
  fill(0);
  rect(0,0,width,height);

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

    ellipse(600,a,h-15*p,h-15*p);
    p = p+1;
  }

  p=0;
  a = a+k; 
  if(a>550) {
    a=0;
  }
  
   if((a > 220)&&(a < 280)&&(x > 500)&&(x > 600))
  
{    
    c1 = c1-20;
    c2 = c2+40;
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
  
  stroke(0);
} 

void mousePressed() 
{

  laine = 1;
  trian = 1;
  arrow = 1;
    if(x > width+50){x=100;}
    if(x2 > width+50){x2=150;}
    
  j = j+1;
  
}

void mouseReleased()
{
  speed = speed+3;
  
  if((j > 19)&&(x > 710)){
  
    j = 0;
    speed = 3;
    
  }  
}  



