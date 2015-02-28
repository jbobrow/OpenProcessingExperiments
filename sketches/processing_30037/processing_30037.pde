
Turtle tut;
int N = 4;
float d= 7/N;

void setup() {
 size(300,300);
 smooth();
 tut = new Turtle(15, 150);
 tut.turn(-60); // drejer "op" inden første start
 for(int side=0; side<6; side++){ // for loop løber seks gange
 //betyder seks sider i figur
 snowflake(N);
 tut.turn(60); //drejer "ned" inden næste side
  }
}

void snowflake(int N){
 if(N==0){ // exit condition 0
   tut.forw(d);
   }else{
     snowflake(N-1);
     tut.turn(60);
     snowflake(N-1);
     tut.turn(-120);
     snowflake(N-1);
     tut.turn(60);
     snowflake(N-1);  
}
 }
 
class Turtle {
  float posX;
  float posY;
  float angle=0; // in degrees;
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

