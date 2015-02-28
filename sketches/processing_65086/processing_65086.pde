

import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics.behaviors.*;

import toxi.volume.*;
import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import peasy.*;



boolean ko=false;
boolean voxelallow=false;
ArrayList Punkt=new ArrayList();
ArrayList Linie=new ArrayList();
ArrayList choose=new ArrayList();
ArrayList Flaeche=new ArrayList();
boolean reception,Lauf=false;
float Nord=1;
float REST_LENGTH;
float STRENGTH=0.125;
int pcount=0,scount=0;
boolean cat=true,Setupgrowthpoint=true;
float ca=7;

void setup()
{
  size (1280, 700, P3D);
  REST_LENGTH=gro;
  initPhysics();
  gfx = new ToxiclibsSupport(this);
  setupGUI ();
  smooth();
  strokeWeight (1);
  stroke(255);
  Dog.add (new attractor(-s13/2, s13/2));
  Cat.add (new earthpoint(s13/2, s13/2));
  Donkey.add (new Growthpoint(0, 0)); 
  Fish.add (new Boundary(0, 0)); 
  
  setupCamera ();
}
void draw()
{


  
  ///////////////
  int Acount=0,Bcount=0,Ccount=0;
  reception=true;
  Vec3D Cpunkt=new Vec3D();
  background (0);
  float counterboard;
  drawCamera ();
  Vec3D Npunkt=new Vec3D (-sin(Npa)*s13/2,cos(Npa)*s13/2,0);

  //////////////
  if (Lauf==true)
  {
    if (Setupgrowthpoint)
    {
      for (int i =0; i < Donkey.size (); i=i+1)
      {
        Growthpoint b = (Growthpoint)Donkey.get (i);
        if (b.run)
        {
          Vec3D A = new Vec3D (b.A, b.B, 0);
          Punkt.add (new onepoint (A));
          VerletParticle Ap=new VerletParticle (A);
          pcount++;
          Vec3D B = new Vec3D (b.A+gro, b.B, 0);
          Punkt.add (new onepoint (B));
          VerletParticle Bp=new VerletParticle (B);
          pcount++;
          Vec3D C = new Vec3D (b.A+gro/2, gro/2*sqrt(3)+b.B, 0);
          Punkt.add (new onepoint (C));
          VerletParticle Cp=new VerletParticle (C);
          pcount++;
          
          physics.addParticle(Ap);
          physics.addParticle(Bp);
          physics.addParticle(Cp);
          physics.addSpring(new VerletSpring(Ap,Bp,REST_LENGTH,STRENGTH));
          physics.addSpring(new VerletSpring(Cp,Bp,REST_LENGTH,STRENGTH));
          physics.addSpring(new VerletSpring(Cp,Ap,REST_LENGTH,STRENGTH));
          
          Linie.add (new twopoint(A, B));
          scount++;
          Linie.add (new twopoint(B, C));
          scount++;
          Linie.add (new twopoint(C, A));
          scount++;
          
          threepoint erstf=new threepoint (A,B,C);
          erstf.pc1=0;
          erstf.pc2=1;
          erstf.pc3=2;
          Flaeche.add (erstf);
        }

      }
      
      Setupgrowthpoint=!Setupgrowthpoint;
    }
    
    choose=new ArrayList();
    for(int i=0;i<Linie.size();i=i+1)
    {
      twopoint a = (twopoint)Linie.get (i);
      if(a.counterChilds==1)
      {
        choose.add (a);
      }
    }
    int numtmp1= int (random ( choose.size ()));
    twopoint b = (twopoint)choose.get (numtmp1);
    twopoint MyLinie = (twopoint)Linie.get (b.sc);

//    int numtmp1= int (random ( Linie.size ()));
//    twopoint MyLinie = (twopoint)Linie.get (numtmp1);
//    println(scount);
    
    /////////////richtungcontroler
    if  (MyLinie.counterChilds<2)
    {
    //////////////////////
      for(int i=0;i<Flaeche.size();i=i+1)
      {
        threepoint a=(threepoint)Flaeche.get(i);
        if (MyLinie.A.distanceTo(a.A)<3||MyLinie.A.distanceTo(a.B)<3||MyLinie.A.distanceTo(a.C)<3)
        {
          if (MyLinie.B.distanceTo(a.A)<3||MyLinie.B.distanceTo(a.B)<3||MyLinie.B.distanceTo(a.C)<3)
          {
            if (a.A!=MyLinie.A&&a.A!=MyLinie.B)
            {
              Cpunkt=new Vec3D (a.A.x,a.A.y,a.A.z);
            }
            else if (a.B!=MyLinie.A&&a.B!=MyLinie.B)
            {
              Cpunkt=new Vec3D (a.B.x,a.B.y,a.B.z);
            }
            else
            {
              Cpunkt=new Vec3D (a.C.x,a.C.y,a.C.z);
            }
          
          }
        }
      }
         /////////////////////
      Vec3D richtungsVektor1= MyLinie.A.sub(Cpunkt);
      Vec3D richtungsVektor2= MyLinie.B.sub(Cpunkt);
      Vec3D richtungsVektor3=richtungsVektor1.add(richtungsVektor2);
      Vec3D drittepunkt=richtungsVektor3.add(Cpunkt);
      ////////////////////////
      boolean ifinside=false;
      for (int i =0; i < Fish.size (); i=i+1)
      {
        Boundary c = (Boundary)Fish.get (i);
        Vec3D d=new Vec3D(c.A,c.B,0);
        if (drittepunkt.distanceTo(d)<=c.R)
        {
          ifinside=true;
        }
      }

      if (ifinside)
      {
        for(int i=0;i<Punkt.size();i=i+1)
        {
          onepoint a=(onepoint)Punkt.get(i);
          if (a.A.distanceTo(MyLinie.A)<1||a.A.distanceTo(MyLinie.B)<1||a.A.distanceTo(drittepunkt)<1)
          {
            whichone(drittepunkt);
            Boundary btemp=(Boundary)Fish.get (which);
            Npunkt=new Vec3D (-sin(btemp.Npp)*btemp.R+btemp.A,cos(btemp.Npp)*btemp.R+btemp.B,0);
            float d= a.A.distanceTo(Npunkt);
            counterboard=map(d,0,2*btemp.R,4,7);
            if (a.counterChilds>counterboard-1)
            {
              reception=false;
            }
          }
        }
      /////////////////////
//      println(reception);
        if (reception==true)
        {
          MyLinie.counterChilds++;
          for(int i=0;i<Punkt.size();i=i+1)
          {
            onepoint a=(onepoint)Punkt.get(i);
            if (a.A.distanceTo(MyLinie.A)<1||a.A.distanceTo(MyLinie.B)<1||a.A.distanceTo(drittepunkt)<ca)
            {
              a.counterChilds++;
              if (a.A.distanceTo(drittepunkt)<ca)
              {
                drittepunkt=a.A;
              }
              if(a.A.distanceTo(MyLinie.A)<1)
              {
                Acount=a.pc;
              }
              if(a.A.distanceTo(MyLinie.B)<1)
              {
                Bcount=a.pc;
//                println(Bcount);
              }
            //println(a.counterChilds);
            }
          }
          
          //////////////
//          Vec3D a1=new Vec3D(MyLinie.A.x,MyLinie.A.y,0);
//          Vec3D b1=new Vec3D(MyLinie.B.x,MyLinie.B.y,0);
//          Vec3D c1=new Vec3D(drittepunkt.x,drittepunkt.y,0);
          ///////////////
          
          int pp=0;
          for(int i=0;i<Punkt.size();i=i+1)
          {
            onepoint a=(onepoint)Punkt.get(i);
            if (a.A.distanceTo(drittepunkt)<1)
            {
              cat=false;
              pp=i;
              Ccount=i;

            }
          }
          VerletParticle App=physics.particles.get(Acount);
          VerletParticle Bpp=physics.particles.get(Bcount);
          if (cat)
          { 
            VerletParticle drittepunktp=new VerletParticle (drittepunkt);
            Punkt.add (new onepoint (drittepunkt));
            Ccount=pcount;
            pcount++;
            physics.addParticle(drittepunktp); 
            Linie.add (new twopoint(drittepunkt, MyLinie.A));
            scount++;
            physics.addSpring(new VerletSpring(App,drittepunktp,REST_LENGTH,STRENGTH));
            Linie.add (new twopoint(drittepunkt, MyLinie.B));
            scount++;
            physics.addSpring(new VerletSpring(Bpp,drittepunktp,REST_LENGTH,STRENGTH));
          }
          if (!cat)
          {
            cat=true;
            boolean addline=true;
            VerletParticle drittepunktp=physics.particles.get(pp);
            for(int i=0;i<Linie.size();i=i+1) 
            {
              twopoint MyLinie1 = (twopoint)Linie.get (i);
              if (MyLinie1.A.distanceTo(MyLinie.A)<1&&MyLinie1.B.distanceTo(drittepunkt)<1)
              {
                MyLinie1.counterChilds++;
                addline=false;
              }
              if (MyLinie1.B.distanceTo(MyLinie.A)<1&&MyLinie1.A.distanceTo(drittepunkt)<1)
              {
                MyLinie1.counterChilds++;
                addline=false;
              }
              
            }
            if (addline)
            {
              Linie.add (new twopoint(drittepunkt, MyLinie.A));
              scount++;
              physics.addSpring(new VerletSpring(App,drittepunktp,REST_LENGTH,STRENGTH));
            }
            addline=true;
            
            for(int i=0;i<Linie.size();i=i+1) 
            {
              twopoint MyLinie2 = (twopoint)Linie.get (i);
              if (MyLinie2.A.distanceTo(MyLinie.B)<1&&MyLinie2.B.distanceTo(drittepunkt)<1)
              {
                MyLinie2.counterChilds++;
                addline=false;
              }
              if (MyLinie2.B.distanceTo(MyLinie.B)<1&&MyLinie2.A.distanceTo(drittepunkt)<1)
              {
                MyLinie2.counterChilds++;
                addline=false;
              }
            }
            if (addline)
            {
              Linie.add (new twopoint(drittepunkt, MyLinie.B));
              scount++;
              physics.addSpring(new VerletSpring(Bpp,drittepunktp,REST_LENGTH,STRENGTH));
            }
          }
          threepoint newface=new threepoint (MyLinie.A,MyLinie.B,drittepunkt);
          newface.pc1=Acount;
          newface.pc2=Bcount;
          newface.pc3=Ccount;
          Flaeche.add (newface);
        
        } 
      }
    }
  }
  stroke (255);
  if (!hide)
  {
    for (int i =0; i < Dog.size (); i=i+1)
    {
      attractor b = (attractor)Dog.get (i);
      if (i==Listchoose)
      {
        b.C=false;
      }
      b.drawattractor ();
      b.C=true;
    }
    for (int i =0; i < Fish.size (); i=i+1)
    {
      Boundary b = (Boundary)Fish.get (i);
      if (i==Listchoose-90)
      {
        b.C=false;
      }
      b.drawboundary();
      b.C=true;      
    }
      for (int i =0; i < Cat.size (); i=i+1)
    {
      earthpoint b = (earthpoint)Cat.get (i);
      if (i==Listchoose-30)
      {
        b.C=false;
      }
      b.drawearthpoint ();
      b.C=true;
    }
      for (int i =0; i < Donkey.size (); i=i+1)
    {
      Growthpoint b = (Growthpoint)Donkey.get (i);
      if (i==Listchoose-60)
      {
        b.C=false;
      }
      b.drawgrowthpoint ();
      b.C=true;
    }
  }
  if (!voxelallow&&!ko){
    for (int i =0; i < Flaeche.size (); i=i+1)
    {
      threepoint b = (threepoint)Flaeche.get (i); 
      b.updatepos();
      lights();
      b.drawthreepoint ();
      noLights();
    }
  }
  
  //draw voxel
  if (voxelallow){
    if (wireallow){
      noFill();
      strokeWeight(0.1);
      stroke(255);
      gfx.mesh(mesh);
    }
    else {
      fill(255);
      noStroke();
      lights();
      gfx.mesh(mesh);
      noLights();
    }   
  }
  if (ko&&!voxelallow)
  {

    for(int i=0;i<Punkt.size();i=i+1)
    {
      onepoint a=(onepoint)Punkt.get(i);
      if (a.counterChilds<s3)
      {
        VerletParticle ptemp=physics.particles.get(a.pc);
        ptemp.x=a.x;
        ptemp.y=a.y;
        ptemp.z=0;
        ptemp.lock();
      }
      else
      {
        VerletParticle ptemp=physics.particles.get(a.pc);
        ptemp.unlock();
      }
    }
    
    for(Iterator i=physics.springs.iterator(); i.hasNext();) 
    {
      VerletSpring s=(VerletSpring)i.next();
//      s.setStrength(1);
      stroke(255);
      line(s.a.x,s.a.y,s.a.z,s.b.x,s.b.y,s.b.z);
    }
    for (int i =0; i < Flaeche.size (); i=i+1)
    {
      threepoint b = (threepoint)Flaeche.get (i); 
      b.updateparticle();
      lights();
      b.drawthreepoint ();
      noLights();
    }
    physics.update();
  }

  
drawGUI();
}

