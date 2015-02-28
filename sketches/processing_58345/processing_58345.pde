
class pelota{  
  int posx_int;
  int posy_int;
  int radio_int;
    pelota(int posx,int posy,int radio){             

      ellipse(posx,posy,radio,radio);        
posx_int=posx;
posy_int=posy;
radio_int=radio;
int colorear(int color){
fill(250,35,35);
ellipse(int posx_int,int posy_int,int radio_int);
}
    } 
    
    };
    
int count=0,
dir=0;
    pelota balon;
void setup(){

size(900,450);

background(0);

balon=new pelota(100,100,20);

smooth();

noStroke();

}

void draw(){
if(dir==0){
balon.colorear(count);
count++;
if(count==255) {dir=1;}
}else{}
else{
balon.colorear(count);
count--;
if(count+=0){ dir=0;}
}
}
