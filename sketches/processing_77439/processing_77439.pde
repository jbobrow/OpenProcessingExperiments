
void setup(){
size(640,480);
  background(75, 200, 75);
  }
  
  
int deplacementX=3;
int x=100;
int deplacementY=-3;
int y=250;


void draw(){
  background(75, 200, 75);

    for(int yc=0; yc<400; yc=yc+80){
    for(int z=0; z< 640; z=z+130){
      cochon(75+z+random(2),30+yc+random(2));
    }  
 }

 x+=deplacementX;     
 y+=deplacementY;
 jenbom(x,y);
fermier(560, 380);
 
 if ( x<85 || x-5>width) {
    deplacementX= -deplacementX; //inverse le déplacement
  }
  //vertical : rebondir sur côté haut ou bas?
  if ( y<215 || y-125>height) {
    deplacementY= -deplacementY;
    }
 graine(mouseX,mouseY);
} 
 





