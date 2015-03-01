
int posx,posy;
int vel;
void setup(){
  size(300,300);
  vel =5;
  posx=0;
  posy=width/2;
}

void draw() {
 background(0);
 
 ellipse(posx,posy,20,20);
 
 posx += vel;
 
 if( posx<0 || posx> width){
   vel = -vel;
  }
  
}


