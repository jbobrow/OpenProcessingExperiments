
class pelota{
pelota(int posx, int posy, int radio){
ellipse(posx, posy, radio, radio);
}
}

pelota balon;
void setup(){
size(200,200);
balon=new pelota(100,100,20);
smooth();
noStroke();

}

void draw(){
}


