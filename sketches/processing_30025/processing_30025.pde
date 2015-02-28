
//QUESTION 5

Turtle tut;
int N = 4;

void setup() {
background(255,255,255);  
size(300,300);
smooth();
tut = new Turtle(15,150);
tut.turn(-60);
for(int side=0; side<6; side++){
snowflake(N); 
tut.turn(60);
}
}

void snowflake(int N){

  if (N == 1){ //if N equals 1 the lines will be drawn and the process stops
    int Length = 5; //defines the length of the individual lines
    tut.down(); 
    tut.forw(Length); 
    tut.up(); 
  }
  else
  {
    snowflake(N - 1); 
    tut.turn(60);     
    snowflake(N - 1);
    tut.turn(240);
    snowflake(N - 1);
    tut.turn(60); 
    snowflake(N - 1);
  //Minuses 1 from N and rotates untill N = 1
  }
}



class Turtle {
  float posX;
  float posY;
  float angle; // in degrees;
  boolean isDrawing = true;
  
  Turtle(float x, float y){
    posX = x;
    posY = y;
  }

  void forw(float d) {
    float dx= posX + cos(radians(angle))*d;
    float dy= posY + sin(radians(angle))*d;
    if (isDrawing)
      line(posX,posY, dx, dy);
    posX = dx;
    posY = dy;
  }

  void turn(float a) {
    angle += a;
  }

  void up() { 
    isDrawing = false;
  }

  void down() {
    isDrawing = true;
  }
}

