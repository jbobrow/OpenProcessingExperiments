
float xpos = 0;
float ypos = 600;
float xposx = 0;
float yposy = 0;


void setup () {
  size (600,600);
  
 
}
void draw (){
loop ();
goup();
godown ();
}


void goup()
{

fill (0,0,0,1);
rect(0,0,width,height);
noStroke();
fill(255,102,0);
ellipse (xpos,ypos,50,50);
ellipse ((xpos)+300,ypos,50,50);

xpos =random(150) ;
ypos -- ;

if(ypos > 0)
{
  ypos --;
}else{
  ypos=600;
}}


void godown()
{
fill (0,0,0,4);
rect(0,0,width,height);
noStroke();
fill(51,204,255);
ellipse (xposx,yposy,50,50);
ellipse ((xposx)+300,yposy,50,50);

xposx = random(150)+150;
yposy ++; 

if(yposy > 600)
{
  yposy = 0;
}else{
  yposy ++;
}}

  




