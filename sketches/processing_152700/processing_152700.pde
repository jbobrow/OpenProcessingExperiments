
pitch = 4;

void setup(){
  size(350,350);
  background(0);
  strokeWeight(15);
}

void draw(){
  //fill(0,15);
  fill(0,255)
  rect(-5,-5,width+5, height+5);
  translate(width/2, height/2);
  rotate(frameCount/24.0f);
  for(float i = 0; i < 3 * TWO_PI; i += 0.03){
    float r = pitch * norm(i,0,360);
    float x = i * 7 * cos(i);
    float y = i * 7 * sin(i);
    stroke(255);
    point(y, x);
  }
}


 
