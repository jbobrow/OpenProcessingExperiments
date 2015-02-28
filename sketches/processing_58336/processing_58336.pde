

class pelota{
    int 
     pelota (int palx,int paly,int radio){
          ellipse(palx,paly,radio,radio);
          }
    int colorear (int color){
               fill(color);
               ellipse(palx,paly,radio,radio);
     }    
          }
          pelota balon;
    void setup(){
         size(400,400);
         backgrond(0);
         balon= new pelota(200,200,50);
         smooth();
         
    }
