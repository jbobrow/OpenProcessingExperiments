
class Punkt
{
public float xx;
public float yy;
public float zz;
public color cc;
public int i=1;

Punkt( float pX, float pY, float pZ, color pC)
{
  xx=pX;
  yy=pY;
  zz=pZ;
  cc=pC; 
}

void render(){
  noStroke();
  fill(cc);
  ellipse(xx,yy,zz,zz);
  if (zz==190){
    i=-1;
  }
 if (zz==0){
  i=2;
  }
  zz=zz+i;
}
}

ArrayList allePunkte;
int altX, altY;

void setup(){
   size(800,400);
   allePunkte=new ArrayList();
//   allePunkte.add(new Punkt(400,200,0, 255));
   mouseX=400;
   mouseY=200;
}

void draw(){
     background(0);
     for (int i=0; i<allePunkte.size(); i++){
       Punkt p=(Punkt)allePunkte.get(i);
       p.render();
     }
//    delay(10);
    mousePressed();  

}

void mousePressed(){
  if (altX!=mouseX & altY!=mouseY & mouseX!=400 & mouseY!=200)
  {
  int s=allePunkte.size();
  if (s<200){
    if(s%2==1){
    allePunkte.add(new Punkt(mouseX, mouseY, 0, 0)); 
    }
    else{
    allePunkte.add(new Punkt(mouseX, mouseY, 0, 255));  
    }
  }
/*  else
  {
    Punkt anfang = (Punkt)allePunkte.get(0);
    for (int i=0; i<allePunkte.size()-1; i++)
    {
     Punkt tausch=(Punkt)allePunkte.get(i+1);
     allePunkte.set(i,tausch);
    }
    allePunkte.set(199, anfang);
  }*/
  altX=mouseX;
  altY=mouseY;
  }

}


