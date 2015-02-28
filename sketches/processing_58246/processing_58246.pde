
class Allies
{
  float coordinateX, coordinateY;
  int mouseXpoint, mouseYpoint;
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
  int Damage;
  int timer3;
  int Ycount=0;
  boolean ProxySlot;
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

  Allies(int m, int n, int assignNum)
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
          if (moving==false && costume==leftCostume && fighting==false) image(ApacheWarriorLeft, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==false) image(ApacheWarriorRight, coordinateX*20+10, coordinateY*20+10) ;
          else if (moving==false && costume==upCostume && fighting==false) image(ApacheWarriorUp, coordinateX*20+10, coordinateY*20+10) ;
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
          if (moving==false && costume==leftCostume && fighting==true) image(ApacheWarriorLeftSwing, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==true) image(ApacheWarriorRightSwing, coordinateX*20+10, coordinateY*20+10);  
          else if (moving==false && costume==upCostume && fighting==true) image(ApacheWarriorUpSwing, coordinateX*20+10, coordinateY*20+10);
        }
      }

      if (FighterType==Spearman)
      {
        //Still Costumes
        if (moving==false && fighting==false)
        {
          if (moving==false && costume==leftCostume && fighting==false) image(ApacheWarriorLeft, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==false) image(ApacheWarriorRight, coordinateX*20+10, coordinateY*20+10) ;
          else if (moving==false && costume==upCostume && fighting==false) image(ApacheWarriorUp, coordinateX*20+10, coordinateY*20+10) ;
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
          if (moving==false && costume==leftCostume && fighting==true) image(ApacheWarriorLeftSwing, coordinateX*20+10, coordinateY*20+10);
          else if (moving==false && costume==rightCostume && fighting==true) image(ApacheWarriorRightSwing, coordinateX*20+10, coordinateY*20+10);  
          else if (moving==false && costume==upCostume && fighting==true) image(ApacheWarriorUpSwing, coordinateX*20+10, coordinateY*20+10);
        }
      }
    }
  }

  void mousePressed()
  {
    if (mouseX==coordinateX && mouseY==coordinateY && mousePressed)
    {
      touch=assignNum;
    }
    if (mouseRelease) touch=-1;
    if (mouseRelease==false && mouseDrag && touch!=-1)
    {
      if (touch==assignNum)PlayerFighter.add(new Allies(X1, Y1, touch));
    }
  }


  void walking()
  {
    // CleanUp();
    if (startupAmount<PlayerFighter.size())
    {
      //Cleaner
      /*for (int clean=startupAmount; clean<PlayerFighter.size(); clean++)
       {
       if (clean+1<PlayerFighter.size()-1)
       {
       Allies ally1 = (Allies) PlayerFighter.get(clean);
       Allies ally2 = (Allies) PlayerFighter.get(clean + 1);
       if (ally1.mouseXpoint == ally2.mouseXpoint && ally1.mouseYpoint == ally2.mouseYpoint && ally1.assignNumCoordinate== ally2.assignNumCoordinate)
       {
       PlayerFighter.remove(clean);
       }
       }
       }
       //Removes Mistouch
       for (int t=0; t<startupAmount; t++) {
       Allies ClearAgain = (Allies) PlayerFighter.get(startupAmount);
       Allies ClearCorrect = (Allies) PlayerFighter.get(t);
       if (ClearAgain.mouseXpoint==ClearCorrect.coordinateX && ClearAgain.mouseYpoint==ClearCorrect.coordinateY && ClearAgain.assignNumCoordinate!=ClearCorrect.assignNum) {
       PlayerFighter.remove(startupAmount);
       }
       }
       for (int d=0; d<Unpassable.size(); d++) {
       UnablePass noPass = (UnablePass) Unpassable.get(d);
       if (startupAmount < PlayerFighter.size()) {
       Allies ClearAgain = (Allies) PlayerFighter.get(startupAmount);
       if (ClearAgain.mouseXpoint==noPass.x && ClearAgain.mouseYpoint==noPass.y) {
       println(ClearAgain.mouseXpoint);
       PlayerFighter.remove(startupAmount);
       }
       }
       }*/
      //Fill in Points
      for (int go=0;go==0 && startupAmount+1<PlayerFighter.size();)
      {
        Allies allies3 = (Allies) PlayerFighter.get(startupAmount);
        Allies allies4 = (Allies) PlayerFighter.get(startupAmount+1);
        if (allies3.assignNumCoordinate!=allies4.assignNumCoordinate) go=1;
        if (abs(allies3.mouseXpoint-allies4.mouseXpoint)<=1 && abs(allies3.mouseYpoint-allies4.mouseYpoint)<=1 && allies3.assignNumCoordinate==allies4.assignNumCoordinate) go=1;
        if (abs(allies3.mouseXpoint-allies4.mouseXpoint)>1 || abs(allies3.mouseYpoint-allies4.mouseYpoint)>1)
        { 
          clearedX=true;
          clearedY=true;
          if (allies3.assignNumCoordinate==allies4.assignNumCoordinate && go==0) {
            for (int listNumclone=startupAmount+1;listNumclone<PlayerFighter.size();)
            {
              Allies alliescloned = (Allies) PlayerFighter.get(listNumclone);
              PlayerFighter1.add(new Cloned(alliescloned.mouseXpoint, alliescloned.mouseYpoint, alliescloned.assignNumCoordinate));
              PlayerFighter.remove(listNumclone);
            }


            if (abs(allies3.mouseXpoint-allies4.mouseXpoint)>1)
            {
              Ycount=0;
              for (int clearX=0; clearX==0;)
              {
                Allies allies1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                Cloned allies2 = (Cloned) PlayerFighter1.get(0);
                if (allies1.mouseXpoint-allies2.mouseXpoint>1 ) PlayerFighter.add(new Allies(allies1.mouseXpoint-1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                if (allies1.mouseXpoint-allies2.mouseXpoint<-1 ) PlayerFighter.add(new Allies(allies1.mouseXpoint+1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                for (int t=0; t<startupAmount; t++) {
                  Allies ClearAgain = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                  Allies ClearCorrect = (Allies) PlayerFighter.get(t);
                  if (ClearAgain.mouseXpoint==ClearCorrect.coordinateX && ClearAgain.mouseYpoint==ClearCorrect.coordinateY && ClearAgain.assignNumCoordinate!=ClearCorrect.assignNum) {
                    PlayerFighter.remove(PlayerFighter.size()-1);
                    PlayerFighter.add(new Allies(allies1.mouseXpoint, allies1.mouseYpoint+1, allies1.assignNumCoordinate));
                    clearedX=false;
                    Ycount++;
                  }
                  else {
                    clearedX=true;
                  }
                }
                for (int d=0; d<Unpassable.size(); d++) {
                  UnablePass noPass = (UnablePass) Unpassable.get(d);
                  if (startupAmount < PlayerFighter.size()) {
                    Allies ClearAgain = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                    if (ClearAgain.mouseXpoint==noPass.x && ClearAgain.mouseYpoint==noPass.y) {
                      PlayerFighter.remove(PlayerFighter.size()-1);
                      PlayerFighter.add(new Allies(allies1.mouseXpoint, allies1.mouseYpoint+1, allies1.assignNumCoordinate));
                      clearedX=false;
                    }
                    else {
                      clearedX=true;
                    }
                  }
                }
                if (abs(allies1.mouseXpoint-allies2.mouseXpoint)<=1 && clearedX==true) clearX=1;
              }
            }

            if (abs(allies3.mouseYpoint-allies4.mouseYpoint)>1)
            {
              for (int clearY=0; clearY==0;)
              {
                Allies allies1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                Cloned allies2 = (Cloned) PlayerFighter1.get(0);
                if (allies2.mouseYpoint-allies1.mouseYpoint>1) PlayerFighter.add(new Allies(allies1.mouseXpoint, allies1.mouseYpoint+1, allies1.assignNumCoordinate));
                if (allies2.mouseYpoint-allies1.mouseYpoint<-1 ) PlayerFighter.add(new Allies(allies1.mouseXpoint, allies1.mouseYpoint-1, allies1.assignNumCoordinate));
                for (int t=0; t<startupAmount; t++) {
                  Allies ClearAgain = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                  Allies ClearCorrect = (Allies) PlayerFighter.get(t);
                  if (ClearAgain.mouseXpoint==ClearCorrect.coordinateX && ClearAgain.mouseYpoint==ClearCorrect.coordinateY && ClearAgain.assignNumCoordinate!=ClearCorrect.assignNum) {
                    PlayerFighter.remove(PlayerFighter.size()-1);
                    PlayerFighter.add(new Allies(allies1.mouseXpoint+1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                    clearedY=false;
                  }
                  else {
                    clearedY=true;
                  }
                }
                for (int d=0; d<Unpassable.size(); d++) {
                  UnablePass noPass = (UnablePass) Unpassable.get(d);
                  if (startupAmount < PlayerFighter.size()) {
                    Allies ClearAgain = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                    if (ClearAgain.mouseXpoint==noPass.x && ClearAgain.mouseYpoint==noPass.y) {
                      PlayerFighter.remove(PlayerFighter.size()-1);
                      PlayerFighter.add(new Allies(allies1.mouseXpoint+1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                      clearedY=false;
                    }
                    else {
                      clearedY=true;
                    }
                  }
                }
                if (abs(allies1.mouseYpoint-allies2.mouseYpoint)<=1 && clearedY==true) clearY=1;
              }
            }
            if (go==0)
            {
              for (int t=0;PlayerFighter1.size()>0;)
              {
                Cloned alliescloned = (Cloned) PlayerFighter1.get(t);
                PlayerFighter.add(new Allies(alliescloned.mouseXpoint, alliescloned.mouseYpoint, alliescloned.assignNumCoordinate));
                PlayerFighter1.remove(t);
              }
            }
          }
        }
      }
    }
  }

  void RealWalking()
  {
    //Actual Movement
    CleanUp();
    if (startupAmount<PlayerFighter.size() && timer1>=5)
    {
      for (int a=0; a<startupAmount; a++)
      {
        Allies allies3 = (Allies) PlayerFighter.get(startupAmount);
        Allies allycheck = (Allies) PlayerFighter.get(a);
        if (allies3.assignNumCoordinate == allycheck.assignNum)
        {
          check=a;
        }
      }
      timer1=0;
      Allies allies1 = (Allies) PlayerFighter.get(startupAmount);
      Allies allies2 = (Allies) PlayerFighter.get(check);
      if (allies1.mouseXpoint-allies2.coordinateX>=1 && allies1.assignNumCoordinate == allies2.assignNum) allies2.costume=rightCostume;
      if (allies1.mouseXpoint-allies2.coordinateX<=-1 && allies1.assignNumCoordinate == allies2.assignNum) allies2.costume=leftCostume;
      if (allies1.mouseYpoint-allies2.coordinateY<=-1 && allies1.assignNumCoordinate == allies2.assignNum) allies2.costume=upCostume;
      if (allies1.mouseYpoint-allies2.coordinateY>=1 && allies1.assignNumCoordinate == allies2.assignNum) allies2.costume=leftCostume;
      if (allies1.assignNumCoordinate == allies2.assignNum)
      {
        if (moving=true)
        {
          moving=false;
        }
        else if (moving==false)
        {
          moving=true;
        }
        allies2.coordinateX=allies1.mouseXpoint;
        allies2.coordinateY=allies1.mouseYpoint;
        moved=true;
      }


      //Fighting
      for (int a=0; a<OpposingFighter.size() && moved==true; a++)
      {
        Enemies enemy = (Enemies) OpposingFighter.get(a);
        if (allies2.StartFightR==false && allies2.StartFightL==false && allies2.StartFightU==false && allies2.StartFightD==false)
        {
          if (abs(allies2.coordinateX-enemy.coordinateX)==1 || abs(allies2.coordinateY-enemy.coordinateY)==1) {
            if (allies2.coordinateX-enemy.coordinateX==-1 && allies2.coordinateY==enemy.coordinateY)
            {   
              allies2.moving=false;
              allies2.costume=rightCostume;
              allies2.StartFightL=true;
              allies2.cleaning=true;
              allies2.OppNum=a;
            }
            if (allies2.coordinateX-enemy.coordinateX==1 && allies2.coordinateY==enemy.coordinateY)
            {

              allies2.moving=false;
              allies2.costume=leftCostume;
              allies2.StartFightU=true;
              allies2.cleaning=true;
              allies2.OppNum=a;
            }
            if (enemy.coordinateY-allies2.coordinateY==-1 && allies2.coordinateX==enemy.coordinateX)
            {

              allies2.moving=false;
              allies2.costume=upCostume;
              allies2.StartFightR=true;
              allies2.cleaning=true;
              allies2.OppNum=a;
            }
            if (enemy.coordinateY-allies2.coordinateY==1 && allies2.coordinateX==enemy.coordinateX)
            {

              allies2.moving=false;
              allies2.costume=leftCostume;
              allies2.StartFightD=true;
              allies2.cleaning=true;
              allies2.OppNum=a;
            }
            for (int b=startupAmount; b<PlayerFighter.size() && cleaning==true && startupAmount+1<=PlayerFighter.size()-1; b++)
            {
              Allies allieschecking = (Allies) PlayerFighter.get(startupAmount+1);
              if (allies2.assignNum==allieschecking.assignNumCoordinate)
              {
                PlayerFighter.remove(b);
              }
              if (b==PlayerFighter.size()-1) cleaning=false;
            }
          }
        }
      }
      PlayerFighter.remove(startupAmount);
    }
  }

  void Fighting()
  {
    if (StartFightL || StartFightR || StartFightU || StartFightD)
    {
      timer3++;
      if (timer3>=5 ) {
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

    Allies allies2 = (Allies) PlayerFighter.get(check);
    if (allies2.OppNum<1000) {
      Enemies enemycheck= (Enemies) OpposingFighter.get(allies2.OppNum);
      Damage=allies2.attack-enemycheck.defense;
      enemycheck.life-=Damage;
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
    //Cleaner
    for (int clean=startupAmount; clean<PlayerFighter.size(); clean++)
    {
      if (clean+1<PlayerFighter.size()-1)
      {
        Allies ally1 = (Allies) PlayerFighter.get(clean);
        Allies ally2 = (Allies) PlayerFighter.get(clean + 1);
        if (ally1.mouseXpoint == ally2.mouseXpoint && ally1.mouseYpoint == ally2.mouseYpoint && ally1.assignNumCoordinate== ally2.assignNumCoordinate)
        {
          PlayerFighter.remove(clean);
        }
      }
    }
    //Removes Mistouch
    for (int t=0; t<startupAmount; t++) {
      if (startupAmount < PlayerFighter.size())
      {
        Allies ClearAgain = (Allies) PlayerFighter.get(startupAmount);
        Allies ClearCorrect = (Allies) PlayerFighter.get(t);
        if (ClearAgain.mouseXpoint==ClearCorrect.coordinateX && ClearAgain.mouseYpoint==ClearCorrect.coordinateY && ClearAgain.assignNumCoordinate!=ClearCorrect.assignNum) {
          PlayerFighter.remove(startupAmount);
        }
      }
    }
    for (int d=0; d<Unpassable.size(); d++) {
      UnablePass noPass = (UnablePass) Unpassable.get(d);
      if (startupAmount < PlayerFighter.size()) {
        Allies ClearAgain = (Allies) PlayerFighter.get(startupAmount);
        if (ClearAgain.mouseXpoint==noPass.x && ClearAgain.mouseYpoint==noPass.y) {
          PlayerFighter.remove(startupAmount);
        }
      }
    }
  }

  void startup()
  {
    for (int x=PlayerFighter.size(); x<0; x--)
    {
      Allies ally = (Allies) PlayerFighter.get(x);
      PlayerFighter.remove(x);
    }
    /*coordinateX=startX;
     coordinateY=startY;*/
  }
}


