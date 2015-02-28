
          
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

boolean firstTime = true;

void setup()
{
  
smooth();
size (900,450);
background(0);
frameRate(175);

 }
 
//--------------

void draw()
{
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {
      if(firstTime==false)
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
    fill(0,0,0,10);
    rect(0,0,width,height);
  }
  if(frameCount%120==0 && false )
  {
    fill(0,0,0,30);
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
ellipse( 2, mouseY,mouseX,mouseY);
int b= T2; //-----rect-------
noFill();
rect( 0,mouseY, mouseX/8,mouseY/8 );
/*int c = T3; //-----curve------
noFill();
stroke(255, 0, 0);
curve(5, 26, 5, 26, 73, 24, mouseX*2, mouseY*2);*/
int d = T4;
disegnaLinea( d*D, 100 );
int e = T5;
disegnaLinea( e*E, 220 );
int f = T6;
disegnaLinea( f*F, 90 );
int g = T7;
disegnaLinea( g*G, 120 );
int h = T8;
disegnaLinea( h*H, 145 );
int i = T9;
disegnaLinea( i*I, 180 );
}
//--------------
void disegnaLinea( float angolo, float lunghezza )
{
pushMatrix();
rotate(radians(random(90)));
stroke(100+sin(frameCount)*random(205),50+sin(frameCount*2*PI/3)*random(170),20+sin(frameCount*PI)*random(235));
strokeWeight(1);
stroke(mouseX,mouseY,mouseX-mouseY);
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
 Gig();
}
void mouseReleased()
{
  firstTime=true;
}




                                    
