
float r;
float t,d;
int posX;
int posY;
float incremento;
float x1,x2;
float y1,y2;
float x3,x4;
float y3,y4;
color c;

public class cicloide{
    
  cicloide(float raggio,int posizioneX, int posizioneY, color colore){
    r = raggio;
    t= 0.0;
    d= 0.0;
    posX = posizioneX;
    posY = posizioneY;
    incremento = +0.05;
    c= colore;
  }
  
  void display(){
       for(int i = 0; i<=120*Math.PI; i++){
          
         stroke(c);
          x1=  posX-(r*(t-sin(t)));
          y1=  posY-(r*(1-cos(t)));
          t = t-incremento;
          x2=  posX-(r*(t-sin(t)));
          y2=  posY-(r*(1-cos(t)));
          line(x1, y1,x2,y2);
          
          stroke(c);
          x3=  posX+(r*(d-sin(d)));
          y3=  posY+(r*(1-cos(d)));
          d = d+incremento;
          x4=  posX+(r*(d-sin(d)));
          y4=  posY+(r*(1-cos(d)));
          line(x3, y3,x4,y4);
          
      }
  }
}  

