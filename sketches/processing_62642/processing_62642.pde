
void setup() {
size(400,400);
frameRate(60); //GESCHWINDIGKEIT AUSGEBE AKTUELLE FRAMERATE PRINTLN(FRAMERATE);
}

float x = 0;
float speed = 200;
float acceleration = 3;

void draw(){
  background(200);
  speed += acceleration / frameRate;
  
  if( x > width || x < 0){
    speed = -speed;
  }
    x = x + speed/frameRate;
    line(x,0,x,height);
    
}
