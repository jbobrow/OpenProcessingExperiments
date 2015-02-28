
//Homework6
//Copyright by Joel McCullough Pittsburgh PA 15221
int x=200;
int y = 200;
int wd = 300;
int ht = 300;
int s = 8;
//int s2 = 20;

void setup()
{
  size(400,400);
  smooth();
  background(0);
  
}

void draw()
{
 wallpaper(); 
}

void initials()
{
  noFill();
  beginShape();
    //j
      stroke(218,255,83);
      curveVertex(x-wd/5,y+ht/10);//1
      curveVertex(x-wd/2,y+ht/10);//1
      curveVertex(x-wd/7,y-ht/2);//4
      curveVertex(x-wd/6,y+ht/4);//5
      curveVertex(x-wd/2.2,y+ht/4);//3
      curveVertex(x+wd/10,y-ht/10);//2
      curveVertex(x+wd/10,y-ht/10);//2
     
  endShape();  
  
  beginShape();
     //d
     stroke(171,72,178);
     curveVertex(x,y-ht/2);
     curveVertex(x,y-ht/2);
     curveVertex(x,y);
     curveVertex(x+wd/4,y-ht/4);
     curveVertex(x,y-ht/2);
     curveVertex(x,y-ht/2);
  endShape();


  beginShape();
      //m
    stroke(109,255,222);
      curveVertex(x+wd/2.8,y+ht/3);//2
      curveVertex(x+wd/2.8,y+ht/3);//2
      curveVertex(x+wd/2.5,y-ht/3);//1
     curveVertex(x+wd/4,y-ht/8);//5
     curveVertex(x+wd/10,y-ht/2);//4
     curveVertex(x+wd/10,y+ht/2);//3
     curveVertex(x+wd/10,y+ht/2);//3
  endShape();
  

}

void strand()
{
    while(y<400)
    {
      initials();
      y=y+10;
      wd=wd-100;
      ht=ht-10;
      x=y;
      strokeWeight(s-s*.5);
    }
}

  
void wallpaper()
{
//  bg();
//  emblem();
    strand();
  
    
      
}
//void emblem()
//{
//
//  while(y<250)
//  {
//  stroke(178,64,49);
//  strokeWeight(s2);
//  initials();
//  y=y+5;
//  }
//}
//void bg()
//{
//  
//  strokeWeight(15);
//  initials();
//}
  
