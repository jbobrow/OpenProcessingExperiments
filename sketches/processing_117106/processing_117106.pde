
int rfl=2500,h=1,f1=110,f2=120,f3=130,f4=140,f5=150,f6=160,fd=200,fire=1;
boolean p1,p2,p3,p4,p5,p6;
int posX=50,posY=100;

void setup()
{
 p1=true;
 p2=true;
 p3=true;
 p4=true;
 p5=true;
 p6=true;
 noCursor();
 background(0,255,0);
 size(1000,600);
 
 
}

void draw()
{
 if(h==1)
 {
  background(255); 
 }
 
 

fill(0,255,0);
rect(825,425,50,75);
stroke(5);
 strokeWeight(5);
 
 fill(0,50,255);
 fill(50,150,50);
 rect(750,100,250,415);



if(f1>0 || f2>0 || f3>0 || f4>0 || f5>0 || f6>0)
 {
   fill(50,0,255);
   quad(270,300,300,300,290,275,280,275);
 quad(555,300,585,300,575,275,565,275);
 line(350,300,mouseX,mouseY);
 line(375,300,mouseX+25,mouseY); 
 quad(350,300,375,300,mouseX+25,mouseY,mouseX,mouseY);
 fill(255,0,0);
 rect(mouseX,mouseY,75,50);
 fill(100);
 rect(mouseX+60,mouseY-10,30,15);
 fill(0,0,255);
 rect(mouseX,mouseY,60,10);
 fill(255,0,0);
 rect(200,300,400,175); 
 fill(100);
 ellipse(275,475,75,75);
 ellipse(525,475,75,75);
 fill(155);
 ellipse(275,475,35,35);
 ellipse(525,475,35,35);
 fill(0,100,255);
 noStroke();
 rect(475,325,75,100);
 triangle(550,325,550,425,585,425);
 fill(0);
 }
 
fill(50,50,155);
rect(775,125,50,75);
rect(875,125,50,75);
rect(775,225,50,75);
rect(875,225,50,75);
rect(775,325,50,75);
rect(875,325,50,75);
 
   fill(0);
 rect(posX+50,posY-10,10,50);
 rect(posX-20,posY-15,140,5);
 rect(posX-10,posY+50,120,7);
 fill(255,0,0);
 rect(posX,posY,100,50);
 fill(0,50,255);
 rect(posX+25,posY+10,25,35); 
 if(p1==true)
{
 fill(0,255,0);
 ellipse(800,150,25,25); 
}  
if(p2==true)
{
 fill(0,255,0);
 ellipse(900,150,25,25); 
}  
if(p3==true)
{
 fill(0,255,0);
 ellipse(800,250,25,25); 
}  
if(p4==true)
{
 fill(0,255,0);
 ellipse(900,250,25,25); 
}  
if(p5==true)
{
 fill(0,255,0);
 ellipse(800,350,25,25); 
}  
if(p6==true)
{
 fill(0,255,0);
 ellipse(900,350,25,25); 
}  

if(posX+25>775 && posX+25<825 && posY+10>125 && posY+10<200 && f1<1)
{
 p1=false;
}
if(posX+25>875 && posX+25<925 && posY+10>125 && posY+10<200 && f2<1)
{
 p2=false;
}
if(posX+25>775 && posX+25<825 && posY+10>225 && posY+10<300 && f3<1)
{
 p3=false;
}
if(posX+25>875 && posX+25<925 && posY+10>225 && posY+10<300 && f4<1)
{
 p4=false;
}
if(posX+25>775 && posX+25<825 && posY+10>325 && posY+10<400 && f5<1)
{
 p5=false;
}
if(posX+25>875 && posX+25<925 && posY+10>325 && posY+10<400 && f6<1)
{
 p6=false;
}


fill(0,0,255);
if(f1>0)
{
fill(255,0,0);
rect(775,125,50,75);
}
if(f2>0)
{
  fill(255,0,0);
rect(875,125,50,75);
}
if(f3>0)
{
  fill(255,0,0);
rect(775,225,50,75);
}
if(f4>0)
{
  fill(255,0,0);
rect(875,225,50,75);
}
if(f5>0)
{
  fill(255,0,0);
rect(775,325,50,75);
}
if(f6>0)
{
  fill(255,0,0);
rect(875,325,50,75);
}
if(fd>0)
{
  
fill(0,255,255);
rect(825,425,50,75); 
}


fill(50);
rect(0,515,1000,500);

if(f1<1 && f2<1 && f3<1 && f4<1 && f5<1 && f6<1)
 {
   fill(0,50,255);
   rect(0,515,747,500);
   line(mouseX,mouseY-25,mouseX,mouseY+25);
   line(mouseX-25,mouseY,mouseX+25,mouseY);
   fill(255,0,0);
   strokeWeight(1);
   quad(200,400,300,515,600,515,700,400);
   fill(50);
   rect(300,380,10,20);
   fill(0,100,255);
 noStroke();
 rect(475,300,75,100);
 triangle(550,300,550,400,585,400);
 if(rfl>0)
{
  fill(255,0,0);
  rect(750,100,400,rfl/100);
}


  if(mousePressed==true)
  {
   fill(0,25,255);
   quad(300,380,310,380,mouseX+5,mouseY,mouseX,mouseY);
  }
  if(mousePressed==true && mouseX>749 && mouseX<1001 && mouseY>99 && mouseY<126)
  {
    rfl--;
  }
}
 
if(f1>0 || f2>0 || f3>0 || f4>0 || f5>0 || f6>0)
 {
 if(mousePressed==true)
  {
   fire=0 ;
  }
  
  else
  {
    fire=1;
}
if(fire==0)
  {
  fill(0,0,255);
  rect(mouseX+92,mouseY-10,150,5);
  }
  
 }

  


  
  if(mousePressed==true)
  {
   if(mouseX> 675-150 && mouseX<725-150 && mouseY>125 && mouseY<200)
   {
    f1--; 
   }
   if(mouseX> 775-150 && mouseX<825-150 && mouseY>125 && mouseY<200)
   {
    f2--; 
   }
   if(mouseX> 675-150 && mouseX<725-150 && mouseY>225 && mouseY<300)
   {
    f3--; 
   }
   if(mouseX> 775-150 && mouseX<825-150 && mouseY>225 && mouseY<300)
   {
    f4--; 
   }
   if(mouseX> 675-150 && mouseX<725-150 && mouseY>325 && mouseY<400)
   {
    f5--; 
   }
   if(mouseX> 775-150 && mouseX<825-150 && mouseY>325 && mouseY<400)
   {
    f6--; 
   }
  }
  if(keyPressed==true)
  {
   if(key=='w')
 {
  posY=posY-3;
 } 
 if(key=='s')
 {
  posY=posY+3;
 } 
 if(key=='d')
 {
  posX=posX+3;
 } 
 if(key=='a')
 {
  posX=posX-3;
 } 
}
}
