
//Artie Battaglin-period 4 Engineering-4.9.14
 
 
 
int BoxHi=600;
int BoxHiGrow=10;
 
int Box=320;
int BoxGrow=10;
 
int P=440;
int Pgrow=10;
 
int xCord =0;
int grow =10;
 
int y = 100;
int yGrow = 10;
 
int Xtwo=0;
int Xgrow=10;
 
int M=0;
int Mgrow=10;
 
int B=510;
int Bgrow=10;
 
int bye = 20;
int hi = 20;

void setup()
{size (400,800);
}
void draw()
{
  background(random(0,255),random(0,255),random(0,255));
  noStroke();
  fill(255,0,0);
  rect(0,0,60,60);
  rect(20,60,40,140);
  rect(60,160,80,40);
  rect(100,200,40,200);
  rect(60,360,40,120);
  rect(100,440,160,40);
  rect(220,480,40,40);
  rect(140,520,200,40);
  rect(140,560,40,80);
  rect(180,600,160,40);
  rect(300,560,40,40);
  rect(220,640,40,40);
  rect(160,680,160,80);
  fill(0,0,255);
  ellipse(hi,bye,30,30);
  
 if  (key== 'w')  {  bye = bye - 4;  }
 else if (key== 's')  { bye = bye + 4;  }
 else if (key== 'a') { hi = hi - 4;  }
 else if (key== 'd')  { hi = hi + 4;  }

  fill(0,255,0);
  rect(xCord,100,40,40);
 xCord = xCord + grow; 
 if (xCord==0||xCord==100) 
 {
   grow = grow* -1;  
 }
  fill (0,255,0);
rect (100,y,40,40);
 y = y + yGrow;
 if (y==0||y==200)
 {
   yGrow = yGrow*-1;
 }
   fill(0,255,0);
  rect(xCord,240,40,40);
 Xtwo = Xtwo + Xgrow; 
 if (Xtwo==0||Xtwo==100) 
 {
   Xgrow = Xgrow* -1;  
}
  fill (0,255,0);
rect (100,y,40,40);
 y = y + yGrow;
 if (y==0||y==200)
 {
   yGrow = yGrow*-1;
 }
  fill(0,255,0);
  rect(xCord,360,40,40);
 Xtwo = Xtwo + Xgrow; 
 if (Xtwo==10||Xtwo==100) 
 {
   Xgrow = Xgrow* -1;  
 }
   fill (0,255,0);
rect (100,B,40,40);
 B = B + Bgrow;
 if (B==520||B==400)
 {
   Bgrow = Bgrow*-1;
 }
 
   fill (0,255,0);
rect (220,P,40,40);
 P = P + Pgrow;
 if (P==450||P==350)
 {
   Pgrow = Pgrow*-1;
 }
 
 
  fill(0,255,0);
  rect(Box,440,40,40);
 Box = Box + BoxGrow; 
 if (Box==330||Box==180) 
 {
   BoxGrow = BoxGrow* -1;  
 }
 
    fill (0,255,0);
rect (220,BoxHi,40,40);
 BoxHi = BoxHi + BoxHiGrow;
 if (BoxHi==610||BoxHi==520)
 {
   BoxHiGrow = BoxHiGrow*-1;
 }
 if (hi > 60 && bye < 160) {hi=20;
 bye=20;}
 if (hi>140 && bye < 440) {hi=20;
 bye=20;}
 if (hi > 100 && bye < 440 && bye > 400 ) {hi=20;
 bye=20;}
if (hi > 260 && bye < 520) {hi=20;
 bye=20;}
 if (hi > 340 && bye < 540) {hi=20;
 bye=20;}
 if ( hi > 260 && bye < 680 && bye > 640) {hi=20;
 bye=20;}
 if ( hi > 320 && bye < 680 && bye > 640) {hi=20;
 bye=20;}
  if( hi < 20 && bye > 60 && bye < 360) { hi=20;
 bye=20;}
  if (hi < 100 && bye > 200 && bye < 360)  { hi=20;
 bye=20;} 
  if (hi < 60 && bye > 360 && bye < 600)  { hi=20;
 bye=20;}
   if (hi < 220 && bye > 480 && bye < 520)  { hi=20;
 bye=20;}
   if ( hi < 140 && bye > 520 && bye < 760)  { hi=20;
 bye=20;}
  if ( hi < 220 && bye > 640 && bye < 680)  { hi=20;
 bye=20;}
  if (bye >760)  { hi=20;
 bye=20;}
  if (hi > 180 && hi < 300 && bye > 560 && bye < 600)  { hi=20;
 bye=20;} 

 if (hi >= 160 && hi <= 320 && bye >= 680 && bye <= 760)
 { 
    pushMatrix();
   background(random(0,255),0,0);
   textSize(40);
   text ("NICE JOB YOU DID IT",0,200);
    popMatrix();
       hi=240; bye=720;
 }  
 } 
