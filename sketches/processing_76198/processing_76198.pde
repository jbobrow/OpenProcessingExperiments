
//Hernandez Cruz Yanahui
//Torres Torres Felipe Andres
PImage foto;
int posx=-700,posy=-700;
void setup(){
foto=loadImage("girl.jpg");
size(500,500);
}
void draw(){
  background(0);
    if((posx!=0)&&(posy!=0)){
    image(foto,posx,posy);
    posx+=4;
    posy+=4;
    }
    else{
       image(foto,posx+90,posy+90);
     noLoop();
  }
}
