
//Sound effect mouse
import ddf.minim.*;
AudioPlayer player;
Minim minim;

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
//float J = PI/130
//float K = PI/80
//float L = PI/45
//-------



void setup()
{
smooth();
size (960,600);
background(0);
minim = new Minim(this);
player = minim.loadFile("click1.wav", 2048);
  }
 
//--------------

void draw()
{
translate(mouseX,mouseY);

//clear bottom
if(keyPressed){
if(key == 'e' | key == 'E'){
background (0);
}
 }
  }
//Gig();//mouseMoved

//--------------
void Gig ()
{
int T1 = (mouseY)/4;
int T2 = (mouseY);
int T3 = (mouseY)%4;
int T4 = (mouseY)%4;
int T5 = (mouseY)%4;
int T6 = (mouseX)%4;
int T7 = (mouseX);
int T8 = (mouseX);
int T9 = (mouseX);

//----------
int a = T1;
disegnaLinea( a*A, 60 );
int b = T2;
disegnaLinea( b*B, 60 );
int c = T3;
disegnaLinea( c*C, 60 );
int d = T4;
disegnaLinea( d*D, 60 );
int e = T5;
disegnaLinea( e*E, 80 );
int f = T6;
disegnaLinea( f*F, 100 );
int g = T7;
disegnaLinea( g*G, 120 );
int h = T8;
disegnaLinea( h*H, 140 );
int i = T9;
disegnaLinea( i*I, 160 );
/*int j = T10;//----ellipse----
noFill();
ellipse( 4, mouseY,mouseX/4,mouseY/4 );

/*int k = T11;//-----rect-------
noFill();
rect( 0,mouseY, mouseX/8,mouseY/8 );*/

/*int l = T3;//------curve------
noFill();
stroke(255, 0, 0);
curve(5, 26, 5, 26, 73, 24, mouseX*2, mouseY*2);*/

}
//--------------
void disegnaLinea( float angolo, float lunghezza )
{
pushMatrix();
rotate( angolo-HALF_PI );
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
 player.play(); 
 player.loop(1);
 Gig();
}

 
 




