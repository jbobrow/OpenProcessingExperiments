
// CYCLOPS v 1.1.2
// Programmed by Kevin De Keyser 1997-2012
// Dedicated to my best friend Lucas Schenck
// COPYRIGHT 2011-2012 (c) COPYRIGHT by Keyless

PFont hello;
PFont hellosmall;

 boolean wormbossdead;
int xRotate;
int fbX;
  int fbY;
  boolean stop=false;
boolean i=false;
boolean hitable=false;
  boolean upgo=true;
  boolean harpyx=true;
  boolean hitablew;
boolean harpyy=true;
boolean smarttears=false;
int hsX;
float hsY;
int count=0;
int l1=0;
int l2=3;
int l3=3;
int l4=3;
int l5=3;
int l6=3;
int l7=3;
int l8=3;
int l9=3;
int l10=0;
int oip=0;
boolean fail=false;
boolean sdf=false;
int x=80;
int pointes=0;
boolean why=true;
int pointes2=0;
int y=80;
boolean coatenabled=false;
float rand=random(0,10);
int xs=80;
boolean helix=false;
int coatdur=0;
boolean jobo=false;
boolean earsenabled=false;
int ys=500;
int ax=0;
boolean hell=false;
int ax2=0;
boolean touch2=false;
boolean afa=true;
int xtears;
int ytears;
boolean ellipsemake=false;
boolean ellipsemake2=false;
boolean ellipsemake3=false;
boolean ellipsemake4=false;
boolean ellipsemake5=false;
boolean ellipsemake6=false;
boolean ellipsemake7=false;
boolean ellipsemake8=false;
boolean ellipsemake9=false;
boolean ellipsemake10=false;


boolean tearT=false;
boolean bongo=false;
boolean bongo2=false;
boolean bongo3=false;
boolean bongo4=false;
boolean bongo5=false;
boolean bongo6=false;
boolean bongo7=false;
boolean bongo8=false;
boolean bongo9=false;
boolean bongo10=false;
float r1;
float r2;
float r3;
float r4;
float r5;
float r6;
float r7;
float r8;
float r9;
float r10;
float r11;
float r12;
int ca=255;
int cb=0;
boolean man=true;
int cc=0;
int gravity2 = 4;
int gravity = 4;
boolean mankind=false;
boolean touch =false;
String ghj="Move A    D";
cyclope cyclope1;
cyclopecon cyclope2;
plattform platt1;
plattform platt2;
plattform platt3;
plattform platt4;
plattform platt5;
plattform platt6;
plattform platt7;
plattform platt8;
plattform platt9;
plattform platt10;
plattform platt11;
plattform platt12;
plattform platt13;
plattform platt14;
plattform platt15;
plattform platt16;
plattform platt17;
plattform platt18;
plattform platt19;
plattform platt20;
plattform platt21;
plattform platt22;
plattform platt23;
plattform platt24;
plattform platt25;
spikeplatt sp1;
spikeplatt sp2;
spikeplatt sp3;
spikeplatt sp4;
spikeplatt sp5;
spikeplatt sp6;
spikeplatt sp7;
spikeplatt sp8;
spikeplatt sp9;
spikeplatt sp10;
spikeplatt sp11;
spikeplatt sp12;
spikeplatt sp13;
spikeplatt sp14;
spikeplatt sp15;
spikeplatt sp16;
jplattform jplatt1;
jplattform jplatt2;
jplattform jplatt3;
jplattform jplatt4;
jplattform jplatt5;
jplattform jplatt6;
jplattform jplatt7;
jplattform jplatt8;
textform text1;
textform text2;
textform text3;
textform text4;
tears tear1;
tears tear2;
tears tear3;
tears tear4;
tears tear5;
tears tear6;
tears tear7;
tears tear8;
tears tear9;
tears tear10;
item ears;
item coat;
item chilli;
harpy harpy1;
harpy harpy2;
wormboss boss1;
void reset()
{
hitable=false;
oip=0;
fail=false;
sdf=false;
x=80;
pointes=0;
why=true;
pointes2=0;
y=80;
coatenabled=false;
rand=random(0,10);
xs=80;
helix=false;
coatdur=0;
jobo=false;
earsenabled=false;
ys=500;
ax=0;
hell=false;
ax2=0;
touch2=false;
afa=true;

ellipsemake10=false;


tearT=false;
bongo10=false;

ca=255;
cb=0;
man=true;
cc=0;
gravity2 = 4;
gravity = 4;
mankind=false;
touch =false;
ghj="Move A    D";
}
void setup()
{
size(500,500);
smooth();
reset();
text1 = new textform(300,50,ghj,0);
text2 = new textform(900,320,"Wait...",0);

cyclope1 = new cyclope();
cyclope2 = new cyclopecon();
r1=(random(150,350));
platt1 = new plattform(170,200,2);
r2=(random(150,350));
platt2 = new plattform(300,r2,1);
r2=(random(150,350));
platt3 = new plattform(400,r2,1);
r4=(random(150,350));
platt4 = new plattform(1000,r4,3);
r5=(random(150,350));
platt5 = new plattform(1800,r5,2);
r6=(random(150,350));
platt6 = new plattform(900,r6,1);
r7=(random(150,350));
platt7 = new plattform(1400,r7,4);
r8=(random(150,350));
platt8 = new plattform(1200,r8,2);
r9=(random(150,350));
platt9 = new plattform(1800,r9,4);
r10=(random(150,350));
platt10 = new plattform(2000,r10,2);
r11=(random(150,350));
platt11 = new plattform(3000,r11,3);
r12=(random(250,350));
sp1= new spikeplatt(2300,r12,false,2);
r1=(random(150,350));
platt12 = new plattform(1300,r1,1);
r1=(random(150,350));
platt13 = new plattform(3300,r1,3);
r1=(random(250,350));
platt14 = new plattform(2800,r1,2);
r1=(random(50,150));
sp2 = new spikeplatt(2700,r1,true,2);
r1=(random(150,350));
platt15 = new plattform(3700,r1,3);
r1=(random(150,350));
platt16 = new plattform(1700,r1,1);
text3 = new textform(1600,r1+30,"Moving Plattforms..",0);
jplatt1 = new jplattform(1900,400,1);
r1=(random(150,350));
platt17 = new plattform(2100,r1,1);
jplatt2 = new jplattform(2300,200,1);
r1=(random(250,400));
platt18 = new plattform(6500,r1,2);
r1=(random(400,500));
sp3=new spikeplatt(5800,r1,false,3);
r1=(random(250,400));
platt19 = new plattform(2600,r1,1);
text4=new textform(2550,r1+30,"WTF?!? Enemies",0);
r1=(random(250,400));
platt20 = new plattform(2900,r1,1);
jplatt3=new jplattform(3200,300,1);
r1=(random(250,400));
platt21= new plattform(5900,r1,2);
sp4=new spikeplatt(3400,500,false,1);
r1=(random(250,400));
platt22=new plattform(3600,r1,1);
r1=(random(250,400));
platt23=new plattform(3800,r1,1);
jplatt4=new jplattform(4000,300,1);
jplatt5=new jplattform(4200,250,1);
sp5=new spikeplatt(4100,450,false,1);
sp6=new spikeplatt(4200,450,false,1);
sp7=new spikeplatt(4300,450,false,1);
sp8=new spikeplatt(4400,450,false,1);
sp9=new spikeplatt(4500,450,false,1);
sp10=new spikeplatt(4600,450,false,1);
sp11=new spikeplatt(4100,50,true,1);
sp12=new spikeplatt(4200,50,true,1);
sp13=new spikeplatt(4300,50,true,1);
sp14=new spikeplatt(4400,50,true,1);
sp15=new spikeplatt(4500,50,true,1);
sp16=new spikeplatt(4600,50,true,1);
jplatt6=new jplattform(4500,300,1);
jplatt7=new jplattform(5100,300,1);
jplatt8=new jplattform(5400,200,1);
r1=(random(250,400));
platt24=new plattform(4700,r1,1);
r1=(random(250,400));
platt25=new plattform(4900,r1,1);
harpy1=new harpy(300,200,false);
harpy2=new harpy(400,300,false);
boss1=new wormboss(450,200,false,50);






ears = new item(1,2,2000,r10-20);
coat = new item(2,2,2000,r10-20);
chilli=new item(3,2,2000,r10-20);
tear1 = new tears(i);
tear2 = new tears(i);
tear3 = new tears(i);
tear4 = new tears(i);
tear5 = new tears(i);
tear6 = new tears(i);
tear7 = new tears(i);
tear8 = new tears(i);
tear9 = new tears(i);







}
void draw()
{
  background(ca,cb,cc);

  rectMode(CENTER);
fill(0);
noStroke();
rect(50,450,50,100);
rect(100,470,50,70);
rect(200,450,50,100);
rect(250,440,70,130);
rect(300,480,30,40);
rect(450,470,70,100);
stroke(#5F040B);
fill(255,255,0);
rect(55,440,10,10);
rect(105,465,10,10);
rect(255,410,10,10);
rect(305,475,10,10);
rect(445,445,10,10);

stroke(0);
  if(cb<255){
  cb++;
  
man=true;
}
  else
  {man=false;
cb--;
}
 if (man==false)
  {man=false;
cc++;
cb--;
ca--;
if(cc==255)
man=true;
}
 if(mankind==false){ 
cyclope1.display();
cyclope1.movement();
if(sdf==false){
 if(mousePressed)
{cyclope2.display();
cyclope2.movement2();
sdf=true;

}


}}
if(sdf==true)
{
cyclope2.display();
cyclope2.movement2();
sdf=true;
}


platt1.display();
platt1.reaction();
platt2.display();
platt2.reaction();
platt3.display();
platt3.reaction();
platt4.display();
platt4.reaction();
platt5.display();
platt5.reaction();
platt6.display();
platt6.reaction();
platt7.display();
platt7.reaction();
platt8.display();
platt8.reaction();
platt9.display();
platt9.reaction();
platt10.display();
platt10.reaction();
platt11.display();
platt11.reaction();
platt12.display();
platt12.reaction();
platt13.display();
platt13.reaction();
platt14.display();
platt14.reaction();
platt15.display();
platt15.reaction();
platt16.display();
platt16.reaction();
platt17.display();
platt17.reaction();
platt18.display();
platt18.reaction();
platt19.display();
platt19.reaction();
platt20.display();
platt20.reaction();
platt21.display();
platt21.reaction();
platt22.display();
platt22.reaction();
platt23.display();
platt23.reaction();
platt24.display();
platt24.reaction();
platt25.display();
platt25.reaction();
sp1.display();
sp2.display();
sp3.display();
sp4.display();
sp5.display();
sp6.display();
sp7.display();
sp8.display();
sp9.display();
sp10.display();
sp11.display();
sp12.display();
sp13.display();
sp14.display();
sp15.display();
sp16.display();
jplatt1.display();
jplatt1.reaction();
jplatt2.display();
jplatt2.reaction();
jplatt3.display();
jplatt3.reaction();
jplatt4.display();
jplatt4.reaction();
jplatt5.display();
jplatt5.reaction();
jplatt6.display();
jplatt6.reaction();
jplatt7.display();
jplatt7.reaction();
jplatt8.display();
jplatt8.reaction();

text1.display();
text2.display();
text3.display();
text4.display();
if(count>5000)
{
stop=true;
hitablew=true;
boss1.display();

}
textFont(hello);

if(count>2300)
{
harpy1.display();
harpy1.reaction();
harpy2.display();
harpy2.reaction();
hitable=true;
}
if(wormbossdead==true)
{y=600;
GameOver();
}
if(fail==true)
{
GameOver();
}
if(ellipsemake10==true||key==' ')
{
  if(keyPressed)
  {
  if(key=='a')
  {
  i=true;
  }
  }
  tear10 = new tears(i);
tear10.tearshoot();}

if(rand<3.3333)
{
ears.ears();}
if(rand>3.3333&&rand<6.66666)
{
coat.transparentcoat();}
if(rand>6.66666)
{
chilli.redtears();
}

if(sdf==false)
{
if(y>600)
{
GameOver();
}
}
if(sdf==true)
{
if(y>600)
{
if(ys<0)
{

jobo=true;

}
}
if(jobo==true)
{background(0);
mankind=true;
text("Game Over",200,100);
hell=true;
x=150;
y=150;
cyclope1.display();
xs=150;
ys=250;
cyclope2.display();
text("  =  "+pointes,x+50,y);
text("  =  "+pointes2,xs+50,ys);}
}
count++;
}








class cyclope
{
  void display(){
    
  if(coatenabled==false)
  {
stroke(0);
fill(#FCFFCE);
ellipseMode(CENTER);
ellipse(x,y,30,28);
fill(#4BDCFF);
if(smarttears==true)
{
fill(255,0,0);
point(x,y-5);
}ellipse(x,y-5,7,5);
beginShape ();
stroke(#F07272);
fill(255,0,0);
curveVertex(x-10,y+5);
curveVertex(x-10,y+5);
curveVertex(x-5,y+7);
curveVertex(x,y+10);
curveVertex(x+3,y+13);
curveVertex(x+10,y+5);
curveVertex(x+10,y+5);
if(keyPressed)
    {
    if(key=='a')
    {
   
  
fill(#FCFFCE);
stroke(0);
ellipseMode(CENTER);
ellipse(x,y,28,30);
fill(#4BDCFF);
if(smarttears==true)
{
fill(255,0,0);
point(x-9,y-5);
}
ellipse(x-9,y-5,5,7);
beginShape();
stroke(#F07272);
fill(255,0,0);
curveVertex(x-10,y+5);
curveVertex(x-10,y+5);
curveVertex(x-5,y+10);
curveVertex(x-2,y+1);
curveVertex(x-5,y+10);

endShape(CLOSE);
}
if(key=='d')
{
fill(#FCFFCE);
stroke(0);
ellipseMode(CENTER);
ellipse(x,y,28,30);
fill(#4BDCFF);
if(smarttears==true)
{
fill(255,0,0);
point(x+9,y-5);
}
ellipse(x+9,y-5,5,7);
beginShape();
stroke(#F07272);
fill(255,0,0);
curveVertex(x+10,y+5);
curveVertex(x+10,y+5);
curveVertex(x+5,y+10);
curveVertex(x+2,y+1);
curveVertex(x+5,y+10);

endShape(CLOSE);
}
    
    
    }


endShape(CLOSE);
  }}
  void movement()
  {
    if(hell==false)
    {
    if(touch==true)
  {
    if(ax<6)
    {
    y=y-8;
    }
    else if(ax>2&&ax<10)
    {
    y=y-7;
    }
    else if(ax>4&&ax<14)
    {
    y=y-6;
    }
    else if(ax>6&&ax<20)
    {
    y=y-5;
    }
  
  else if(ax==20)
  {
    y=y-4;
 
  }
  else if(ax>20&&ax<26)
  {y=y-2;}
  else if(ax==26)
  {
   touch=false;
   ax=0;
  }
  if(ax<26)
  {
  ax++;
  }}
  else{
  y=y+gravity;}
  if(keyPressed)
  {

    
  if(key=='a')
  {
  
  x=x-3;
  }
  
if(key=='d')
  {
  x=x+3;

  }
}
if(mouseX<xs)
{
xs=xs-3;
}
else if(mouseX>xs)
{
xs=xs+3;
}
}}
}




class cyclopecon
{
  void display(){
    if(x<xs+20&&x>xs-20&&y<ys+20&&y>ys-20)
    {
    touch=true;
    touch2=true;
    }
  stroke(0);
fill(#4BDCFF);
ellipseMode(CENTER);
ellipse(xs,ys,30,28);
fill(#FAFF08);
ellipse(xs,ys+5,7,5);
beginShape ();
stroke(#F07272);
fill(255,0,0);
curveVertex(xs-10,ys-5);
curveVertex(xs-10,ys-5);
curveVertex(xs-5,ys-7);
curveVertex(xs,ys-10);
curveVertex(xs+3,ys-13);
curveVertex(xs+10,ys-5);
curveVertex(xs+10,ys-5);
endShape(CLOSE);
if (mouseX>xs+10)
 
  {stroke(0);

fill(#4BDCFF);
ellipseMode(CENTER);
ellipse(xs,ys,28,30);
fill(#FAFF08);
ellipse(xs+9,ys+5,5,7);
beginShape();
stroke(#F07272);
fill(255,0,0);
curveVertex(xs+10,ys-5);
curveVertex(xs+10,ys-5);
curveVertex(xs+5,ys-10);
curveVertex(xs+2,ys-1);
curveVertex(xs+5,ys-10);

endShape(CLOSE);
}
if(mouseX<xs-10)
{
  
fill(#4BDCFF);
stroke(0);
ellipseMode(CENTER);
ellipse(xs,ys,28,30);
fill(#FAFF08);
ellipse(xs-9,ys+5,5,7);
beginShape();
stroke(#F07272);
fill(255,0,0);
curveVertex(xs-10,ys-5);
curveVertex(xs-10,ys-5);
curveVertex(xs-5,ys-10);
curveVertex(xs-2,ys-1);
curveVertex(xs-5,ys-10);

endShape(CLOSE);
}


  }
  



  void movement2()
{if(hell==false)
{
    if(touch2==true)
  {
    if(ax2<6)
    {
    ys=ys+12;
    }
    else if(ax2>2&&ax2<10)
    {
    ys=ys+10;
    }
    else if(ax2>4&&ax2<14)
    {
    ys=ys+8;
    }
    else if(ax2>6&&ax2<20)
    {
    ys=ys+7;
    }
  
  else if(ax2==20)
  {
    ys=ys+6;
 
  }
  else if(ax2>20&&ax2<26)
  {ys=ys+4;}
  else if(ax2==26)
  {
   touch2=false;
   ax2=0;
  }
  if(ax2<26)
  {
  ax2++;
  }}

  ys=ys-gravity2;
  
  
  }}}
void GameOver()
{
background(0);
fill(255);
if(wormbossdead==true)
{
text("WIN",150,200);
}
else{
text("Game Over",100,200);}
text("Points: "+pointes,200,350);
text("Klick for Multitask",100,450);
if(mousePressed)
{
setup();
}
}


void keyReleased()
{
  if(key==' ')
  {
l2=3;
l3=3;
l4=3;
l5=3;
l6=3;
l7=3;
l8=3;
l9=3;
  if(ellipsemake==false)
{
xtears=x;
ytears=y;
}
if(oip==0)
{
if(key==' '&&l10==0)
{
ellipsemake10=true;
ellipsemake9=false;
bongo9=false;
l10=0;


}
else if(key==' '&&l9==1)
{
ellipsemake9=true;
ellipsemake8=false;
bongo8=false;


l9=0;
}
else if(key==' '&&l8==1)
{
ellipsemake8=true;
ellipsemake7=false;
bongo7=false;


l9=1;
l8=0;
}
else if(key==' '&&l7==1)
{
ellipsemake7=true;
ellipsemake6=false;
bongo6=false;


l8=1;
l7=0;
}
else if(key==' '&&l6==1)
{
ellipsemake6=true;
ellipsemake5=false;
bongo5=false;


l7=1;
l6=0;
}
else if(key==' '&&l5==1)
{
ellipsemake5=true;
ellipsemake4=false;
bongo4=false;


l6=1;
l5=0;
}
else if(key==' '&&l4==1)
{
ellipsemake4=true;
ellipsemake3=false;
bongo3=false;


l5=1;
l4=0;
}
else if(key==' '&&l3==1)
{
ellipsemake3=true;
ellipsemake2=false;
bongo2=false;

l4=1;
l3=0;
}
else if(key==' '&&l2==1)
{
ellipsemake2=true;


ellipsemake=false;
bongo=false;
l3=1;
l2=0;
}
else if(key==' '&&l1==1)
{
ellipsemake=true;

l10=1;
l1=0;


}}
oip++;
if(oip<10)
{
oip=0;
}
}}


