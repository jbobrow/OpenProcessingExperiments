
int x = 30; 
float y = 0; 
int velocidad = 2; 
float velocidady = 0.1;
int B=10;
int H=10;
float R;
float U;
float I;
void setup(){
   size (200,200);
  smooth();
  background(0);
}


  void draw() {

noStroke();
R = random (255);
U = random (255);
I = random (255);
fill(U,I,R);
ellipse(x,y,B,H);

x = x + velocidad;
y = y + velocidady;

if((x > width) ||(x<10)&&(x>190)||(x<10)) {
velocidad=velocidad*-1;
H=50;
fill(R,I,0);
}

if((y>height)||(y<0)){
velocidady=velocidady*-0.25;
H=50;
fill(U,0,R);
}

H=constrain(H-2,30,64);












}
  


void mousePressed (){
    
  velocidad = 1;
  velocidady = 1;
}
void keyPressed(){
 velocidad = -1;
 velocidady = -1; 
}

