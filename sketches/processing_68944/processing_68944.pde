

PFont font1;
int posX;
int incremento;
int letra;


void setup()
{
  
  size(1000,500);
  letra=1;
  font1=loadFont("Cracked-48.vlw");
  frameRate(10);
  posX=10;
  incremento=0;
}

void draw()
{
  background(0);
  fill(255,3,11); 
  String []letras=PFont.list();
  println(letras);
  font1=createFont(letras[letra],100);
  textFont(font1,incremento);
  text("Mirko Stroker", posX,500);
  
  letra=letra+1;
    incremento++;
    
    if (posX>1000){
    posX=10;
    incremento=0;
}


}

