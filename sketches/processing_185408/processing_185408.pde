
int verde = 255;
int tiempo  = 0;
int diametro = 50;

void setup(){
  size (1000,400);
  }
  
  void draw(){
    verde = verde - 1;
    tiempo = tiempo+1;
    verde = int(128 * (1+ sin(tiempo * 2 * PI/ frameRate/ 20)));
    diametro = int(35 * (1+ sin(tiempo * 2 * PI/ frameRate/ 5)));
    
    noStroke();
    fill(mouseX,mouseY,mouseX,100);
    ellipse(mouseX,mouseY,diametro, diametro);
  }
  
