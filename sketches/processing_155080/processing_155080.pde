

int dim = 720;  //size of canvas dim x dim
int numGluons = 1500;    //Number of "gluons" to show
float diameter = dim/40;
float index=60; //starting value of background color
float red=0, green=0, blue=0;
float vindex=0.2;    //speed of background color change
boolean gored=true, gogreen=false, goblue=false;
Gluon[] gluons = new Gluon[numGluons];
Mousecircle mouse;

void setup() {
  size(dim*5/4,dim);  //square box
  background(0);  //background black
  stroke(255);    //Hairs are white
  for (int i=0; i<numGluons; i++){gluons[i] = new Gluon();}  //Creating all of the "gluons"
  mouse = new Mousecircle(diameter);
}

  void draw(){      //Draw command executes repeatedly

  //Coloring background, fading between red, green, blue one at a time
  if(index>125){vindex=-abs(vindex);}else if(index<1){vindex=abs(vindex);}
    index+=vindex;
    if(gored){red=index; if(index<1 && vindex<0){gored=false; gogreen=true; vindex=abs(vindex);}}
    if(gogreen){green=index; if(index<1 && vindex<0){gogreen=false; goblue=true; vindex=abs(vindex);}}
    if(goblue){blue=index; if(index<1 && vindex<0){goblue=false; gored=true; vindex=abs(vindex);}}
    
    background(red,green,blue);  //First, clear the screen of any existing drawings (basically the last frame)
    for(int i=0; i<numGluons;i++){gluons[i].move(diameter); gluons[i].display();}  //Draw each hair as specified in the hair's display command
//    mouse.display(diameter);    //draw the mouse bubble

  }

class Mousecircle{
  float diameter;
  int i;
  
  Mousecircle(float diameter){
  }

  void display(float diameter){
    fill(0,0,255,100); noStroke(); ellipse(mouseX,mouseY,diameter,diameter);  //Drawing mousecircle
  }

}

//The class "Gluon" defines all gluon characteristics, properties, & physics
class Gluon{
  float xi, yi;
  float vi, vxi, vyi;
  float theta, phi;
  float attract, damp, attractpow;
  boolean start;
  
  Gluon(){
  xi=dim/2; yi=dim/2;  //Initial coordinates
  vi=0.8;  //Initial speed
  theta=random(0,2*PI);
  vxi=vi*cos(theta); vyi=vi*sin(theta);  //Initial velocity direction
  attract=500;
  damp=0.0002;
  attractpow=1;  //power of 2 is Coulomb.
  start=false;
  }
  
  void move(float diameter){
    if(random(0,100)<(frameCount/500+0.5)*sin(frameCount/50)){start=true;}
    if(start){
      
      vxi-=vxi*damp; vyi-=vyi*damp;      //drag forces
      
      if(mousePressed){attractpow=0.75;}else{attractpow=1;}
      phi=atan2(mouseY-yi,mouseX-xi);    //Phi is angle to mouse
      if(pow(pow(mouseX-xi,2)+pow(mouseY-yi,2),0.5)>diameter/2){    //If the particle is outside the circle radius then attract, otherwise set v=0
        vxi+=attract/pow(pow(mouseX-xi,2)+pow(mouseY-yi,2),attractpow)*cos(phi);
        vyi+=attract/pow(pow(mouseX-xi,2)+pow(mouseY-yi,2),attractpow)*sin(phi);
      }else{vxi=0; vyi=0;}
      
      if(abs(vxi)>dim/500){vxi=vxi*0.95;}       if(abs(vyi)>dim/500){vyi=vyi*0.95;}

      xi+=vxi; yi+=vyi;
    }
  }
  
  void display(){
    stroke(255); fill(0);
    point(xi,yi);
  }
}
