
import processing.opengl.*;
import javax.media.opengl.*;

void mouseScrolled()
{
  hamlib.mouseScrolled();
}
void keyPressed()
{
  if(key=='t')
  {
    test.v=1.0; 
  }
  if(key=='g')
  {
    test.v=-1.0; 
  }
  if(key=='f')
  {
    test.a+=0.2; 
  }
  if(key=='h')
  {
    test.a-=0.2; 
  }
  hamlib.keyPressed();
}
void mouseMoved()
{
  hamlib.mouseMoved();
}
void mouseReleased()
{
  hamlib.mouseReleased();
}
void mouseDragged()
{
  hamlib.mouseDragged();
}
void mousePressed()
{
  hamlib.mousePressed();
}
void hsim_Draw(Obj o)
{
  image(im[o.type],-o.s/2,-o.s/2,o.s,o.s);
}
int goods=1,bads=1;
void hsim_Interact(Obj i,Obj j)
{
  if(i.type==0 && j.type==1)
  {
    i.acc=1.0;
    goods++;
  }
  if(i.type==0 && j.type==2)
  {
    i.acc=-1.0;
    bads++;
  }
  if(j.type==1 || j.type==2)
  {
    j.x=random(1)*width;
    j.y=random(1)*height;
  }
}
int Hsim_eyesize=3; //9
float[] viewField=new float[Hsim_eyesize*2];

void hsim_ObjectTask(Obj oi)
{
  oi.v=0;
  if(oi.type==2)
  {
    if(random(1)>0.5)
    {
      mem.ProcessingInteract(oi.x,oi.y,1.0,2.0);
    }
    oi.a+=0.05f;
  }
  if(oi.hai!=null)
  {
    for(int i=0;i<viewField.length;i++)
    {
      viewField[i]=0;
    }
    int maxIndex=hamlib.MinMaxFrom(oi.visarea).MaxIndex;
    boolean Had=false;
    for(int i=0;i<oi.visarea.length;i++)
    {
      if(i==maxIndex)
      {
        if(oi.visareatype[i]==2)
        {
          viewField[i]=oi.visarea[i];
          Had=true;
        }
        if(oi.visareatype[i]==3)
        {
          viewField[i+Hsim_eyesize]=oi.visarea[i];
          Had=true;
        }
      }
    }
    int action=oi.hai.UpdateSOM(viewField,oi.acc);
    if(!Had)
    {
     action=0; 
    }
    if(action==2)
    {
      oi.a+=0.5;
      oi.v=10.0;
      mem.ProcessingInteract(oi.x,oi.y,1.0,10.0);
    }
    else
    if(action==1)
    {
      oi.a-=0.5;
      oi.v=10.0;
      mem.ProcessingInteract(oi.x,oi.y,1.0,10.0);
    }
    else
    if(action==0)
    {
      oi.v=10.0;
      mem.ProcessingInteract(oi.x,oi.y,1.0,10.0);
    }
    if(oi.x>width)
    {
      oi.x=0;
    }
    if(oi.x<0)
    {
      oi.x=width;
    }
    if(oi.y>height)
    {
      oi.y=0;
    }
    if(oi.y<0)
    {
      oi.y=height;
    }
    oi.acc=0.0;
  }
}
Obj lastclicked=null;
void hsim_ElemClicked(Obj i)
{
  if(lastclicked!=null)
  {
    lastclicked.DrawField=false;
  }
  lastclicked=i;
}
void hsim_ElemDragged(Obj i)
{
  mem.ProcessingInteract(i.x,i.y,1.0,3.0);
}
void hrend_DrawGUI()
{
  fill(0);
  text("viewfield and RF-Rewards:",20,20);
  //test.DrawViewFields(20,30,10);
  test.hai.Draw(20,30,2);
}
void hrend_DrawBegin()
{
  label1.text="opti index:"+((float)goods)/((float)bads)+ "FPS:"+frameRate;
  fill(138,138,128);
  pushMatrix();
  if(hamlib.Mode==hamlib.Hamlib3DMode)
  {
    translate(0,0,-2);
  }
  rect(0,0,width,height);
  popMatrix();
  //mem.DrawForProcessing(0.0f,0.0f,0.0f,0.01f,true);
}
void hrend_DrawEnd()
{
  fill(0);
  text("Hamlib simulation system demonstration",0,-5);
  stroke(255,255,255);
  line(0,0,width,0);
  line(width,height,width,0);
  line(width,height,0,height);
  line(0,0,0,height);
  noStroke();
  if(lastclicked!=null)
  {
    fill(255,0,0);
    rect(lastclicked.x,-20,5,20);
    rect(-20,lastclicked.y,20,5);
    rect(lastclicked.x,height+20,5,-20);
    rect(width+20,lastclicked.y,-20,5);
    lastclicked.DrawField=true;
    pushMatrix();
    if(hamlib.Mode==hamlib.Hamlib3DMode)
    {
      translate(0,0,1);
    }
    ellipse(lastclicked.x,lastclicked.y,10,10);
    popMatrix();
  }
}
void hgui_ElemEvent(Gui i)
{
}
class Hsim_Custom
{
}
int nactions=3;
int worldSize=800;
PImage[] im=new PImage[10];
Gui label1;
Obj test;
WaveMembran mem=new WaveMembran(100);
void setup()
{
  mem.simulate_consistency=0.05;
  mem.simulate_damping=0.90;
  size(worldSize-200,worldSize-200);
  hamlib.Init(false);
  im[0]=loadImage("agent.png");
  im[1]=loadImage("food.png");
  im[2]=loadImage("fire.png");
  for(int i=0;i<1;i++)
  {
    int SomSize=10;
    Hai h=new Hai(nactions,SomSize);
    h.som=new Hsom(SomSize,Hsim_eyesize*2);
    h.som.Leaky=false;
    test=new Obj(new Hsim_Custom(),h,(int)(random(1)*(double)width),(int)(random(1)*(double)height),random(1)*2*PI-PI,random(1),0,0,random(1)*5+20,0,Hsim_eyesize);
    hsim.obj.add(test);
  }
  lastclicked=((Obj)hsim.obj.get(0));
  for(int i=0;i<5;i++)
  {
    hsim.obj.add(new Obj(null,null,(int)(random(1)*(double)width),(int)(random(1)*(double)height),random(1)*2*PI,0,0,0,random(1)*5+20,1,10));
  }
  for(int i=0;i<5;i++)
  {
    hsim.obj.add(new Obj(null,null,(int)(random(1)*(double)width),(int)(random(1)*(double)height),random(1)*2*PI,0,0,0,random(1)*5+20,2,10));
  }
  hsim.viewdist=width/5; //4
  label1=new Gui(0,height-25,width,25, "label1", "", false);
  hgui.gui.add(label1);
}
void draw()
{
  hamlib.Update(128,138,128);
  //mem.simulate(0);
}



