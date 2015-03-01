





  


float ydirection=0,ypos=350,reload=250,EMPtime=0,speed=5,t1=2000,t2=2200,t3=2400,t4=2600,t5=2800;
int rad=50,points=0,wave=1,hit=0,shots=0,rad2=25,LAZOR=250,LAZORtime=0,firerate=0,accuarcy=0,u1=249,u2=249,u1x,u2x,arrowx;
boolean hit1,hit2,hit3,hit4,hit5,h1,sniperI,sniperII,sniperIII,fastkillerI,fastkillerII,fastkillerIII,slowguy,antisniper,spell1,spell2,spell3,menuopen,l1,l2,l3,l4;
 
void setup()

{ 
  spell1=false;
  spell2=false;
  spell3=false;
  menuopen=false;
  
  l1=false;
  l2=false;
  l3=false;
  l4=false;

  println("controls:");
  println("shoot=mouseclick");
  println("upgrade cost : 1000 points click on the grey ellipses to upgrade them!!!");
  println("Get as many achievements as you can !!!");
  println("try to press 1,2 and 3");
  background(255);
  cursor(CROSS);
size(1000,700); 
sniperI=false;
  sniperII=false;
  sniperIII=false;
  fastkillerI=false;
  fastkillerII=false;
  fastkillerIII=false;
  slowguy=false;
  antisniper=false;
  hit1=false;
  hit2=false;
  hit3=false;
  hit4=false;
  hit5=false;
}

void draw()
{ 
 u1x=u1+1;
 u2x=u2+1;
  
  h1=true;
  
  if(h1==true)
  {
   background(255); 
  }
  

  
    fill(255,0,0);

  
  ellipse(t1,ypos,rad,rad);
  
    fill(255,0,0);
  
  ellipse(t2,ypos,rad,rad);
 
    fill(255,0,0);
  

  ellipse(t3,ypos,rad2,rad2);
  if(hit4==true)
  {
    fill(255,0,0);
  }
  
  ellipse(t4,ypos,rad,rad);
  if(hit5==true)
  {
    fill(255,0,0);
  }
  
  ellipse(t5,ypos,rad2,rad2);
  t1=t1-speed;
  t2=t2-speed;
  t3=t3-speed;
  t4=t4-speed;
  t5=t5-speed;
 textSize(25);
text("points="+points, 700,50,200, 80);
text("wave="+wave,100,50,200,80);
text("hits="+hit,300,50,200,80);
text("shots="+shots,450,50,200,80);




if(t1==-500)
{
  t1=2000;
}
if(t2==-500)
{
  t2=2200;
}
if(t3==-500)
{
  t3=2400;
}
if(t4==-500)
{
  t4=2600;
}
if(t5==-500)
{
  t5=2800;
  wave++;
}
  ydirection=random(-5,5);
  if(sniperII==true && fastkillerII==true)
  {
  ypos=ypos+ydirection;
  if(ypos<=50)
  {
    ypos=100;
  }
  if(ypos>=650)
  {
    ypos=600; 
  }
  }
   fill(255,0,0);
   quad(100,700,400,700,400,625,100,625);
   quad(500,700,800,700,800,625,500,625);
   
   fill(150);
   ellipse(150,662.5,50,25);
   ellipse(250,662.5,50,25);
   ellipse(350,662.5,50,25);
   ellipse(550,662.5,50,25);
   ellipse(650,662.5,50,25);
   ellipse(750,662.5,50,25);
   
  if(menuopen==false)
  {
  arrowx=10;
  fill(155);
  quad(0,250,50,325,50,375,0,450);
  fill(0,255,50);
  triangle(arrowx,325,arrowx,375,arrowx+35,350);
  }
  else 
  {
  arrowx=460;
  fill(155);
  quad(450,250,500,325,500,375,450,450);
  fill(0,255,50);
  triangle(arrowx+35,325,arrowx+35,375,arrowx,350);
  fill(255,50,50);
  rect(0,100,450,125);
  rect(0,225,450,125);
  rect(0,350,450,125);
  rect(0,475,450,125);
  textSize(50);
  fill(0,0,255);
  if(l1==false)
  {
  text("COST:600",112,132,400,100);
  }
  if(l2==false)
  {
  text("COST:1200",112,257,400,100);
  }
  if(l3==false)
  {
  text("COST:2000",112,372,400,100);
  }
  if(l4==false)
  {
  text("COST:1500",112,507,400,100);
  }
  }
  
  
   
   noStroke();
   fill(0,255,50);
   if(accuarcy>=1)
   {
     ellipse(550,662.5,55,30);
   }
    if(accuarcy>=2)
   {
     ellipse(650,662.5,55,30);
   }
    if(accuarcy>=3)
   {
     ellipse(750,662.5,55,30);
   }
    if(firerate>=1)
   {
     ellipse(150,662.5,55,30);
   }
    if(firerate>=2)
   {
     ellipse(250,662.5,55,30);
   }
    if(firerate>=3)
   {
     ellipse(350,662.5,55,30);
   }
   stroke(1);
   strokeWeight(1);
   
   
   noFill();
   noCursor();
   ellipse(mouseX,mouseY+3,reload/5*3+20,reload/5*3+23); 
   
  //achievements
  //
  //
  //
  //
  if(shots>=25 && sniperI==false && shots/2+1<hit)
  {
    println("achievement get: SniperI");
    sniperI=true;
  }
   
  if(shots>35 && sniperII==false && shots/2+shots/3<hit)
  {
    println("achievement get: SniperII");
    sniperII=true;
  }
  if(shots>50 && sniperIII==false && shots-5<hit)
  {
    println("achievement get: SniperIII");
    sniperIII=true;
  }
  if(wave>=3 && slowguy==false && shots==0)
  {
   println("achievement get: time is money and I am rich!");
   slowguy=true;
  }
  if(wave<=25 && fastkillerIII==false && hit>=70)
  {
   println("achievement get: Fast killer III");
   fastkillerIII=true;
  }
  if(wave<=15 && fastkillerII==false && hit>=40)
  {
   println("achievement get: Fast killer II");
   fastkillerII=true;
  }
  if(wave<=10 && fastkillerI==false && hit>20)
  {
   println("achievement get: Fast killer I");
   fastkillerI=true;
  }
 
 
       if(accuarcy==1)
  {
   noFill();
  
      ellipse(mouseX,mouseY,50,50);
  }
     if(accuarcy==2)
  {
    noFill();

   
    line(mouseX-150,mouseY,mouseX+150,mouseY);
   line(mouseX,mouseY-150,mouseX,mouseY+150);
  }
  
  
  if(accuarcy==3)
  {
     ellipse(mouseX,mouseY,25,25);
    line(mouseX-150,mouseY-150,mouseX+150,mouseY+150);
   line(mouseX+150,mouseY-150,mouseX-150,mouseY+150);
   noFill();
   cursor(CROSS);
   ellipse(mouseX,mouseY,reload/4*4,reload/4*4); 
   fill(0,255,0);

  
  }
  
  

 
  if(shots>=20 && antisniper==false && hit<=5)
  {
   antisniper=true;
   println("achievement get: antisniper");
  }
  
  if(reload>250)
  {
    reload--;
  }
  if(reload>250)
  {
    fill(255,255,0);
   text("reload...",400,350,200,80) ;
  }

   if(EMPtime==0)
   {
     speed=5;
   }
   if(EMPtime>0)
    {
     EMPtime--;
    speed=2.5; 
    } 
    
     fill(0,100,200);
      textSize(20);
    text("accuarcy",550,625,100,100);
    text("fire rate",140,625,100,100);
    if(u2x<1000)
    {
    text("cost: "+u2x,670,625,100,50);
    }
    if(u1x<1000)
    {
    text("cost: "+u1x,240,625,100,50);
    }
    
    if(hit>shots)
    {
     hit=shots; 
    }
    if(LAZORtime>0)
    {
     LAZORtime--;
     fill(255,40,20);
     rect(LAZOR,0,25,700); 
     if(t1==LAZOR || t2==LAZOR || t3==LAZOR || t4==LAZOR || t5==LAZOR )
    {
     
    points=points+20; 
    }
    }
    
if(hit<0)
{
hit=0;
}

if(shots<0)
{
shots=0;
}
   
    
}

  void mouseReleased()
  {
    
    
    
    
    
    if(menuopen==true && mouseX>460 && mouseX<460+35 && mouseY>325 && mouseY<375)
    {
     menuopen = false;
     println("cookie");
    }
     if(menuopen==false && mouseX>10 && mouseX<10+35 && mouseY>325 && mouseY<375)
    {
     menuopen = true;
    }

    if(reload==250 && mouseY>625 || mouseX<arrowx+35 && reload==250)
    {
  
    
    shots--;
    
    }
    
    if(hit==shots)
    {
    hit=shots;
    }
  
  if(mouseX>149 && mouseY>625 && mouseX<401 && points>u1 && firerate<3)
  {
   firerate++; 
   points=points-u1;
   u1+=300;
  }
   if(mouseX>499 && mouseY>625 && mouseX<801 && points>u2 && accuarcy<3)
  {
   accuarcy++; 
   points=points-u2;
   u2+=300;
  }
  
   if(mouseX>499 && mouseY>625 && mouseX<801 && points>u2 && accuarcy<3)
  {
   accuarcy++; 
   points=points-u2;
   u2+=300;
  }
  
    if(mouseY>132 && mouseY<232 && mouseX<512 && points>=600)
  {
   l1=true;
   points-=600;
  }
     if(mouseY>257 && mouseY<357 && mouseX<512 && points>=1200)
  {
   l2=true;
   points-=1200;
  }
     if(mouseY>372 && mouseY<472 && mouseX<512 && points>=2000)
  {
   l3=true;
   points-=2000;
  }
     if(mouseY>507 && mouseY<607 && mouseX<512 && points>=1500)
  {
   l4=true;
   points-=1500;
  }
  
   text("COST:600",112,132,400,100);
  text("COST:1200",112,257,400,100);
  text("COST:2000",112,372,400,100);
  text("COST:1500",112,507,400,100);
  
  
  
   if(reload==250)
 {  
   if(mouseX<t1+rad+1 && mouseX>t1-rad && mouseY<ypos+rad+1 && mouseY>ypos-rad-1)
   {
    points=points+25;
   hit++;
   
   
   }
    if(mouseX<t2+rad+1 && mouseX>t2-rad && mouseY<ypos+rad+1 && mouseY>ypos-rad-1)
   {
    points=points+25;
   hit++;
   
   } if(mouseX<t3+rad2+1 && mouseX>t3-rad2 && mouseY<ypos+rad2+1 && mouseY>ypos-rad2-1)
   {
    points=points+100;
  hit++;
  
   } if(mouseX<t4+rad+1 && mouseX>t4-rad && mouseY<ypos+rad+1 && mouseY>ypos-rad-1)
   {
    points=points+25;
   hit++;
   
   } if(mouseX<t5+rad2+1 && mouseX>t5-rad2 && mouseY<ypos+rad2+1 && mouseY>ypos-rad2-1)
   {
    points=points+100;
   hit++;
   }
   if(firerate==1 && reload==250)
   {
    reload=350;
   }
   if(firerate==2 && reload==250)
   {
    reload=315;
   }
   if(firerate==3 && reload==250)
   {
    reload=275;
   }
   if(firerate==0 && reload==250)
   {
    reload=375; 
   }
   shots++;
    fill(0);
  line(mouseX-10,mouseY-10,mouseX+10,mouseY+10);
  line(mouseX+10,mouseY-10,mouseX-10,mouseY+10);
 ellipse (mouseX,mouseY,5,5);     

 }       
   
  }
  void keyReleased()
  {
     
    if( key == '1' && spell1==false)
    { 
      if(points-800>=0)
      {
      println("spell 1 bought! using cost : 400! press 1 to use");
      points=points-800;
      spell1=true;
    }
    else
    {
     print("not enough points! cost: 800! points to earn:  "  ); 
     println( 800 - points);
    }
    
    }
    if( key == '2' && spell2==false)
    { 
      if(points-1200>=0)
      {
      println("spell 2 bought! using cost : 600! press 2 to use");
      points=points-1200;
      spell2=true;
    }
    else
    {
     print("not enough points! cost: 1200! points to earn:  "  ); 
     println( 1200 - points);
     
    }
    
    }
    
    if( key == '3' && spell3==false)
    { 
      if(points-2000>=0)
      {
      println("spell 3 bought! using cost : 1000! press 3 to use");
      points=points-2000;
      spell3=true;
    }
    else
    {
     print("not enough points! cost: 2000! points to earn:  "  ); 
     println( 2000 - points);
    }
    
    }
    
    
    
    if(points>=400 && key == '1' && spell1==true)
    { EMPtime=EMPtime+250;
      points=points-400;
    }
    if(points>=600 && key == '2' && spell2==true)
    { hit=hit+2;
      points=points-600;
    }
    if(points>=1000 && key == '3' && spell3==true)
    { LAZORtime=LAZORtime+2000;
      points=points-1000;
    }
    
  }
  

