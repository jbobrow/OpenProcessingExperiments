
size(640,480);
background(252,219,150);
for (int y =10; y <=470; y+=8)
{
  for (int x=10; x<=630; x+=8)
  {
    if ((x%10)==0)
    {
      line (x,y,x+3,y-3);
    }
    else
    {
      line(x,y,x+3,y+3);
    }
  }
}

smooth(); // tarhe vasat, meshkie zir
strokeWeight(19);
stroke(0);
strokeCap(ROUND);
line(320, 226, 253,160);
line(320,226, 386,160);
line(320,254,253,320);
line(320,254,386,320);
line(335,240,400,173);
line(335,240,400,307);
line(305,240,240,173);
line(305,240,240,306);

smooth(); //tarhe vasat, ghermez o sabz roosh
strokeWeight(3);
stroke(95,33,38);
strokeCap(ROUND);
line(320, 226, 253,160);
line(320,226, 386,160);
line(320,254,253,320);
line(320,254,386,320);
stroke(34,54,31);
line(335,240,400,173);
line(335,240,400,307);
line(305,240,240,173);
line(305,240,240,306);

smooth(); // tarhe vasat meskie zire zard
strokeWeight(19);
stroke(0);
strokeCap(ROUND);
line(360,240,400,240);
line(360,240,400,220);
line(360,240,400,260);
line(240,240,280,240);
line(240,220,280,240);
line(240,260,280,240);
line(320,160,320,200);
line(300,160,320,200);
line(340,160,320,200);
line(320,280,320,320);
line(320,280,300,320);
line(320,280,340,320);

smooth(); // tarhe vasat zard
strokeWeight(3);
stroke(232,210,7);
strokeCap(ROUND);
line(360,240,400,240);
line(360,240,400,220);
line(360,240,400,260);
line(240,240,280,240);
line(240,220,280,240);
line(240,260,280,240);
line(320,160,320,200);
line(300,160,320,200);
line(340,160,320,200);
line(320,280,320,320);
line(320,280,300,320);
line(320,280,340,320);

smooth(); // tarhe gooshe meshkie zir
strokeWeight(25);
stroke(0);
strokeCap(ROUND);
line(573,13,573,67);
line(553,13,573,67);
line(533,13,573,67);
line(573,67,626,67);
line(573,67,626,87);
line(573,67,626,107);
line(573,413,626,413);
line(573,413,626,393);
line(573,413,626,373);
line(573,413,573,466);
line(573,413,553,466);
line(573,413,533,466);
line(67,67,67,13);
line(67,67,87,13);
line(67,67,107,13);
line(67,67,13,67);
line(67,67,13,87);
line(67,67,13,107);
line(13,413,67,413);
line(13,393,67,413);
line(13,373,67,413);
line(67,413,67,467);
line(67,413,87,467);
line(67,413,107,467);
arc(26,26,26,26,0, PI/3);
arc(614,26,26,26,PI/2, PI-PI/6);
arc(614,454,26,26,PI,PI + PI/3);
arc(26,454,26,26,PI + PI/2, TWO_PI - PI/6);



smooth(); // tarhe gooshe banafsh
strokeWeight(4);
stroke(43,28,59);
strokeCap(ROUND);
line(573,13,573,67);
line(553,13,573,67);
line(533,13,573,67);
line(573,67,626,67);
line(573,67,626,87);
line(573,67,626,107);
line(573,413,626,413);
line(573,413,626,393);
line(573,413,626,373);
line(573,413,573,466);
line(573,413,553,466);
line(573,413,533,466);
line(67,67,67,13);
line(67,67,87,13);
line(67,67,107,13);
line(67,67,13,67);
line(67,67,13,87);
line(67,67,13,107);
line(13,413,67,413);
line(13,393,67,413);
line(13,373,67,413);
line(67,413,67,467);
line(67,413,87,467);
line(67,413,107,467);
fill(217,192,250);
arc(26,26,26,26,0, PI/3);
arc(614,26,26,26,PI/2, PI-PI/6);
arc(614,454,26,26,PI,PI + PI/3);
arc(26,454,26,26,PI + PI/2, TWO_PI - PI/6);

smooth(); // lozi 
strokeWeight(4);
fill(255);
stroke(77,57,14);
strokeCap(PROJECT);
quad(520,180,550,240,520,300,490,240);

fill(52,133,147);
beginShape();
vertex(540,180);
vertex(560,180);
vertex(590,240);
vertex(560,300);
vertex(540,300);
vertex(570,240);
vertex(540,180);
endShape();

beginShape();
vertex(480,180);
vertex(500,180);
vertex(470,240);
vertex(500,300);
vertex(480,300);
vertex(450,240);
vertex(480,180);
endShape();
ellipse(520,240,50,50);

fill(255);
quad(120,180,150,240,120,300,90,240);
fill(52,133,147);
beginShape();
vertex(80,180);
vertex(100,180);
vertex(70,240);
vertex(100,300);
vertex(80,300);
vertex(50,240);
vertex(80,180);
endShape();

beginShape();
vertex(140,180);
vertex(160,180);
vertex(190,240);
vertex(160,300);
vertex(140,300);
vertex(170,240);
vertex(140,180);
endShape(); 
ellipse(120,240,50,50);

fill(255);
quad(320,30,380,60,320,90,260,60);
fill(52,133,147);
beginShape();
vertex(260,20);
vertex(320,-10);
vertex(380,20);
vertex(380,40);
vertex(320,10);
vertex(260,40);
vertex(260,20);
endShape();

beginShape();
vertex(380,80);
vertex(380,100);
vertex(320,130);
vertex(260,100);
vertex(260,80);
vertex(320,110);
vertex(380,80);
endShape(); 
ellipse(320,60,50,50);

fill(255);
quad(320,390,380,420,320,450,260,420);
fill(52,133,147);
beginShape();
vertex(260,380);
vertex(320,350);
vertex(380,380);
vertex(380,400);
vertex(320,370);
vertex(260,400);
vertex(260,380);
endShape();

beginShape();
vertex(380,440);
vertex(380,460);
vertex(320,490);
vertex(260,460);
vertex(260,440);
vertex(320,470);
vertex(380,440);
endShape(); 
ellipse(320,420,50,50);

smooth(); // bote jeghe
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(-i);
  float end = begin + PI;
  arc(420,60,i,i, begin, end);
}

smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(i);
  float end=begin + PI;
  arc(220,60,i,i,begin,end);
}
  smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i<110; i+=8)
{
  float begin = radians(-i);
  float end = begin + PI;
  arc(420,420,i,i,begin,end);
} 

smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(i);
  float end= begin + PI;
  arc(220,420,i,i,begin, end);
} 

smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(i);
  float end= begin + PI;
  arc(530,110,i,i,begin, end);
} 

smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(-i);
  float end= begin + PI;
  arc(110,110,i,i,begin, end);
} 

smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(i);
  float end= begin + PI;
  arc(530,360,i,i,begin, end);
} 

smooth();
noFill();
randomSeed(0);
strokeWeight(4);
stroke(0,80);
for (int i=0; i< 110; i+=8)
{
  float begin = radians(-i);
  float end= begin + PI;
  arc(110,360,i,i,begin, end);
} 

