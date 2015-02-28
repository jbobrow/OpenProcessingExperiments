

int a = 0;
int h = 100;
int k = 3;

int julz = 600;
int ellop = 600;
int lup = 3;

int j = 0;
int gold = 3;

int x = 100;
int y = 200;

int x2 = 150;

int arrow = 0;
int trian = 0;
int laine = 0;

//mouseY
float pointer = mouseY;

//rectangle
int recX = 80;
int recW = 0;

int speed = 3;

//colours
int c1 = 255;
int c2 = 0;

//aim line
int aim1 = -15;
int aim2 = 20;


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
  line(95,0,95,330);
  line(95,330,0,400);
  line(95,330,700,330);  
  stroke(232,157,27);
  strokeWeight(2);
  line(95,constrain(aim1+mouseY,-15,295),95,constrain(aim2+mouseY,20,330));

  stroke(255);
  strokeWeight(1);
  fill(255);

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
  if(a > 277)
  {
    k = 0;
    a = 278;
    julz = julz+gold;
  }

  if(julz > 770)
  {
    julz = 600;
    gold = 0;
    k = 3;
    a = 0;
  } 
  gold = 3;

//constraints    
float cons1 = constrain(y-210+mouseY,4,324);
float cons2 = constrain(y-217+mouseY,0,316);
float cons3 = constrain(y-202+mouseY,9,334);

  if(dist(julz,a,x+65,constrain(y-210+mouseY,5,325)) < 15)
  {    
    println("BANG");
    
    c1 = c1-30;
    c2 = c2+30;   
    k = 0;

    if((c2>254)&&(c1<1))
    {
      c1 = 0;
      c2 = 255; 
      if(k == 0) {
        a=height/2;
      }
    }
  }    

  // rect(595, 195, 10, 10);

  if(c2 == 255)
  {
    julz = julz-lup;
    if(dist(julz,a,x,constrain(y-210+mouseY,5,325)) < 20)
    {
      julz = julz+40;
    }
  } 
  
//  if((julz < 598)&&(c2 == 255))
//  {

 // }
  
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
  }  
  if(a == 278)
  {
    c1 = c1+4;
    c2 = c2-4;
  }  
  if((c2<1)&&(c1>254))
  {
    c1 = 255;
    c2 = 0;
  }        
  if(c2 == 0)
  {
    lup = 3;
  }  
  if(julz == 150)
  {
    lup = 0;
    julz = 600;
  }

/* if(x > 150)
{
  cons1 = constrain(y,4,324);
  cons2 = constrain(y,0,316);
  cons3 = constrain(y,9,334);
}  
*/

  if(laine == 1) {
    
    strokeWeight(2);

    //upper part of the arrows feathers
    stroke(c1,c2,c2);
    line(x-5,cons2,x2-45,cons1);
    stroke(c1);
    line(x,cons2,x2-40,cons1);
    stroke(c1,c2,c2);
    line(x+5,cons2,x2-35,cons1);

    //lower part of the arrows feathers
    stroke(c1,c2,c2);
    line(x-5,cons3,x2-45,cons1);
    stroke(c1);
    line(x,cons3,x2-40,cons1);
    stroke(c1,c2,c2);
    line(x+5,cons3,x2-35,cons1);
  }

  if(trian == 1) {

    stroke(255);
    strokeWeight(2);
    triangle(x+50, constrain(y-215+mouseY,0,320), x+50, constrain(y-205+mouseY,10,330), x+65, constrain(y-210+mouseY,5,325)); 


    strokeWeight(1);
  }

  if(arrow == 1) {

    stroke(255);
    strokeWeight(2);    
    line(x,constrain(y-210+mouseY,5,325),x2,constrain(y-210+mouseY,5,325));

    x = x+3+speed;
    x2 = x2+3+speed;

    strokeWeight(1);
  }


  stroke(0);
} 

void mouseClicked() 
{ 
  recW = 1;
  laine = 1;
  trian = 1;
  arrow = 1;
  if(x > width+50) {
    x=100;
  }
  if(x2 > width+50) {
    x2=150;
  }

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
  if(x>700)
 {
    if (mouseX < width/2)
    {      
      x = x-1;
      x2 = x-1;

      speed = 30;
    }
  }
}


