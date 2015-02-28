
PImage naggau;PImage nagdr;PImage carton;PImage fyn;
float x1 = 186; float y1 = 586;
float x2 = 298; float y2 = 624;
float x3 = 246; float y3 = 706;
float irot = 0.001;float rot = 0;float dirot = 1;
float dirx = 1; 
float diry = -1; 
float d;
int ix2 = 1;int iy2 =0;
int w = 191; int h = w/4;
float idrx = 1;float idry = 0; 
int dirx2 = 1; int diry2 = 1;
  float alph = 128;int dira = 1;

void setup() {
  size(1000,800);
  background(240);
  imageMode(CENTER);
  carton = loadImage("carton.png");
  naggau = loadImage("naggau.gif");
  nagdr = loadImage("nagdr.gif");
  fyn = loadImage("fyn.gif");
}

void draw() {
  //frameRate(2);

  alph-=.3*dira;if(alph <= 0 || alph >= 128){ dira*=-1;}
  //tint(255,alph);
  image(carton,width/2,630);
  //noTint();
  
  if(frameCount >= 2){dessine();}
    image(naggau,x1,y1);
    image(nagdr,x2,y2); 
/*
float x1 = 186; float y1 = 586;
float x2 = 298; float y2 = 624;
float x3 = 246; float y3 = 706;
*/
  //incrémente rotation
  rot+= irot*dirot; 
  translate(x3, y3);
  rotate(rot);
  if(rot >= .2 ||rot <= -.2) { dirot*=-1;}



  image(fyn,0,0);

}

void dessine(){
     //deplace naggau
  x1 = x1+ix2*dirx;//ok
  y1 = y1+iy2*diry;

if( y1 >= 400 && x1 >= 450 && x1 <= 550 ){ix2 = 0;iy2 = 1;dirx*=-1;}
else{ ix2 = 1;}

if( x1 >= width-naggau.width/2 || x1 <= naggau.width/2){ dirx *=-1;}
if( y1 <= naggau.height/2 || y1 >= height+naggau.height/2){ diry *=-1;}

   //deplace nagdr
 x2= x2+idrx*dirx2;
 y2 = y2+idry*diry2;
 if(x2 >= 450 && x2 <= 550 && y2 >= 400){ idrx = 0;idry = 1; }
 else{ idrx = 1;}
 if(x2 >= width-nagdr.width/2 || x2 <= nagdr.width/2){ dirx2*=-1;}
 if(y2 <= nagdr.height/2 || y2 >= height+nagdr.height/2){ diry2*=-1;}



}

