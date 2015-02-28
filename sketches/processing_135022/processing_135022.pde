
float a;
void setup(){
  size(640,360);
  stroke(255);
  a = height/3;
}
void draw(){
  background(50);
  line(20 + a,120,620 - a ,120);
  a = a + 0.5;
  if ( a > 280 ){
    a = 360-280;
  }
}

  
