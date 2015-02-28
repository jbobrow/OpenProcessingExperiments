
//QUESTION 4

float angle=0;
float step=0.01;

void setup(){
  size(200,200);
  smooth();
  background(255,255,255);
}

void draw(){
  
  circle();
  spiral();
  atom();
}
  void circle(){
    float r = 75;
    float x = cos(angle) * r + width/2;
    float y = sin(angle) * r + height/2;
    point(x,y);
    angle += step;
}  
  
  void spiral(){
    float r = angle;
    float x = cos(angle) * r + width/2;
    float y = sin(angle) * r + height/2;
    point(x,y);
    angle += step;
}

  void atom(){
    float r = 75 * sin(angle*4);
    float x = cos(angle) * r + width/2;
    float y = sin(angle) * r + height/2;
    point(x,y);
    angle += step;
}

