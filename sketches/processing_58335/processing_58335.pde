
class pelota {
  int posx_int,posy_int,radio_int;
pelota (int posx, int posy, int radio){
ellipse (posx, posy, radio, radio);
posx_int=posx;
posy_int=posy;
radio_int=radio;
}
int colorear (int color){
fill (color);
ellipse (posx_int,posy_int,radio_int);
}
}
int count=0, dir=0;
pelota balon;
void setup(){
  size (600,300);
  background(0);
  balon= new pelota(100,200,20);
  smooth();
  noStroke();

}
void draw(){
if (dir==0){
balon.colorear (cout);
count++;
if(count==255)dir=1;
}
else{
balon.colorear(count);
count--;
if(count==0)dir=0;
}
}

