
  class pelota{
  int posx_int, posy_int, radio_int;
        
        
        pelota(int posx, int posy, int radio){
        ellipse(posx,posy,radio,radio);
        posx_int=posx;
        posy_int=posy;
        radio_int=radio;
        
        }
        
        intcolorear(int color){
        fill(color);
        ellipse(posx_int, posy_int, radio_int);
        }
           };
           
        
        
        pelota Balon;
        void setup(){
        size(900,450);
          background(0);
        Balon = new pelota(100,100,20);
        smooth();
        
        nostroke();
        }
        void draw(){
        if (dir==0)
        
        }
