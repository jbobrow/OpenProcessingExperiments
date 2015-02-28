
int counter;
class Pelota{
Pelota (int posx, int posy, int radio){
ellipse (posx, posy, radio, radio);
posx_int=posx
posy_int=posy; radio_int=radio;
}
Colorear (int color){
fill (color);
ellipse(posx_int, posy_int, radio_int, radio_int);
}
};
int count=0, dir=0;
Pelota Balon;
Void setup(){
size(800,800); background(14,183,152);
Balon = new Pelota (100,100,20);
smooth();
nostroke();
}
void draw(){
if (dir==0){
Balon.colorear (count);
count++;
if(count==255) dir=1;
}

