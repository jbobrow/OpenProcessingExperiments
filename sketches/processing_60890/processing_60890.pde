
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
  int reversing;
  int AssignedNumber;
  int check=0;
  boolean PointCreated;
  int checkingBefore, checkingAfter;
  boolean Flip;
  int Direction;
  int MovementCancel;
  int ShutdownValue;
  int Stuck;
  boolean Selected;
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

      if (FighterType==Axeman)
      {
        //Still Costumes
        if (moving==false && fighting==false)
        {
          if (moving==false && costume==leftCostume && fighting==false) image(ApacheAxemanLeft1, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==false) image(ApacheAxemanRight1, coordinateX*20+10, coordinateY*20+10) ;
          else if (moving==false && costume==upCostume && fighting==false) image(ApacheAxemanBack1, coordinateX*20+10, coordinateY*20+10) ;
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
          if (moving==false && costume==leftCostume && fighting==true) image(ApacheAxemanLeft2, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==true) image(ApacheAxemanRight2, coordinateX*20+10, coordinateY*20+10);  
          else if (moving==false && costume==upCostume && fighting==true) image(ApacheAxemanBack2, coordinateX*20+10, coordinateY*20+10);
        }
      }
    }
  }

  void mousePressed()
  {
    if (mouseX<45 && mouseX>=0 && mouseY>=0 && mouseY<40) {
      if (mouseX==coordinateX && mouseY==coordinateY && mousePressed && mouseButton==LEFT)
      {
        for (int x=0; x<startupAmount; x++) {
          Allies ally = (Allies) PlayerFighter.get(x); 
          ally.Selected=false;
        }
        CannotEnter=false;
        Selected=true;
        SelectedUnit=assignNum;
        touch=assignNum;
      }
      //QuickAssigning();
      if (SelectedUnit==assignNum && mousePressed && mouseButton==RIGHT && touch!=-1)
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
    PointCreated=false;
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
        if (finalPoint>-1 && Flip==false) {
          Placement allies2 = (Placement) FinalCoordinate.get(finalPoint);
          if (allies2.assignNumCoordinate==assignNum) {
            if (PointCreated==false) {
              if (abs(coordinateX-allies2.mouseXpoint)>1 ) PointCreated=true;
              if (coordinateX-allies2.mouseXpoint>1 ) PlayerFighter.add(new Allies(coordinateX-1, coordinateY, assignNum));
              if (coordinateX-allies2.mouseXpoint<-1 ) PlayerFighter.add(new Allies(coordinateX+1, coordinateY, assignNum));
              CleanUp();
            }
            if (PointCreated==false) {
              if (abs(coordinateY-allies2.mouseYpoint)>1 ) PointCreated=true;
              if (coordinateY-allies2.mouseYpoint>1) PlayerFighter.add(new Allies(coordinateX, coordinateY-1, assignNum));
              if (coordinateY-allies2.mouseYpoint<-1 ) PlayerFighter.add(new Allies(coordinateX, coordinateY+1, assignNum));
              CleanUp();
            }
            if (PointCreated==false) {
              if (abs(coordinateX-allies2.mouseXpoint)==1 && abs(coordinateY-allies2.mouseYpoint)==1) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
              if (abs(coordinateX-allies2.mouseXpoint)==1 && abs(coordinateY-allies2.mouseYpoint)==0) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
              if (abs(coordinateX-allies2.mouseXpoint)==0 && abs(coordinateY-allies2.mouseYpoint)==1) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
            }
          }
        }
        if (finalPoint>-1 && Flip) {
          Placement allies2 = (Placement) FinalCoordinate.get(finalPoint);
          if (allies2.assignNumCoordinate==assignNum) {
            if (PointCreated==false) {
              if (abs(coordinateY-allies2.mouseYpoint)>1 ) PointCreated=true;
              if (coordinateY-allies2.mouseYpoint>1) PlayerFighter.add(new Allies(coordinateX, coordinateY-1, assignNum));
              if (coordinateY-allies2.mouseYpoint<-1 ) PlayerFighter.add(new Allies(coordinateX, coordinateY+1, assignNum));
              CleanUp();
            }
            if (PointCreated==false) {
              if (abs(coordinateX-allies2.mouseXpoint)>1 ) PointCreated=true;
              if (coordinateX-allies2.mouseXpoint>1 ) PlayerFighter.add(new Allies(coordinateX-1, coordinateY, assignNum));
              if (coordinateX-allies2.mouseXpoint<-1 ) PlayerFighter.add(new Allies(coordinateX+1, coordinateY, assignNum));
              CleanUp();
            }
            if (PointCreated==false) {
              if (abs(coordinateX-allies2.mouseXpoint)==1 && abs(coordinateY-allies2.mouseYpoint)==1) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
              if (abs(coordinateX-allies2.mouseXpoint)==1 && abs(coordinateY-allies2.mouseYpoint)==0) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
              if (abs(coordinateX-allies2.mouseXpoint)==0 && abs(coordinateY-allies2.mouseYpoint)==1) PlayerFighter.add(new Allies(allies2.mouseXpoint, allies2.mouseYpoint, assignNum));
            }
          }
        }
      }
    }
  }

  void RealWalking()
  {
    //Actual Movement
    walking();
    if (startupAmount<PlayerFighter.size() && timer1>=5-Moccasins)
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
        }
      }
    }

    if (StartFightL || StartFightR || StartFightU || StartFightD)
    {
      timer3++;
      if (timer3>=10-Scalping ) {
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
    CritAmount=0;
    Crits=round(random(1, 16));
    if (Crits!=1) {
      Miss=round(random(1, 16));
      if (Miss==1)CritOrMiss.add(new CritsOrMiss(coordinateX, coordinateY, false, true, 0, 50));
    }
    if (OppNum<1000 && OppNum<OpposingFighter.size() && Miss!=1) {
      Enemies enemycheck= (Enemies) OpposingFighter.get(OppNum);
      if (Crits!=1) {
        Damage=attack-enemycheck.defense+DamageIncreasement+TomohawkBonus;
        CritOrMiss.add(new CritsOrMiss(coordinateX, coordinateY, false, false, round( Damage*100), 50));
      }
      if (Crits==1) {
        CritAmount=random(1.2, 2);
        Damage=attack-enemycheck.defense+DamageIncreasement;
        Damage*=CritAmount;
        CritOrMiss.add(new CritsOrMiss(coordinateX, coordinateY, true, false, round( Damage*100), 50));
      }
      enemycheck.life-=Damage;
    }
  }

  void Death()
  {
    for (int b=0;b<startupAmount; b++)
    {
      Allies alliesdeath = (Allies) PlayerFighter.get(b);  
      if (alliesdeath.life<=0) { 
        for (int t=startupAmount; startupAmount<PlayerFighter.size() && t<PlayerFighter.size(); t++) {
          Allies cleanup = (Allies) PlayerFighter.get(t);  
          if (alliesdeath.assignNum==cleanup.assignNumCoordinate) {
            PlayerFighter.remove(t);
            t=startupAmount;
          }
        }
        for (int t=0; t<FinalCoordinate.size(); t++) {
          Placement finals = (Placement) FinalCoordinate.get(t);
          if (alliesdeath.assignNum==finals.assignNumCoordinate) {
            FinalCoordinate.remove(t);
            t=0;
          }
        }   
        startupAmount-=1;
        if (SelectedUnit==alliesdeath.assignNum-1) SelectedUnit=-1 ;
        PlayerFighter.remove(b);
      }
    }
  }

  void CleanUp()
  {
    reversing=0;
    Direction=0;
    for (int clear=0; clear<4; clear++) {
      Allies ClearGo = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
      if (coordinateX-ClearGo.mouseXpoint==1)Direction=180;
      if (coordinateX-ClearGo.mouseXpoint==-1)Direction=0;
      if (coordinateY-ClearGo.mouseYpoint==1)Direction=90;
      if (coordinateY-ClearGo.mouseYpoint==-1)Direction=270;
      if (clear==1)Direction+=90;
      if (clear==2)Direction-=90;
      if (clear==3)Direction-=180;
      if (Direction<0) Direction+=360;
      if (Direction>=360) Direction-=360;
      MovementCancel=0;
      for (int t=0; t<Unpassable.size();t++) {
        Allies Clear1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
        UnablePass Clear2 = (UnablePass) Unpassable.get(t);
        if (Clear1.mouseXpoint==Clear2.x && Clear1.mouseYpoint==Clear2.y) {
          clear=0;
          t=0;
          PlayerFighter.remove(PlayerFighter.size()-1);
          if (Direction==90) PlayerFighter.add(new Allies(coordinateX, coordinateY-1, assignNum));
          if (Direction==270) PlayerFighter.add(new Allies(coordinateX, coordinateY+1, assignNum));
          if (Direction==0) PlayerFighter.add(new Allies(coordinateX+1, coordinateY, assignNum));
          if (Direction==180) PlayerFighter.add(new Allies(coordinateX-1, coordinateY, assignNum));
          if (Direction==90 || Direction==270) Flip=false;
          if (Direction==0 || Direction==180) Flip=true;
          MovementCancel++;
          if (MovementCancel>=10) t=Unpassable.size();
        }
      }
      MovementCancel=0;
      for (int t=0; t<OpposingFighter.size();t++) {

        Allies Clear1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
        Enemies Clear2 = (Enemies) OpposingFighter.get(t);
        if (Clear1.mouseXpoint==Clear2.coordinateX && Clear1.mouseYpoint==Clear2.coordinateY) {
          clear=0;
          t=0;
          PlayerFighter.remove(PlayerFighter.size()-1);
          /* if (Direction==90) PlayerFighter.add(new Allies(coordinateX, coordinateY-1, assignNum));
           if (Direction==270) PlayerFighter.add(new Allies(coordinateX, coordinateY+1, assignNum));
           if (Direction==0) PlayerFighter.add(new Allies(coordinateX+1, coordinateY, assignNum));
           if (Direction==180) PlayerFighter.add(new Allies(coordinateX-1, coordinateY, assignNum));
           if (Direction==90 || Direction==270) Flip=false;
           if (Direction==0 || Direction==180) Flip=true;*/
          MovementCancel++;
          if (MovementCancel>=10) t=OpposingFighter.size();
        }
      }
      MovementCancel=0;
    }
  }

  void startup()
  {
    for (int x=PlayerFighter.size(); x<0; x--)
    {
      Allies ally = (Allies) PlayerFighter.get(x);
      PlayerFighter.remove(x);
    }
  }

  void QuickAcessing()
  {
    if (SelectedUnit==assignNum) {
      if (CtrlPress && OnePress) {
        for (int g=0; g<startupAmount; g++) {
          Allies ally = (Allies) PlayerFighter.get(g);
          if (ally.AssignedNumber==1) ally.AssignedNumber=0;
        }
        AssignedNumber=1;
      }
    }
  }

  void QuickAssigning()
  {
    if (AssignedNumber==1 && OnePress) {
      SelectedUnit=assignNum;
      touch=assignNum;
    }
  }
  void ShutDown() {
    if ( FinalCoordinate.size()>0 ) {
      ShutdownValue=-1;
      for (int a=0; a<FinalCoordinate.size() && FinalCoordinate.size()>0; a++) {
        Placement finals = (Placement) FinalCoordinate.get(a);
        if (finals.assignNumCoordinate==assignNum) {
          ShutdownValue=a;
        }
      }
      for (int t=0; t<Unpassable.size() && FinalCoordinate.size()>0 && ShutdownValue!=-1;t++) {
        Placement Clear1 = (Placement) FinalCoordinate.get(ShutdownValue);
        UnablePass Clear2 = (UnablePass) Unpassable.get(t);
        if (Clear1.mouseXpoint==Clear2.x && Clear1.mouseYpoint==Clear2.y) {
          FinalCoordinate.remove(ShutdownValue);
          t=Unpassable.size();
          CannotEnter=true;
          ErrorTime=0;
        }
      }
      ShutdownValue=-1;
      for (int a=0; a<FinalCoordinate.size() && FinalCoordinate.size()>0; a++) {
        Placement finals = (Placement) FinalCoordinate.get(a);
        if (finals.assignNumCoordinate==assignNum) {
          ShutdownValue=a;
        }
      }
      for (int t=0; t<OpposingFighter.size() && FinalCoordinate.size()>0  && ShutdownValue!=-1;t++) {
        Placement Clear1 = (Placement) FinalCoordinate.get(ShutdownValue);
        Enemies Clear2 = (Enemies) OpposingFighter.get(t);
        if (Clear1.mouseXpoint==Clear2.coordinateX && Clear1.mouseYpoint==Clear2.coordinateY) {
          FinalCoordinate.remove(ShutdownValue);
          t=OpposingFighter.size();
          CannotEnter=true;
          ErrorTime=0;
        }
      }
      ShutdownValue=-1;
      for (int a=0; a<FinalCoordinate.size() && FinalCoordinate.size()>0; a++) {
        Placement finals = (Placement) FinalCoordinate.get(a);
        if (finals.assignNumCoordinate==assignNum) {
          ShutdownValue=a;
        }
      }
      for (int t=0; t<startupAmount && FinalCoordinate.size()>0  && ShutdownValue!=-1;t++) {
        Placement Clear1 = (Placement) FinalCoordinate.get(ShutdownValue);
        Allies Clear2 = (Allies) PlayerFighter.get(t);
        if (Clear1.mouseXpoint==Clear2.coordinateX && Clear1.mouseYpoint==Clear2.coordinateY && Clear1.assignNumCoordinate!=Clear2.assignNum) {
          FinalCoordinate.remove(ShutdownValue);
          t=startupAmount;
          CannotEnter=true;
          ErrorTime=0;
        }
      }
    }
  }

  void UnitSelected() {
    if (Selected) {
      image(ArrowSelect, coordinateX*20+9, coordinateY*20-7);
    }
  }
}


