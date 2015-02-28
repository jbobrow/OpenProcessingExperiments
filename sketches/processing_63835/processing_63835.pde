
float a;
float b;
float angle;
int posX;
int posY;
float incremento;
float x1,x2;
float y1,y2;
color c;

public class ipocicloide{
    
  ipocicloide(float raggioA, float raggioB,int posizioneX, int posizioneY, color colore){
    a = raggioA;
    b = raggioB;
    angle= 0.0;
    posX = posizioneX;
    posY = posizioneY;
    incremento = 0.05;
    c= colore;
  }
  
  void display(){
       for(int i = 0; i<=(a/b)*b*Math.PI; i++){
          stroke(c);
          x1=  posX+((a-b)*cos(angle) - b*cos(((a-b)/b)*angle));
          y1=  posY+((a-b)*sin(angle) + b*sin(((a-b)/b)*angle));
          angle = angle+incremento;
          x2=  posX+((a-b)*cos(angle) - b*cos(((a-b)/b)*angle));
          y2=  posY+((a-b)*sin(angle) + b*sin(((a-b)/b)*angle));
          line(x1, y1,x2,y2);
          
      }
  }
}  

