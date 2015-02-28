
public class Branch   
{ 
  public int aa;
  public int bb; 
  public int aax;
  public int aay;
  public int bbx;
  public int bby;
  public int ccx;
  public int ccy;
  public int cc;
  public int dd;
  
  public int nrflori;
  
  public ArrayList <Flower> flowers1;     //retine florile de pe crac
 

  //trebuie adaugat timpul peste tot
                
  public Branch(int aa, int bb, int aax, int aay, int bbx, int bby, int ccx, int ccy, int cc, int dd) 
  {
   this.aa=aa;
   this.bb=bb;
   this.aax=aax;
   this.aay=aay;
   this.bbx=bbx;
   this.bby=bby;
   this.ccx=ccx;
   this.ccy=ccy;
   this.cc=cc;
   this.dd=dd;
   
   nrflori=-1;
   
   flowers1=new ArrayList <Flower>();            //fac 3 flori   
  
   
   int cxo=3*(aax-aa);  
   int bxo=3*(bbx-aax)-cxo;
   int axo=ccx-aa-cxo-bxo;
 
    int cyo=3*(aay-bb);
    int byo=3*(bby-aay)-cyo;
    int ayo=ccy-bb-cyo-byo;
    
    float var1=random(Detail/4,Detail);
    float var2=random(Detail/4,Detail);
    float var3=random(Detail/4,Detail);
    
    float to1=var1/float(Detail);
    float to2=var2/float(Detail);
    float to3=var3/float(Detail);
 
    float xo1=axo*pow(to1,3)+bxo*pow(to1,2)+cxo*to1+aa;         //fac 3 seturi de puncte
    float yo1=ayo*pow(to1,3)+byo*pow(to1,2)+cyo*to1+bb;
    
    float xo2=axo*pow(to2,3)+bxo*pow(to2,2)+cxo*to2+aa;
    float yo2=ayo*pow(to2,3)+byo*pow(to2,2)+cyo*to2+bb;
    
    float xo3=axo*pow(to3,3)+bxo*pow(to3,2)+cxo*to3+aa;
    float yo3=ayo*pow(to3,3)+byo*pow(to3,2)+cyo*to3+bb;
    
    Flower f1;
    Flower f2;
    Flower f3;   
    
    f1=new Flower(int(xo1),int(yo1),int(random(60)),int(random(40)),"");                //am cate un arraylist pt fiecare set
    f2=new Flower(int(xo2),int(yo2),int(random(12,45)),int(random(2,12)),"");
    f3=new Flower(int(xo3),int(yo3),int(random(12,25)),int(random(2,12)),"");
    
    flowers1.add(f1);
    flowers1.add(f2);
    flowers1.add(f3);
  }  
   
   
  
   public void drawBranch(int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) 
  { 
    for (int i=0;i<Detail;i++)                                    //metoda de desenare a unei crengi
    {
    float t=i/float(Detail);
    
   int cx=3*(x1-x0);
   int bx=3*(x2-x1)-cx;
   int ax=x3-x0-cx-bx;
 
   int cy=3*(y1-y0);
   int by=3*(y2-y1)-cy;
   int ay=y3-y0-cy-by;
 
   float x=ax*pow(t,3)+bx*pow(t,2)+cx*t+x0;
   float y=ay*pow(t,3)+by*pow(t,2)+cy*t+y0;
    
   strokeWeight((300-i)/7);
    
   point(x,y);
    }
    
   for(int i=0;i<=nrflori;i++)                                     //desenez pe creanga creata toate florile de pe ea. goale de text
    {
       Flower f=flowers1.get(i);
       if(f.msg.length()!=0)
       {
         if((mousePressed)&&(mouseButton==LEFT)&&((f.xbranch-f.r1)<=mouseX)&&((f.xbranch+f.r1)>=mouseX)&&((f.ybranch-f.r1)<=mouseY)&&((f.ybranch+f.r1)>=mouseY))
        {
         textFont(ff);                                           //se afiseaza textul
         textSize(20);
         noFill();
         stroke(0);
         textAlign(LEFT);
         
         text(f.msg,80,120);
         
        }
        
        else
        
          {
        stroke(0);
        noFill();
        
        f.drawFlower(f.xbranch,f.ybranch,f.r1,f.r2,f.msg);
          }
      }
     }
  }
  
   public void addmsg(String mess)
   { 
     nrflori++;
     Flower f=flowers1.get(nrflori);
     f.settext(mess);
   }
  }  
   
  
  
 

