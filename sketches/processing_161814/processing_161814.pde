
int time1 = 10000;
int time2 = 15000;
int time3 = 25000;
float x = 0;
float angle = 0.0;
float offset = 60;
float scaler = 2;
float speed = 0.15;

void setup() {
  size(800, 600);
  background(0);
  stroke(255, 0, 0);
  smooth();
}

void draw(){
  int currentTime = millis();
  if (currentTime < time1) {
  float x = offset + cos(angle) * scaler;
  float y = offset + sin(angle) * scaler;
  ellipse( x + 250, y + 200 , 1, 1);    //red left circle
  ellipse( x + 400, y + 200 , 1, 1);   //red right circle
  angle += speed;
  scaler += speed;  
}
  
  else if (currentTime > time1)  {
  stroke(0, 0, 250);
  float x = offset + cos(angle) * scaler-100;
  float y = offset + sin(angle) * scaler-100;
  ellipse( x + 350, y + 300, 1, 1);
  ellipse( x + 500, y + 300, 1, 1); 
  angle += -speed;
  scaler += speed;
  }
  
   { 
  if (currentTime > time3){
    stroke(0, 250, 0);
    float x = offset + cos(angle) * scaler-200;
  float y = offset + sin(angle) * scaler-200;
    ellipse( x + 520, y + 400 , 2, 2);
    
}
  }
}


