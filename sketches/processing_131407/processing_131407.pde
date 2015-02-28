
int j=80;
int k=0;
boolean nachRechtsGelaufen=true;

void setup(){
  size(600,600);
}

void draw(){
  background(mouseX,mouseY,0);
  
  //ZÃ�ï¿½HLSCHLEIFE
  // for(INITIALISIERUNG; FORTSETZUNGSBEDINGUNG; INKREMENT)ANWEISUNGSBLOCK
 /* for(int i=0;i<10;i++){
    rect(100+20*i+j,100+k,10,10);
  }*/
  Rechteck R1=new Rechteck(100,100,100,100); 
  fill(200,0,0);
  //WENN der Mauszeiger M(mouseX|mouseY) rechts unter der linken oberen Ecke und links oberhalb der
  //rechten unteren Ecke des Rechtecks ist, dann:
  int xKoordinateDerLinkenOberenEckeVomRechteck=100+20+j;
  int yKoordinateDerLinkenOberenEckeVomRechteck=100+k;
  int xKoordinateDerRechteUntereEckeVomRechteck=100+20+j+50;
  int yKoordinateDerRechteUntereEckeVomRechteck=100+k+50;
  if(mouseX>xKoordinateDerLinkenOberenEckeVomRechteck){
      if(mouseY>yKoordinateDerLinkenOberenEckeVomRechteck){
          if(mouseX<xKoordinateDerRechteUntereEckeVomRechteck){
              if(mouseY<yKoordinateDerRechteUntereEckeVomRechteck){
                  fill(255);
                   if(nachRechtsGelaufen){
                    j=j+3;
                   }else{
                    j=j-3;
                   }
             }
          }
          
      }
  }
  rect(xKoordinateDerLinkenOberenEckeVomRechteck,yKoordinateDerLinkenOberenEckeVomRechteck,50,50);
  
  //IF-CLAUSE (Bedingte Verzweigung)
  //if(BEDINGUNG)ANWEISUNGSBLOCK
  if(j>200){
    nachRechtsGelaufen=false;
    k=k+10;
  }
  if(j<80){
    k=k+10;
    nachRechtsGelaufen=true;
  }
  fill(100);
//  rect(mouseX-10,mouseY-10,20,20,3);
}

public class Rechteck{
    public int Breite;
    public int Hoehe;
    public int x0;
    public int y0;
    public void setzePosition(int xNeu, int yNeu){
        x0=xNeu;
        y0=yNeu;
    }
    public void draw(){
        rect(x0,y0,Breite,Hoehe);
    }
    public boolean mouseOver(){
        if(mouseX>x0){
            if(mouseY>y0){
                if(mouseX<x0+Breite){
                    if(mouseY<y0+Hoehe){
                        return true;
                    }
                }
            }
        }
        //sonst:
        return false;
    }
    public Rechteck(int xPos,int yPos,int w,int h){ //Konstruktor: ACHTUNG kein RÃ�CKGABETYP
        setzePosition(xPos,yPos);
        Breite=w;
        Hoehe=h;
    }
}
