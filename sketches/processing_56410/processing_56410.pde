
class Allies
{
  float coordinateX, coordinateY;
  int mouseXpoint, mouseYpoint;
  int X, Y;
  int startX, startY;
  boolean fighting=false;
  int assignNum, assignNumCoordinate;
  int life;
  boolean touch;
  boolean moving=false;
  int listNum=startupAmount+1;
  int check=0;
  int upwalking=11;
  int upCostume=12;
  int upCostumeAtt=13;
  int leftCostume=14;
  int leftwalking=15;
  int leftCostumeAtt=16;
  int rightCostume=17;
  int rightwalking=18;
  int rightCostumeAtt=19;
  int costume=leftCostume;
  int timer=0;
  Allies(int a, int b, int hp, int assign, boolean touch)
  {
    startX=a;
    startY=b;
    life=hp;
    assignNum=assign;
    touch=touch;
  }

  Allies(int m, int n, int assignNum)
  {
    mouseXpoint=m;
    mouseYpoint=n;
    assignNumCoordinate=assignNum;
  }
  void show()
  {
    if (moving==false && costume==leftCostume && fighting==false) image(ApacheWarriorLeft, coordinateX*20+10, coordinateY*20+10);
    else if (moving==true && costume==leftwalking && fighting==false) ;
    else if (moving==false && costume==leftCostume && fighting==true) image(ApacheWarriorLeftSwing, coordinateX*20+10, coordinateY*20+10) ;
  }

  void mousePressed()
  {
    listNum=startupAmount+1;
    if (X1==coordinateX && Y1==coordinateY && mousePress && lock==false && mouseDrag)

    {
      for (int x=0; x<startupAmount-1; x++)
      {
        Allies allies = (Allies) PlayerFighter.get(x);
        allies.touch=false;
      }
      touch=true;
    }
    if (touch==true)
    {
      PlayerFighter.add(new Allies(X1, Y1, assignNum));
    }
  }


  void walking()
  {
    timer++;
    if (startupAmount<PlayerFighter.size() && listNum<=PlayerFighter.size() && timer==3)
    {
      for (int clean=startupAmount; clean<PlayerFighter.size()-1; clean++)
      {
        if (clean+1<PlayerFighter.size()-1)
        {
          Allies ally1 = (Allies) PlayerFighter.get(clean);
          Allies ally2 = (Allies) PlayerFighter.get(clean + 1);
          if (ally1.mouseXpoint == ally2.mouseXpoint && ally1.mouseYpoint == ally2.mouseYpoint)
          {
            PlayerFighter.remove(clean);
          }
        }
      }
      timer=0;
      for (int go=0; go==0 && listNum+1<PlayerFighter.size();)
      {
        Allies allies3 = (Allies) PlayerFighter.get(listNum);
        Allies allies4 = (Allies) PlayerFighter.get(listNum+1);
        if (abs(allies3.mouseXpoint-allies4.mouseXpoint)<=1 && abs(allies3.mouseYpoint-allies4.mouseYpoint)<=1) go=1;
        if (abs(allies3.mouseXpoint-allies4.mouseXpoint)>1 || abs(allies3.mouseYpoint-allies4.mouseYpoint)>1 || abs(allies3.mouseXpoint-allies4.mouseXpoint)>1 && abs(allies3.mouseYpoint-allies4.mouseYpoint)>1)
        {
          for (int listNumclone=listNum+1; listNumclone<PlayerFighter.size();)
          {
            Allies alliescloned = (Allies) PlayerFighter.get(listNumclone);
            PlayerFighter1.add(new Cloned(alliescloned.mouseXpoint, alliescloned.mouseYpoint, alliescloned.assignNumCoordinate));
            PlayerFighter.remove(listNumclone);
          }
        }

        if (abs(allies3.mouseXpoint-allies4.mouseXpoint)>1)
        {
          for (int clearX=0; clearX==0;)
          {
            for (int q=0; clearX==0; q++)
            {
              if (q==0)
              {
                Cloned allies2 = (Cloned) PlayerFighter1.get(0);
                Allies allies1 = (Allies) PlayerFighter.get(listNum);
                if (allies1.mouseXpoint-allies2.mouseXpoint>1 && q==0) PlayerFighter.add(new Allies(allies1.mouseXpoint-1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                if (allies1.mouseXpoint-allies2.mouseXpoint<-1 && q==0) PlayerFighter.add(new Allies(allies1.mouseXpoint+1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                if (abs(allies1.mouseXpoint-allies2.mouseXpoint)<=1) clearX=1;
              }
              if (q>0)
              {
                println("b");
                Allies allies1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                Cloned allies2 = (Cloned) PlayerFighter1.get(0);
                if (allies1.mouseXpoint-allies2.mouseXpoint>1 && q>0) PlayerFighter.add(new Allies(allies1.mouseXpoint-1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                if (allies1.mouseXpoint-allies2.mouseXpoint<-1 && q>0) PlayerFighter.add(new Allies(allies1.mouseXpoint+1, allies1.mouseYpoint, allies1.assignNumCoordinate));
                if (abs(allies1.mouseXpoint-allies2.mouseXpoint)<=1) clearX=1;
              }
              if (clearX==1) continue;
            }
            if (clearX==1) continue;
          }
        }
        if (abs(allies3.mouseYpoint-allies4.mouseYpoint)>1)
        {
          for (int clearY=0; clearY==0;)
          {
            for (int p=0; clearY==0; p++)
            {
              if (p==0)
              {

                Cloned allies2 = (Cloned) PlayerFighter1.get(0);
                Allies allies1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                if (allies1.mouseYpoint-allies2.mouseYpoint>1 && p==0) PlayerFighter.add(new Allies(allies1.mouseXpoint, allies1.mouseYpoint-1, allies1.assignNumCoordinate));
                if (allies1.mouseYpoint-allies2.mouseYpoint<-1 && p==0) PlayerFighter.add(new Allies(allies1.mouseXpoint, allies1.mouseYpoint+1, allies1.assignNumCoordinate));
                if (abs(allies1.mouseYpoint-allies2.mouseYpoint)<=1) clearY=1;
              }
              if (p>0)
              {
                println("c");
                Allies allies1 = (Allies) PlayerFighter.get(PlayerFighter.size()-1);
                Cloned allies2 = (Cloned) PlayerFighter1.get(0);
                if (allies1.mouseYpoint-allies2.mouseYpoint>1 && p>0) PlayerFighter.add(new Allies(allies1.mouseXpoint-1, allies1.mouseYpoint-1, allies1.assignNumCoordinate));
                if (allies1.mouseYpoint-allies2.mouseYpoint<-1 && p>0) PlayerFighter.add(new Allies(allies1.mouseXpoint+1, allies1.mouseYpoint+1, allies1.assignNumCoordinate));
                if (abs(allies1.mouseYpoint-allies2.mouseYpoint)<=1) clearY=1;
              }
              if (clearY==1) continue;
            }
            if (clearY==1) continue;
          }
        }
        for (int t=0;PlayerFighter1.size()>t;t++)
        {
          Cloned alliescloned = (Cloned) PlayerFighter1.get(t);
          PlayerFighter.add(new Allies(alliescloned.mouseXpoint, alliescloned.mouseYpoint, alliescloned.assignNumCoordinate));
          PlayerFighter1.remove(t);
        }
      }



      if (listNum<PlayerFighter.size())
      {
        for (int a=0; a<=startupAmount; a++)
        {
          Allies allies3 = (Allies) PlayerFighter.get(listNum);
          Allies allycheck = (Allies) PlayerFighter.get(a);
          if (allies3.assignNumCoordinate == allycheck.assignNum)
          {
            check=a;
            continue;
          }
        }

        Allies allies1 = (Allies) PlayerFighter.get(listNum);
        Allies allies2 = (Allies) PlayerFighter.get(check);

        if (allies1.assignNumCoordinate == allies2.assignNum)
        {
          /*if (costume==leftCostume)
           {
           costume==leftwalking;
           }
           else if (costume==leftwalking)
           {
           costume=leftCostume;
           }*/
          allies2.coordinateX=allies1.mouseXpoint;
          allies2.coordinateY=allies1.mouseYpoint;
        }
        PlayerFighter.remove(listNum);
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
    coordinateX=startX;
    coordinateY=startY;
  }
}


