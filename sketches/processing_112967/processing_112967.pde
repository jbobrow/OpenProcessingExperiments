
float sc=500;
float s=500;
boolean dAppear= false;
float timer;
float rd= 0;
float x=0;
  float cy= 500;
  float cx = 500;
  float turn = 0;
  boolean ddAppear =false;
  float sca= 0;
float scaleSpeed=0.1;
   int v=500;
boolean triggerA= false;
float wgt=5;
boolean stop = false;
float ax=0;
float ay=0;

void setup()
{
  size(500,500);
  frameRate(20);
}

void draw()
{
  colorMode(HSB);
  fill(255,0,100);
  if (stop== false)
  {
  if(dAppear== false)
  {
    if (s<=0 || sc<=0)
    {
      dAppear = true;
    }
    else
    {
      s-=5;
      sc-=5;
    }
  }
  rectMode(CENTER);
  rect(width/2,height/2,s,sc);
  if (dAppear == true)
  {
    timer+=0.1;
    println(timer);
  rd= radians(x * 10);
     x += 3;
     float y = height/2 + cos(rd) * 20;
     fill(255,0,100);
      ellipse(y,x,30,30);
       ellipse(x,y,30,30);
  }
  if (timer >=20 && timer <=40)
  {
    
   noStroke();
   /*
  float zx =random(20,500);
  float zy= random(20,500);
  fill(255,0,100);
  ellipse(zx,zy,50,50);
  */
  rectMode(CORNER);
  fill(255,0,200);
  rect(0,0,ax,ay);
   ax+=3;
  ay+=3;
  }
  stroke(0);
  fill(255);
  if (timer >=40 && timer <=60)
  {
    //noStroke();
rectMode(CORNER);
  fill(255,0,200);
  rect(0,0,cx,cy);
   cx-=5;
  cy-=5;
 // println(cx);
  }
 
 if (timer >=60 && timer<= 87.5)
 {
   rectMode(CORNER);
sca+=scaleSpeed;
//stroke(0);
noStroke();
fill(255,0,255);
  pushMatrix();
translate(0, 0);
  rotate(turn);
  scale(sca);
  rect(0,0,20,20);
    popMatrix();
     turn += 0.1; 
 }
 if (timer>=90 && timer<=92)
 {
fill(255,0,255);

   rectMode(CENTER);
   rect(width/2,height/2,500,500);
 }
 else if (timer>=92)
 {
   fill(255,0,255);

   triggerA=true;
   rect(width/2,height/2,500,v);
   
 }
 if (triggerA==true)
 {
   if(wgt>=0.1)
   {
   wgt-=0.1;
   strokeWeight(wgt);
   v-=10;
   //println(wgt);
   }
   else
   {
   stop=true;
   }
 }
  }
}


