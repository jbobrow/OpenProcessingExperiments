
Pacman b; //declarar objeto
  
  
void setup () {
  background (255);
size (1000,700);
b = new Pacman (-5, 15, 15,15, 255);

  
noStroke();
}
  
void draw (){
    
  b. update();
  b.display();

  
}
  
//clase
  
class Pacman {
    
  float xpos;
  float ypos;
  float radius;
  float alto;
  int rojo;
 int verde;
int azul;
float boca1;
float boca2;
    
  Pacman (float x, float y, float r, float b1, int b2) { //constructor
   
xpos = x;
ypos = y;
radius = r;

boca1 = b1;
boca2 = b2;

  
  }
    
  void update (){
    xpos = xpos + 17;
    ypos = ypos +0;
    rojo = rojo + int (random (-5,5));
    verde = verde + int (random (-5,5));
    azul =azul + int (random (-5,5));
      
    if (xpos >= 1000) {
      xpos = -5;
      ypos = ypos +17;
    }
      
   
      
      
    if (ypos >= 700) {
      ypos = 15;
    }
      
    if (ypos <= 0) {
      ypos = random(1,999);
    }
      
  }
   
   
    
  void display (){
    fill (rojo, verde, azul);
    arc (xpos, ypos, radius, radius,boca1,boca2);
  }
}
