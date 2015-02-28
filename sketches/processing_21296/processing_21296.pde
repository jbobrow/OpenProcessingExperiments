
//Sound effect mouse
import ddf.minim.*;
AudioPlayer player;
Minim minim;
float radius = 50.0;
int delay = 16;
boolean firstTime = true;
//--------------------
float A = PI/1;
float B = PI/72;
float C = PI/108;
float D = PI/184;
float E = PI/180;
float F = PI/216;
float G = PI/252;
float H = PI/288;
float I = PI/90;
//-------
void setup()
{
smooth();
size (960,640);
background(0);
frameRate(200);

//minim = new Minim(this);
//player = minim.loadFile("click1.wav", 2048);
  }
//--------------
void draw()
{
  if(mousePressed == true)
   {
    if(mouseButton == LEFT)
     {
      if(firstTime == false)
       {
       }else{
         firstTime=false;
      }
       }
        }
  
translate(mouseX,mouseY);
 rotate(radians(sin(frameCount)*360)); 
  if(frameCount%8==0)
  {
    fill(random(255),random(255),random(255),10);
    rect(0,0,width,height);
  }
  if(frameCount%120==0 && false )
  {
    fill(255,213,15,10);
    rect(0,0,width,height);
  }
//clear bottom
if(keyPressed == true ){
if(key == 'e' | key == 'E'){
 background (0);
}
 }
  }
//Gig(); //mouseMoved

//--------------
void Gig ()
{
int T1 = (mouseY)/4;
int T2 = (mouseY);
int T3 = (mouseY)/8;
int T4 = (mouseY)/2;
int T5 = (mouseY)/10;
int T6 = (mouseX)/6;
int T7 = (mouseX)/4;
int T8 = (mouseX)/2;
int T9 = (mouseX);

//----------

int a = T1; //----ellipse----
noFill();
stroke(random(255),random( 255),random(255));
ellipse( 2, mouseY/4,mouseX/4,mouseY/4);
//int b= T2; //-----rect-------
//fill();
//rect( 0,mouseY, mouseX/8,mouseY/8 );
/*int c = T3; //-----curve------
noFill();
stroke(255, 0, 0);
curve(5, 26, 5, 26, 73, 24, mouseX*2, mouseY*2);*/

int d = T4;
disegnaLinea( d*D, 10 );
int e = T5;
disegnaLinea( e*E, 20 );
int f = T6;
disegnaLinea( f*F, 90 );
int g = T7;
disegnaLinea( g*G, 20 );
int h = T8;
disegnaLinea( h*H, 45 );
int i = T9;
disegnaLinea( i*I, 80 );
}
//--------------
void disegnaLinea( float angolo, float lunghezza )
{
pushMatrix();
rotate(radians(random(90)));
stroke(100+sin(frameCount)*random(205),50+sin(frameCount*2*PI/3)*random(170),20+sin(frameCount*PI)*random(235));
strokeWeight(0.75);
stroke(random(255),random( 255),random(255));
line( 0,0, lunghezza,0 );
popMatrix();
}
//-------------
void mouseDragged()
{
  
  Gig();
 }
 //-------------
void mouseClicked()
{
// player.play(); 
 //player.loop(1);
 Gig();
}
void mouseReleased()
{
  firstTime=true;
}




