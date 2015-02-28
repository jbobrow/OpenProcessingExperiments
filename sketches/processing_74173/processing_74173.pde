
void setup()
{

 noLoop(); 
 background(0);
 size(450,800);
 smooth(); 
}

void draw()
{
background(0);
pushMatrix();
strokeWeight(2);
stroke(0,30);
fill(255,random(5,10));
//white fill bez
  for(int j = 0;j <30;j++)
  {
  pushMatrix();
  translate(random(450,400),random(1,800+j*9));
  rotate(random(PI,PI*9));

 for(int i =0; i < 10; i++)
{
 strokeWeight(random(.1,1));
 stroke(255,random(30+i*3,50+i*5));
 float x1 = -100;
 float x2 = 100;
 float cx1 = -50;
 float cy1 = -100;
 float cx2 = 50;
 float cy2 = -100;
 bezier(x1+random(-20,20),20,  cx1+random(-60,60+i*5),cy1+random(-20,1),   cx2+random(-60,60+i*5),cy2+random(-60,1),    x2,20); 
} 

popMatrix();
  }  
  
  
  
  for(int s=0; s < 6; s++)
{
 pushMatrix();
 translate(random(10,30), random(0,3));
 stroke(random(200,220+s*3),random(150,200+s*3),random(30,180+s*3),90);
 strokeWeight(random(1,2));  
 //Horizontal straight
 line(random(200,300+s*20), random(350,360+s*1.5), random(30,40+s*20),random(350,360+s*1.5));
 
 pushMatrix();
 line(random(100,200+s*20), random(250,260+s*1.5), random(20,30+s*10),random(250,260+s*1.5));
 translate(100,90);
 popMatrix();
 

// vertical straight

line(random(50,55+s*2), random(350,400),random(50,56+s*2),random(5,20+s*5));
line(random(50,55+s*2), random(350,400),random(50,56+s*2),random(5,20+s*5));
line(random(100,110+s*2), random(400,450),random(100,110+s*2),random(10,30+s*5));
line(random(340,350+s*3),random(200,220),random(200,210+s*3),random(10,15));
line(random(400,430),random(20,30),random(320,340),random(200,220));
 popMatrix();
 pushMatrix();
 translate(-150,-30);
  stroke(0,99);
 line(random(340,350+s*3),random(200,220),random(200,210+s*3),random(10,15));
 line(random(400,430),random(20,30),random(320,340),random(200,220));
 strokeWeight(2);
 stroke(0,99);
 popMatrix();
 line(random(200,210),random(200,210),random(10,15),random(350,340));
}

//funky orange lines
for(int q=0; q < 40; q++)
{
pushMatrix();  
translate(random(-200,200), random(300,450));
//stroke(random(120,150+q*3),random(110,120+q*3),random(130,180+q*3),90);
stroke(random(200+q*4,270),131,113); 
strokeWeight(random(.1,1));
line(random(100,300+q*2), random(100,150),random(100,300+q*2),random(30,70+q*5));
popMatrix();
}

for(int y=0; y < 40; y++)
{
pushMatrix();  
translate(random(-200,400), random(-100,350));
 
 strokeWeight(random(1,2)); 
stroke(244,56,89,random(80,90));
line(random(100,300+y*2), random(100,150),random(100,300+y*2),random(300,400+y*5));
popMatrix();
noStroke();
}  
//brown fill bez
  for(int r =0; r < 10; r++)
{
 pushMatrix();
 translate(width/2+random(-50,50+r*4),random(0,550+r*30));
 rotate(random(PI,PI*9));
 strokeWeight(random(.1,2));
 stroke(255,random(40,90));
 float zx1 = -90;
 float zx2 = 90;
 float zcx1 = -40;
 float zcy1 = -50;
 float zcx2 = 40;
 float zcy2 = -50;
 for(int t = 0;t <10;t++)
bezier(zx1,10,  zcx1+random(-10,10),zcy1+random(-10,10), zcx2+random(-10,10),zcy2+random(-10,10), zx2,0);
fill(random(100,204), random(50,102), 0,random(10,25)); 
 popMatrix();
}

noFill();

//beznofill
for(int a =0; a < 10; a++)
{
 pushMatrix();
 translate(random(0,20+a*4),random(400,500+a*3));
 rotate(random(PI,PI*9));
 strokeWeight(random(.1,2));
 stroke(255,random(40,90));
 float ax1 = -90;
 float ax2 = 90;
 float acx1 = -40;
 float acy1 = -50;
 float acx2 = 40;
 float acy2 = -50;
 for(int t = 0;t <10;t++)
bezier(ax1,10,  acx1+random(-10,10),acy1+random(-10,10), acx2+random(-10,10),acy2+random(-10,10), ax2,0);
noFill();
 popMatrix();
}

//brown littlefill bez
   for(int i =0; i < 10; i++)
{
  pushMatrix();
translate(width/2+random(-50,50),random(100,800));

 fill(random(100,204), random(50,102), 0,random(30,45));
 strokeWeight(random(1,2));
 stroke(255,90);
 float x1 = -50;
 float x2 = 50;
 float cx1 = -50;
 float cy1 = -50;
 float cx2 = 50;
 float cy2 = -60;
 bezier(x1,10,  cx1+random(-10,10),cy1+random(-10,10),   
 cx2+random(-10,10),cy2+random(-10,10),    x2,0); 
popMatrix();

}
  
for(int i = 0;i < 6; i++)
{
strokeWeight(random(1,2));
/*
float x1 = 30;
float y1 = 40;
float x2 = 20;
float y2 = 100;
float x3 = 150;
float x4 = 200;
float y3 = 300;

line(random(x1,y1), random(x2,y2), random(x3,x4), random(x4,y3));
*/

line(random(30,40),random(20,100), random(150,200),random(200,300)); 
line(random(430,440),random(0,50), random(150,200),random(200,300));
stroke(0,99);
}
for(int i = 0;i < 3; i++)
{
line(random(100,350),350+random(i,i*5), random(10,40),350+random(i,i*5));
}
for(int i = 0;i < 8; i++)
{
line(350+random(i,i*5), random(300,550), 350+random(i,i*5), random(600,700));
}
strokeWeight(random(1,2));
stroke(0,99);

for(int i = 0;i < 3; i++)
{
  stroke(0,30);
  line(random(300,350),350+random(i,i*5), random(10,40),350+random(i,i*5));
}


}



/*translate(width/2,height/2);


bezier(90, 10, 20, 90, 0, 10, 0, 0);
line(30, 20, 80, 5);
line(80, 75, 30, 75);
stroke(0, 0, 0);
bezier(30, 20,  80, 5,  80, 75,  30, 75);
popMatrix();
*/
