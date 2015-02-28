

import peasy.*;
//----
PeasyCam cam; //initialisierung der Kamera
float h1=3,h2=10,h3=3;
ArrayList Aeste;
ArrayList Cplus;
branch sonbranch;//initialisierung  Arraylist
boolean Perception;
void setup()
{
  size (1280, 700, P3D);
  setupGUI ();
  stroke(84,45,99);
  Aeste = new ArrayList(); // 
  Cplus=new ArrayList();
  Perception=false;
  PVector AA = new PVector (0, 0, 0);
  PVector BB = new PVector (0, 20, 0);
  //println (AA);

  Aeste.add (new branch(AA, BB));//<----erster Ast
  setupCamera ();
}

void draw()
{
  background (0);
  drawCamera ();
  //box (40);
  int randomAst= int (random ( Aeste.size ()));
  branch MyBranch = (branch)Aeste.get (randomAst);
  branch Q = (branch)Aeste.get (randomAst);


  if  (MyBranch.counterChilds<h3){
    PVector StartPunkt = MyBranch.B;
    PVector Versatz = new PVector (random (-h2,h2),random (h2),random (-h2,h2));
    PVector EndPunkt = PVector.add (StartPunkt,Versatz);
    ///calcDist
    boolean countboard=false;
    PVector k=PVector.sub(StartPunkt,EndPunkt);
    if (k.mag()>5){
    for(int i=0;i<Aeste.size();i=i+1){
      branch z=(branch)Aeste.get(i);
      if (z.B!=StartPunkt){
        if(z.A!=StartPunkt){
          float juli=calcDist(z.A,z.B,StartPunkt,EndPunkt);
          if (juli<h1){countboard=true;
          } 
        }  
      }
    }
    }

    if (countboard==false){
      Aeste.add (new branch(StartPunkt, EndPunkt));
      Cplus.add (new branch(StartPunkt, EndPunkt));
      MyBranch.counterChilds++;
      Perception=true;
    }
    if (Perception=true){
      sonbranch=(branch)Aeste.get(Aeste.size()-1);
      for (int i=Aeste.size ()-1;i>=0 ;i=i-1){
        Q=(branch)Aeste.get(i);
          if (Q.B==sonbranch.A){
          Q.C++;
          sonbranch=(branch)Aeste.get(i);
           
        }
      }
    }
    Perception=false;
  }
  //display branches
  for (int i =0; i < Aeste.size (); i=i+1)
  {
    branch b = (branch)Aeste.get (i);
    colorMode(HSB,360,100,100);
    if (b.C<=200){
      stroke(84,45,110-b.C/2.5);
    }
    else if(b.C>200&&b.C<300){
      stroke(41,54,80-b.C/5);
    }
    else {
      stroke(41,54,20);
    }
    b.drawBranch ();
  }
  println (Aeste.size ());
  drawGUI();
}


