
size(800,1200);




int x1 = 400, y1 = 300, x2 = 400, y2 = 400,x3=420,y3=380;

fill(254,123,34);
triangle(x1,y1,x2,y2,x3,y3);//nose
triangle(x1,y1,x2,y2-70,x3,y3);
triangle(x1,y1,x2,y2-70,x3-30,y3-30);

triangle(400,550,400,500,420,540);//uper month
triangle(430,500,400,550,420,540);
triangle(430,500,430,540,420,540);
triangle(430,500,460,560,420,540);
triangle(430,500,460,560,470,540);
triangle(400,550,400,500,370,560);


int A = 350, B = 600;//lower month
for(int x = 0; x < 5; x++)
{
 A += 10; B +=3;
  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  rect(A,B,20,20);
}
for(int x = 0; x < 5; x++)
{
 A += 10; B -=3;

  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  rect(A,B,20,20);
}

int C = 200 , D = 150;//uper left face line

for(int x = 0; x < 40; x++)
{
 C -= 1; D += 10;
  
int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  
  

  rect(C,D,20,20);
}
int pt1 = 160, pt2 = 550, pt3 = 180, pt4 = 580,pt5 = 180, pt6 = 600, pt7 = 170, pt8 = 590; //lower face line
for(int x = 0; x < 20; x++)
{
  
  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  pt1 +=5; pt2 += 10; pt3 +=5; pt4 += 5; pt5 += 10; pt6+=4; pt7 += 5; pt8 += 7;
  quad(pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8);

}
pushMatrix();
translate(100,100);
pt1 = 160; pt2 = 600; pt3 = 180; pt4 = 620; pt5 = 180; pt6 = 610; pt7 = 170; pt8 = 630;
for(int x = 0; x < 40; x++)
{
  
  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  pt1 +=5; ; pt3 +=5;; pt5 += 10; ; pt7 += 5; ;
  quad(pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8);

}
popMatrix();


int N = 700 , M = 150;//uper right face line
for(int x = 0; x < 40; x++)
{
  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  N -= 1; M += 10;
  rect(N,M,20,20);
}

int pta =670, ptb = 560, ptc = 780, ptd = 620, pte = 680, ptf = 610, ptg = 670, pth = 630;//right lower 

  for(int x = 0; x < 20; x++)
{
  
  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  pta -= 2; ptb +=2; ptc -=2; ptd += 3; pte -= 6; ptf += 5; ptg -= 2; pth += 4;
  quad(pta, ptb, ptc, ptd, pte, ptf, ptg, pth);
}



line(300, 200, 350, 200);
triangle(500, 200, 550, 200, 525, 220);
line(500, 200, 550, 200);
triangle(300, 200, 350, 200, 325, 220);






int Z = 200 , X = 150;//top face line
for(int x = 0; x < 50; x++)
{
 Z += 10; 
  
  int C1 = int(random(0,255));
int C2 = int(random(0,255));
int C3 = int(random(0,255));

  fill(C1,C2,C3);
  rect(Z,X,20,20);
}



 
for(int x = 0; x < 300; x++)//hair
{
 int R1 = int(random(200,700));
 int R2 = int(random(50,180));
 int R3 = int(random(200,700));
 int R4 = int(random(50,180));
  line(R1, R2, R3, R4); 
}
for(int x = 0; x < 150; x++)//left hair
{
 int R1 = int(random(180,250));
 int R2 = int(random(50,200));
 int R3 = int(random(150,200));
 int R4 = int(random(50,200));
  line(R1, R2, R3, R4); 
}

for(int x = 0; x < 150; x++)//right hair
{
 int R1 = int(random(620,800));
 int R2 = int(random(50,200));
 int R3 = int(random(620,800));
 int R4 = int(random(50,200));
  line(R1, R2, R3, R4); 
}






for(int x = 0; x < 300; x++)//lower mas
{
 int R1 = int(random(200,700));
 int R2 = int(random(620,800));
 int R3 = int(random(200,700));
 int R4 = int(random(620,800));
  line(R1, R2, R3, R4); 
}

for(int x = 0; x < 300; x++)//left mas
{
 int R1 = int(random(180,300));
 int R2 = int(random(520,700));
 int R3 = int(random(180,350));
 int R4 = int(random(520,700));
  line(R1, R2, R3, R4); 
}

for(int x = 0; x < 300; x++)//right mas
{
 int R1 = int(random(480,700));
 int R2 = int(random(520,700));
 int R3 = int(random(480,750));
 int R4 = int(random(520,700));
  line(R1, R2, R3, R4); 
}






