
class Allies
{
  float coordinateX, coordinateY;
  float mouseXpoint, mouseYpoint;
  int X, Y;
  int startX, startY;
  boolean fighting=false;
  int assignNum, assignNumCoordinate;
  int life;
  boolean moving=false;
  int listNum=startupAmount+1;
  int upCostume=10;
  int leftCostume=11;
  int rightCostume=12;
  int costume=leftCostume;
  int FighterType=0;
  int checkingFights;
  int attack, defense;
  boolean StartFightL=false;
  boolean StartFightR=false;
  boolean StartFightU=false;
  boolean StartFightD=false;
  boolean Die=false;
  boolean cleaning=false;
  boolean moved=false;
  boolean clearedX=false;
  boolean clearedY=false;
  int OppNum=1000;
  float Damage;
  int timer3;
  int Ycount=0;
  boolean ProxySlot;
  int clearingMiss;
  int Crits;
  float CritAmount;
  int Miss;
  int finalPoint;
  int timer1;
  int clearingStage;
  int Vertical=1;
  int Horizontal=2;
  Allies(int a, int b, int hp, int att, int def, int assign, int fighterType, boolean Proxying)
  {
    coordinateX=a;
    coordinateY=b;
    life=hp;
    assignNum=assign;
    FighterType=fighterType;
    attack=att;
    defense=def;
    ProxySlot=Proxying;
  }

  Allies(float m, float n, int assignNum)
  {
    mouseXpoint=m;
    mouseYpoint=n;
    assignNumCoordinate=assignNum;
  }
  Allies(boolean Proxying)
  {
    ProxySlot=Proxying;
  }
  void show()
  {
    if (ProxySlot) {
      if (FighterType==Warrior)
      {
        //Still Costumes
        if (moving==false && fighting==false)
        {
          if (moving==false && costume==leftCostume && fighting==false) image(ApacheWarriorLeft, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==false) image(ApacheWarriorRight, coordinateX*20+10, coordinateY*20+10) ;
          else if (moving==false && costume==upCostume && fighting==false) image(ApacheWarriorUp, coordinateX*20+10, coordinateY*20+10) ;
        }
        //moving Costumes
        if (moving==true && fighting==false)
        {
          if (moving==true && costume==leftCostume && fighting==false) image(ApacheWarriorLeftWalking, coordinateX*20+10, coordinateY*20+10);
          else if (moving==true && costume==rightCostume && fighting==false) image(ApacheWarriorRightWalking, coordinateX*20+10, coordinateY*20+10);
          else if (moving==true && costume==upCostume && fighting==false) image(ApacheWarriorUpWalking, coordinateX*20+10, coordinateY*20+10);
        }
        //Fighting Costumes
        if (moving==false && fighting==true)
        {
          if (moving==false && costume==leftCostume && fighting==true) image(ApacheWarriorLeftSwing, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==true) image(ApacheWarriorRightSwing, coordinateX*20+10, coordinateY*20+10);  
          else if (moving==false && costume==upCostume && fighting==true) image(ApacheWarriorUpSwing, coordinateX*20+10, coordinateY*20+10);
        }
      }


      if (FighterType==Calvary)
      {
        //Still Costumes
        if (moving==false && fighting==false)
        {
          if (moving==false && costume==leftCostume && fighting==false) image(ApacheCalvaryLeft, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==false) image(ApacheCalvaryRight, coordinateX*20+10, coordinateY*20+10) ;
          else if (moving==false && costume==upCostume && fighting==false) image(ApacheCalvaryUp, coordinateX*20+10, coordinateY*20+10) ;
        }
        //Moving Costumes
        if (moving==true && fighting==false)
        {
          if (moving==true && costume==leftCostume && fighting==false) ;
          else if (moving==true && costume==rightCostume && fighting==false) ;
          else if (moving==true && costume==upCostume && fighting==false) ;
        }
        //Fighting Costumes
        if (moving==false && fighting==true)
        {
          if (moving==false && costume==leftCostume && fighting==true) image(ApacheCalvaryLeftFighting, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==true) image(ApacheCalvaryRightFighting, coordinateX*20+10, coordinateY*20+10);  
          else if (moving==false && costume==upCostume && fighting==true) image(ApacheCalvaryUpFighting, coordinateX*20+10, coordinateY*20+10);
        }
      }

      if (FighterType==Spearman)
      {
        //Still Costumes
        if (moving==false && fighting==false)
        {
          if (moving==false && costume==leftCostume && fighting==false) image(ApacheSpearLeft, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==false) image(ApacheSpearRight, coordinateX*20+10, coordinateY*20+10) ;
          else if (moving==false && costume==upCostume && fighting==false) image(ApacheSpearUp, coordinateX*20+10, coordinateY*20+10) ;
        }
        //Moving Costumes
        if (moving==true && fighting==false)
        {
          if (moving==true && costume==leftCostume && fighting==false) ;
          else if (moving==true && costume==rightCostume && fighting==false) ;
          else if (moving==true && costume==upCostume && fighting==false) ;
        }
        //Fighting Costumes
        if (moving==false && fighting==true)
        {
          if (moving==false && costume==leftCostume && fighting==true) image(ApacheSpearLeftFighting, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==true) image(ApacheSpearRightFighting, coordinateX*20+10, coordinateY*20+10);  
          else if (moving==false && costume==upCostume && fighting==true) image(ApacheSpearUpFighting, coordinateX*20+10, coordinateY*20+10);
        }
      }
    }
  }

  void mousePressed()
  {
    if (mouseX<45 && mouseX>=0 && mouseY>=0 && mouseY<40) {
      if (mouseX==coordinateX && mouseY==coordinateY && mousePressed && mouseButton==LEFT)
      {
        SelectedUnit=assignNum-1;
        touch=assignNum;
      }
      if (SelectedUnit==assignNum-1 && mousePressed && mouseButton==RIGHT && touch!=-1)
      {
        for (int a=0; FinalCoordinate.size()>0 && a<FinalCoordinate.size(); a++) {
          Placement finals = (Placement) FinalCoordinate.get(a);
          if (finals.assignNumCoordinate==assignNum) {
            FinalCoordinate.remove(a);
          }
        }
        FinalCoordinate.add(new Placement(mouseX, mouseY, assignNum));
      }
    }
  }


  void walking()
  {
    timer1++;
    finalPoint=-1;
    if (timer1>=5) {
      if (FinalCoordinate.size()>0 ) {
        for (int a=0; a<FinalCoordinate.size(); a++) {
          Placement finals = (Placement) FinalCoordinate.get(a);
          if (finals.assignNumCoordinate==assignNum) {
            finalPoint=a;
          }
        }
        if (finalPoint>-1) {
          Placement allies2 = (Placement) FinalCoordinate.get(finalPoint);
          if (allies2.assignNumCoordinate==assignNum) {
            if (coordinateX-allies2.mouseXpoint>1 ) PlayerFighter.add(new Allies(coordinateX-1, coordinateY, assignNum));
            if (coordinateX-allies2.mouseXpoint<-1 ) PlayerFighter.add(new Allies(coordinateX+1, coordinateY, assignNum));
            clearingStage=Horizontal;
            CleanUp();
            if (coordinateY-allies2.mouseYpoint>1) PlayerFighter.add(new Allies(coordinateX, coordinateY-1, assignNum));
            if (coordinateY-allies2.mouseYpoint<-1 ) PlayerFighter.add(new Allies(coordinateX, coordinateY+1, assignNum));
            clearingStage=Vertical;
            CleanUp();
            if (abs(coordinateX-allies2.mouseXpoint)==1 && abs(coordinateY-allies2.mouseYpoint)==1) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
          }
        }
      }
    }
  }
  void RealWalking()
  {
    //Actual Movement
    walking();
    if (startupAmount<PlayerFighter.size() && timer1>=5)
    {
      check=0;
      for (int a=startupAmount; PlayerFighter.size()>0 && a<PlayerFighter.size(); a++)
      {
        Allies allies3 = (Allies) PlayerFighter.get(a);
        if (allies3.assignNumCoordinate == assignNum)
        {
          check=a;
        }
      }
      timer1=0;
      if (check<PlayerFighter.size() && check>startupAmount-1) {
        Allies allies1 = (Allies) PlayerFighter.get(check);
        if (allies1.mouseXpoint-coordinateX>=1 && allies1.assignNumCoordinate == assignNum) costume=rightCostume;
        if (allies1.mouseXpoint-coordinateX<=-1 && allies1.assignNumCoordinate == assignNum) costume=leftCostume;
        if (allies1.mouseYpoint-coordinateY<=-1 && allies1.assignNumCoordinate == assignNum) costume=upCostume;
        if (allies1.mouseYpoint-coordinateY>=1 && allies1.assignNumCoordinate == assignNum) costume=leftCostume;
        if (allies1.assignNumCoordinate == assignNum)
        {
          if (moving=true)
          {
            moving=false;
          }
          else if (moving==false)
          {
            moving=true;
          }
          coordinateX=allies1.mouseXpoint;
          coordinateY=allies1.mouseYpoint;
          moved=true;
        }
        PlayerFighter.remove(startupAmount);
        if (FinalCoordinate.size()>0 && finalPoint>-1) {
          Placement finals = (Placement) FinalCoordinate.get(finalPoint);
          if (finals.mouseXpoint==coordinateX && finals.mouseYpoint==coordinateY) {
            FinalCoordinate.remove(finalPoint);
            finalPoint=0;
          }
        }
      }
    }
  }

  void Fighting()
  {
    //Fighting
    for (int a=0; a<OpposingFighter.size() ; a++)
    {
      //Allies allies2 = (Allies) PlayerFighter.get(check);
      Enemies enemy = (Enemies) OpposingFighter.get(a);
      if (StartFightR==false && StartFightL==false && StartFightU==false && StartFightD==false)
      {
        if (abs(coordinateX-enemy.coordinateX)==1 || abs(coordinateY-enemy.coordinateY)==1) {
          if (coordinateX-enemy.coordinateX==-1 && coordinateY==enemy.coordinateY)
          {   
            moving=false;
            costume=rightCostume;
            StartFightL=true;
            cleaning=true;
            OppNum=a;
          }
          if (coordinateX-enemy.coordinateX==1 && coordinateY==enemy.coordinateY)
          {

            moving=false;
            costume=leftCostume;
            StartFightU=true;
            cleaning=true;
            OppNum=a;
          }
          if (enemy.coordinateY-coordinateY==-1 && coordinateX==enemy.coordinateX)
          {

            moving=false;
            costume=upCostume;
            StartFightR=true;
            cleaning=true;
            OppNum=a;
          }
          if (enemy.coordinateY-coordinateY==1 && coordinateX==enemy.coordinateX)
          {

            moving=false;
            costume=leftCostume;
            StartFightD=true;
            cleaning=true;
            OppNum=a;
          }
          /*for (int b=startupAmount; b<PlayerFighter.size() && cleaning==true && startupAmount+1<=PlayerFighter.size()-1; b++)
           {
           Allies allieschecking = (Allies) PlayerFighter.get(startupAmount+1);
           if (assignNum==allieschecking.assignNumCoordinate)
           {
           PlayerFighter.remove(b);
           }
           if (b==PlayerFighter.size()-1) cleaning=false;
           }*/
        }
      }
    }

    if (StartFightL || StartFightR || StartFightU || StartFightD)
    {
      timer3++;
      if (timer3>=10 ) {
        if (fighting==true)
        {
          fighting=false;
          timer3=0;
        }
        else if (fighting==false)
        {
          Damage();
          fighting=true;
          timer3=0;
        }
      }
      if (OpposingFighter.size()==0) {
        StartFightR=false;
        StartFightL=false;
        StartFightU=false;
        StartFightD=false;
        fighting=false;
      }

      if (OppNum<OpposingFighter.size()) {
        Enemies enemycheck= (Enemies) OpposingFighter.get(OppNum);
        if (abs(enemycheck.coordinateX-coordinateX)>1 || abs(enemycheck.coordinateY-coordinateY)>1) {
          StartFightR=false;
          StartFightL=false;
          StartFightU=false;
          StartFightD=false;
          fighting=false;
        }
        if ( abs(enemycheck.coordinateX-coordinateX)==1 && abs(enemycheck.coordinateY-coordinateY)==1)
        {
          StartFightR=false;
          StartFightL=false;
          StartFightU=false;
          StartFightD=false;
          fighting=false;
        }
      }
    }
  }

  void Damage()
  {
    if (check<PlayerFighter.size()) {
      CritAmount=0;
      Crits=round(random(1, 16));
      if (Crits!=1) {
        Miss=round(random(1, 16));
        if (Miss==1)CritOrMiss.add(new CritsOrMiss(coordinateX, coordinateY, false, true, 0, 50));
      }
      if (OppNum<1000 && OppNum<OpposingFighter.size() && Miss!=1) {
        Enemies enemycheck= (Enemies) OpposingFighter.get(OppNum);
        if (Crits!=1) {
          Damage=attack-enemycheck.defense;
          CritOrMiss.add(new CritsOrMiss(coordinateX, coordinateY, false, false, round( Damage*100), 50));
        }
        if (Crits==1) {
          CritAmount=random(1.2, 2);
          Damage=attack-enemycheck.defense;
          Damage*=CritAmount;
          CritOrMiss.add(new CritsOrMiss(coordinateX, coordinateY, true, false, round( Damage*100), 50));
        }
        enemycheck.life-=Damage;
      }
    }
  }

  void Death()
  {
    for (int b=0; b<startupAmount; b++)
    {
      Allies alliesdeath = (Allies) PlayerFighter.get(b);  
      if (alliesdeath.life<=0) { 
        PlayerFighter.remove(alliesdeath);
        startupAmount-=1;
      }
    }
  }

  void CleanUp()
  {
   /* if (clearingStage==Horizontal) {
      Allies Clear1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
      if (coordinateX-Clear1.mouseXpoint==1 && Clear1.mouseYpoint==coordinateY && Clear1.assignNumCoordinate==assignNum) {
        for (int t=0; t<startupAmount; t++) {
          if (startupAmount < PlayerFighter.size())
          {
            Allies ClearCorrect = (Allies) PlayerFighter.get(t);
            if (ClearCorrect.coordinateX==Clear1.mouseXpoint && ClearCorrect.coordinateY==Clear1.mouseYpoint && ClearCorrect.assignNum!=Clear1.assignNumCoordinate) {
              PlayerFighter.remove(PlayerFighter.size()-1);
              println("g");
              t=0;
              PlayerFighter.add(new Allies(coordinateX, coordinateY+1, assignNumCoordinate));
            }
          }
        }
      }
    }
    clearingStage=0;*/
  }

  void startup()
  {
    for (int x=PlayerFighter.size(); x<0; x--)
    {
      Allies ally = (Allies) PlayerFighter.get(x);
      PlayerFighter.remove(x);
    }
  }
}


