
int posX;
int posY;

float distX;
float distY;
float R;
float G;
float B;

void setup () {

  size (500, 500);
  
  
 // background (255, 255, 255);

  posX = 0;

  posY = 0;
  
  R = 0;
  G = 0;
  B = 0;


  distX = 0;
  distY = 0;
  
  
}


void draw() {

noStroke();

fill(R%255,G%255,B%255, 1);

rect (0,0,width,height); 

stroke(10);

line (25, 25, pmouseX,pmouseY);

line (475,25, pmouseX, pmouseY);

line (475,475, pmouseX, pmouseY);


line  ( 25,475, pmouseX, pmouseY);
  
  
R++;
G++;
B++;



  }



