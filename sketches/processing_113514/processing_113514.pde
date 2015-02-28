
size(800,800);
float Ay,By,Cy,Dy,a,c,btA,btB,btC,btD;
float AeSize, BeSize, CeSize, DeSize;
AeSize = 130;
BeSize = 220;
CeSize = 190;
DeSize = 90;
btA = 90;
btB = 50;
btC = 50;
btD = 30;


background(0);

smooth();
noStroke();
fill(255);

a = 90;
c = 150;

fill(0,0,255,60);
ellipse(0,-250,1250,700);

for(int fx=0; fx<=width + 100; fx++){
  Ay = -fx + height;
  By = -4 * fx + (height*4+710);
  Cy = -2 * fx + height+740;
  Dy = -0.5 * fx + height-480;
  a = a -0.11;
  c = c -0.2;
  AeSize = AeSize - 0.14;
  BeSize = BeSize - 0.27;
  CeSize = CeSize - 0.12;
  DeSize = DeSize - 0.12;
  
  if(Ay<=height+100 && Ay>=0 && fx % btA == 0){
    fill(255);
    ellipse(fx-a,Ay,AeSize,AeSize);
    ellipse(fx+a,Ay,AeSize,AeSize);
    fill(255,80);
    ellipse(fx-a,Ay,AeSize*2,AeSize*2);
    ellipse(fx+a,Ay,AeSize*2,AeSize*2);
    fill(255,30);
    ellipse(fx-a,Ay,AeSize*4,AeSize*4);
    ellipse(fx+a,Ay,AeSize*4,AeSize*4);
  }
  if(Cy<=height+100 && Cy>=0 && fx % btB == 0){
    fill(255,0,0,200);
    ellipse(fx+75+c,Cy,BeSize,BeSize);
    ellipse(fx+75-c,Cy,BeSize,BeSize);
    fill(255,0,0,80);
    ellipse(fx+75+c,Cy,BeSize*2,BeSize*2);
    ellipse(fx+75-c,Cy,BeSize*2,BeSize*2);
    fill(255,0,0,30);
    ellipse(fx+75+c,Cy,BeSize*2,BeSize*4);
    ellipse(fx+75-c,Cy,BeSize*2,BeSize*4);
  }
  if(Dy<=height+100 && Dy>=0 && fx % btC == 0){
    fill(255,180,0);
    ellipse(fx,Dy,DeSize,DeSize);
    fill(255,180,0,80);
    ellipse(fx,Dy,DeSize*2,DeSize*2);
    fill(255,180,0,30);
    ellipse(fx,Dy,DeSize*4,DeSize*4);
  }
  if(By<=height && By>=0 && fx % btD == 0){
    fill(255,180,0);
    ellipse(fx,By,CeSize,CeSize);
    fill(255,180,0,80);
    ellipse(fx,By,CeSize*2,CeSize*2);
    fill(255,180,0,30);
    ellipse(fx,By,CeSize*4,CeSize*4);
  }
}


