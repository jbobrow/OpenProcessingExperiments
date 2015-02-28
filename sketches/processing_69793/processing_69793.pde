
PFont tipo;

char[] name={'R','a','f','a','e','l'};        

void setup()
{
  size (220,90);
  tipo=loadFont("SansSerif.bolditalic-48.vlw");
  }
       
void draw()
{
  float x=int(random(10,300));
  float y=int(random(20,350));
  float x1=int(random(30,350));
  float y1=int(random(40,350));
  float x2=int(random(0,400));
  float y2=int(random(0,350));
  float x3=int(random(0,400));
  float y3=int(random(0,350));
  float x4=int(random(0,400));
  float y4=int(random(0,350));
  float x5=int(random(0,400));
  float y5=int(random(0,350));
 
  background(#10DF63);
  textFont(tipo,50);
  if((x!=150) && (y!=350))
  {
    text(name[0],x,y);
    text(name[1],x1,y1);
    text(name[2],x2,y2);
    text(name[3],x3,y3);
    text(name[4],x4,y4);
    text(name[5],x5,y5);
    }          
  else
  {
    text(name[0],20,60);
    text(name[1],60,60);
    text(name[2],90,60);
    text(name[3],110,60);
    text(name[4],140,60);
    text(name[5],175,60);
    noLoop();
    }
}


