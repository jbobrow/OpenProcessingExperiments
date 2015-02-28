
//******************* call Classes
Catarpillar FirstCatarpillar;
Catarpillar SecondCatarpillar;
Bird FirstBird;
Bird SecondBird;
Bird ThirdBird;
Bunny FirstBunny;
//******************* call var's
//__for sky() & nightFog() & SunAndMoon;
float DayOp, NightOp, DayAndNightDelay, NightFogOp, SunX, MoonX, CLx, CLx2, CLy, CLy2, CLx3, CLy3, CLx4, CLy4;
boolean IsItDay, DayOrNightSetIn;
int FirstBirdX = 600;
int FirstBirdY = 100;
//******************* end call var's

void setup(){
 size(600,600);
 colorMode(RGB,255,255,255,100);
 frameRate(30);
 noStroke();
 
 DayOp = 100;
 NightOp = 0;
 DayAndNightDelay = 200;
 SunX = -340;
 MoonX = 600;
 IsItDay = false;
 DayOrNightSetIn = true;
 //clouds
 CLx = 300; CLy = 170; CLx2 = 10; CLy2 = 50; CLx2 = -200; CLy2 = 100;
 //classes
 FirstCatarpillar = new Catarpillar(200,400);   
 SecondCatarpillar = new Catarpillar(0,500);
  FirstBird = new Bird();
 SecondBird = new Bird();
 ThirdBird = new Bird();
 FirstBunny = new Bunny();
 
 
}//END OF SETUP

void draw(){
 sky();
 SunAndMoon();
 clouds();
 
 FirstBird.Bird(FirstBirdX,FirstBirdY);
 FirstBirdX--;
 SecondBird.Bird(FirstBirdX+40,FirstBirdY-30);
 FirstBirdX--;
 ThirdBird.Bird(FirstBirdX+40,FirstBirdY+30);
 FirstBirdX--;
 if(FirstBirdX<-200){
    FirstBirdX = 700;
    FirstBirdY = 70+int(random(80));
 }
 
 earth();
 FirstBunny.Bunny(300,320);
 FirstCatarpillar.CatAnim();
 FirstCatarpillar.Catmovement();
 SecondCatarpillar.CatAnim();
 SecondCatarpillar.Catmovement();
 nightFog();
}//END OF DRAW

// **************** METHODS *********************** //
void clouds(){
 fill(255);
 
 if(CLx >= 690){
   CLx = -130;
   CLy = random(0,310);
 }
 if(CLx2 >= 690){
   CLx2 = -130;
   CLy2 = random(0,310);
 }
 if(CLx3 >= 690){
   CLx3 = -130;
   CLy3 = random(0,310);  
 }
 if (CLx4 >= 630){
   CLx4 = -200;
   CLy4 = random(0,300);
 }
 
 //Cloud 1
 rect(-63+(CLx),41+(CLy),18,18);
 rect(-32+(CLx),27+(CLy),32,32);
 rect(0+(CLx),0+(CLy),69,69);
 rect(62+(CLx),22+(CLy),43,43);
 rect(99+(CLx),35.95+(CLy),24,24);
 rect(114+(CLx),31+(CLy),18,18);
 //Cloud 2
 rect(-28.5+(CLx2),9.95+(CLy2),35,35);
 rect(0+(CLx2),0+(CLy2),56,56);
 rect(22.5+(CLx2),-14.5+(CLy2),45,45);
 rect(50.5+(CLx2),4.95+(CLy2),34,34);  
 //Cloud 3
 rect(-23+(CLx3),27+(CLy3),23,23);
 rect(0+(CLx3),0+(CLy3),57,57);
 rect(51+(CLx3),7+(CLy3),56,56);
 rect(103+(CLx3),18+(CLy3),34,34);  
 //Cloud 4 
 rect(CLx4+37,CLy4+41,45,65);
 rect(CLx4+48,CLy4+46,71,34);
 rect(CLx4+73,CLy4+117,25,15);
 rect(CLx4+71,CLy4+62,30,45);

 CLx+=1.0;
 CLx2+=1.2;
 CLx3+=1.5;
 CLx4+=1.75;

 
}// >>>> end of clouds();

void SunAndMoon(){
 if(SunX<380){
 fill(#F7FF1C);
 ellipse((SunX+280),(((SunX*SunX)/650))+100,80,80);
 SunX+=3;
 }
 if(MoonX<380){
 fill(#FEFFDB);
 arc((MoonX+280),(((MoonX*MoonX)/650))+100, 80, 80, 0-30, ((PI/2)*2.5)-30);
 MoonX+=3;
 }
}// >>>> end of SunAndMoon();

void sky(){
 fill(#E3FBFC, DayOp); rect(0,0,600,600);
 fill(#0E2C46, NightOp); rect(0,0,600,600);
 if(DayOrNightSetIn){
   DayAndNightDelay--;
   if(DayAndNightDelay <= 0){
     DayAndNightDelay = 175;
     DayOrNightSetIn = false;
   }
 }else{
   if(IsItDay){
     NightOp -= 0.5;
     DayOp += 0.5;
   }else{
     NightOp += 0.5;
     DayOp -= 0.5;
   }
   if(DayOp >= 100){
     IsItDay = false;
     DayOrNightSetIn = true;
     SunX = -340;
   }else if(DayOp <= 0){
     IsItDay = true;
     DayOrNightSetIn = true;
     MoonX = -340;
   }
 }
}// >>>> end of sky();

void earth(){
 fill(#A8F083,100);
 bezier(0, 300, 360, 290, 240, 290, 600, 300);
 rect(0,300,600,300);
}// >>>> end of earth();

void nightFog(){
 if(NightOp > 60){
   NightFogOp = 60;
 } else {
   NightFogOp = NightOp;
 }
 fill(#0E2C46, NightFogOp); rect(0,0,600,600);
}// >>>> end of nightFog();
// ******************************** end OF METHODS
// **************** CLASSES *********************** //


class Bird {
 

 int phase = 1;
 int RW1Lift = 0;
 int RW2Lift = 0;
 int RW_T_Lift = 4;
 int LW1Lift = 0;
 int LW2Lift = 0;
 int LW_T_Lift = 4;
 int WitchWingPartMoves = 1;
 float GeneralWingLift = 0;
 float GenralAdd = 0.5;

 void Bird(int x, int y){
       fill(#9C99A0);
    if(WitchWingPartMoves == 1){
     RW_T_Lift--;
     LW_T_Lift--;
     RW1Lift++;
     LW1Lift++;
     GeneralWingLift = GenralAdd + GeneralWingLift;
     if(RW1Lift >= 5){
     WitchWingPartMoves=2;
     }
    }else if (WitchWingPartMoves == 2){
     RW1Lift--;
     LW1Lift--;
     RW2Lift++;
     LW2Lift++;
     GeneralWingLift = GenralAdd + GeneralWingLift;
     if(RW2Lift >= 5){
     WitchWingPartMoves=3;
     }
    }else if (WitchWingPartMoves == 3){
     RW2Lift--;
     LW2Lift--;
     RW_T_Lift++;
     LW_T_Lift++;
     GeneralWingLift = GenralAdd + GeneralWingLift;
     GenralAdd *= -1;
     if(RW_T_Lift >= 5){
     WitchWingPartMoves=1;
     }
    }
     
   
    rect(x-1,y-6+(GeneralWingLift),8,8);//HEAD
    rect(x+7,y-6+(RW1Lift)+(GeneralWingLift),9,3);//Right Wing 1
    rect(x+17,y-6+(RW2Lift)+(GeneralWingLift),9,3);//Right Wing 2
    rect(x+27,y-6+(RW_T_Lift)+(GeneralWingLift),3,3);//Right Wing Tip
    rect(x-7-3,y-6+(LW1Lift)+(GeneralWingLift),9,3);//Left Wing 1
    rect(x-17-3,y-6+(LW2Lift)+(GeneralWingLift),9,3);//Left Wing 2
    rect(x-24,y-6+(LW_T_Lift)+(GeneralWingLift),3,3);//Left Wing Tip
 }
}
class Catarpillar {

 int Block1;
 int Block2;
 int Block3;
 int Block4;
  int CatarpillarBodyPartMove;
 int CatarpillarBodyPartMove_REAL;
 float CatarpillarXMove;
 int catx;
 int caty;
 //int CatarpillarBodyPartMove = 1;
 //boolean dg=false;
// float CatarpillarXMove = -10;
 

Catarpillar(int xfg, int yfg) {
CatarpillarBodyPartMove_REAL = 1;
 CatarpillarXMove = -10;
 
 catx=xfg;
 caty=yfg;
  Block1 = 0;
 Block2 = 0;
 Block3 = 0;
 Block4 = 0;

}
void CatAnim(){
 fill(#4FBC4E);
 rect(catx-20+(CatarpillarXMove), caty-5+(Block4), 5, 5);
 rect(catx-12+(CatarpillarXMove), caty-8+(Block3), 8, 8);
 rect(catx-2+(CatarpillarXMove), caty-10+(Block2), 10, 10);
 rect(catx+11+(CatarpillarXMove), caty-9+(Block1), 9, 9);

 if (CatarpillarBodyPartMove_REAL == 1) {
    if (Block1 > -3) {
     Block1--;
     Block4++;
    }
    else {
     CatarpillarBodyPartMove_REAL = 2;
    }
 }
 else if (CatarpillarBodyPartMove_REAL == 2) {
    if (Block2 > -3) {
     Block1++;
     Block2--;
    }
    else {
     CatarpillarBodyPartMove_REAL = 3;
    }
 }
 else if (CatarpillarBodyPartMove_REAL == 3) {
    if (Block3 > -3) {
     Block2++;
     Block3--;
    }
    else {
     CatarpillarBodyPartMove_REAL = 4;
    }
 }
 else if (CatarpillarBodyPartMove_REAL == 4) {
    if (Block4 > -3) {
     Block3++;
     Block4--;
    }
    else {
     CatarpillarBodyPartMove_REAL = 1;
    }
 }
}
void Catmovement(){
 // X MOVEMENT
 if (CatarpillarBodyPartMove_REAL == 2 || CatarpillarBodyPartMove_REAL == 3) {
    CatarpillarXMove+=1;
 }
 else {
    CatarpillarXMove+=0;
 }
 if (CatarpillarXMove > 600){
    CatarpillarXMove = -300;
 }
}
}

class Bunny {
 boolean IsBunnyMovingXplus = true;
 float BunnyXMove=0;
 int GeneralBunnyYMove=0;
 float way = 1;
 int timing = 0;
 int phase = 1;
 void Bunny(int x, int y){
  fill(#ADB6BF);
  
  if(timing < 100){
    phase = 1;
     
  }else if(timing > 100 && timing < 200){
     phase = 2;
  }else if(timing > 200){
    timing = -100;
    phase = 1;
    // phase = 1;
  }
  
  if(phase == 1){
     
  if(BunnyXMove <= -200){
  IsBunnyMovingXplus=true;
  }else if (BunnyXMove >= 200){
  IsBunnyMovingXplus=false;
  }
  if(IsBunnyMovingXplus == true){
  BunnyXMove = BunnyXMove + (way);
  rect(x+20+(BunnyXMove), y-14+(GeneralBunnyYMove), 14, 14);//HEAD
  rect(x-3+(BunnyXMove), y-18+(GeneralBunnyYMove), 22, 18);//BODY
  rect(x-14+(BunnyXMove), y+(GeneralBunnyYMove)-9, 8, 8);//TAIL
  rect(x+20+(BunnyXMove), y-27+(GeneralBunnyYMove), 5, 11);//EAR1
  rect(x+20+(BunnyXMove)+9, y-27+(GeneralBunnyYMove), 5, 11);//EAR1
  
  
  
  }else if (IsBunnyMovingXplus == false){
     
    BunnyXMove = BunnyXMove - (way);
    rect(x-20+(BunnyXMove), y-14+(GeneralBunnyYMove), 14, 14);//HEAD
  rect(x-3+(BunnyXMove), y-18+(GeneralBunnyYMove), 22, 18);//BODY
  rect(x+21+(BunnyXMove), y+(GeneralBunnyYMove)-9, 8, 8);//TAIL
  rect(x-20+(BunnyXMove), y-27+(GeneralBunnyYMove), 5, 11);//EAR1
  rect(x-20+(BunnyXMove)+9, y-27+(GeneralBunnyYMove), 5, 11);//EAR1
     
  }
  

     
  
  
  
  //phase=2;
  }else if (phase==2){
     
    rect(x-3+(BunnyXMove)-3, y-33+(GeneralBunnyYMove)-5, 14, 14);//HEAD
    rect(x-3+(BunnyXMove)-3, y-18+(GeneralBunnyYMove)-5, 18, 22);//BODY
    rect(x+16+(BunnyXMove)-3, y+(GeneralBunnyYMove)-5-5, 8, 8);//TAIL
    rect(x-20+(BunnyXMove)+17-3, y-26+(GeneralBunnyYMove)-19-5, 5, 11);//EAR1
    rect(x-20+(BunnyXMove)+26-3, y-26+(GeneralBunnyYMove)-19-5, 5, 11);//EAR1
  }
  timing++;

 }
}
// ******************************** end OF CLASSES

