
int x;
int y;
int azul=0;
int yellow=0;
int black=0;
int red=0;
int green=0;
void setup(){
  
  size(850,500);

smooth();
strokeWeight (20);
noFill();

}

void draw(){
x=int(random(850));
y=int(random(500));
  background(255);

stroke(0,00,200,180);
if((x!=200) && (y!=200) && azul!=1){

ellipse(x,y,200,200);
}
else
{
  ellipse(200,200,200,200);
  azul=1;
}

stroke(250,225,0,200);
if((x!=320) && (y!=300) && yellow!=1){
ellipse(x,y,200,200);
}
else
{
  ellipse(320,300,200,200);
  yellow=1;;
}

stroke(0,0,0,200);
if((x!=430) && (y!=200) && black!=1){
ellipse(x,y,200,200);
}
else
{
  ellipse(430,200,200,200);
  black=1;
}

stroke(250,0,0,200);
if((x!=660) && (y!=200) && red!=1){
ellipse(x,y,200,200);
}
else
{
  ellipse(660,200,200,200);
  red=1;
}

stroke(0,250,0,200);
if((x!=550) && (y!=300) && green!=1){
ellipse(x,y,200,200);
}
else
{
  ellipse(550,300,200,200);
  green=1;
}
}

