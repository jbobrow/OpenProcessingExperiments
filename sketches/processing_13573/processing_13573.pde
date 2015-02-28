
int s, m, h;
int lastsecond = 0;
void setup()
{size(400,400);
stroke(255,0,0,100);
smooth();
background(255);
}
void draw()
{
  s = second();
  m= minute();
  h= hour ()%12;
  
  
  float mappedH = map (h,0,12,0,255);
  float mappedM = map (m,0,60,0,255);
  float mappedS = map (s,0,60,0,255);

  fill(mappedH,0,0);
  ellipse(width/12,100,width/12, height/12);
   ellipse(width*2/12,120,width/12, height/12);
    ellipse(width*3/12,120,width/12, height/12);
     ellipse(width*4/12,120,width/12, height/12);
      ellipse(width*5/12,120,width/12, height/12);
       ellipse(width*6/12,120,width/12, height/12);
        ellipse(width*7/12,120,width/12, height/12);
         ellipse(width*8/12,120,width/12, height/12);
          ellipse(width*9/12,120,width/12, height/12);
           ellipse(width*10/12,120,width/12, height/12);
            ellipse(width*11/12,120,width/12, height/12);
             ellipse(width*12/12,140,width/12, height/12);
//  pushMatrix(); 
// translate (mappedH*width/12,0);
// fill(255);
// rect (10,10,width/12,height/12);
//  popMatrix();
//  background(255);
   translate(mappedM*6/10,0);
   fill(0,mappedM,0,200);
for (int i = 0; i<20; i++)
{   
 scale(1.01,1.01);
  rect(0,0,width/8, height);
  
}
  fill (mappedS,mouseY,0,200);
  translate(mappedS*6/40,0);
for (int i = 0; i<20; i++)
{  scale(.5,1.04);
  rect(0,0,mappedS, height);
}

}

