
int num =20;
float step, sz, offSet, theta, angle;

void setup(){
  size(350,350);
  background(0);
  strokeWeight(5);
}

void draw(){
  fill(0,15);
  rect(-5,-5,width+5, height+5);
  translate(width/2, height/2);
  rotate(frameCount/10.0f);
  for(float i = 0; i < 4 * TWO_PI; i += 0.03){
    float x = i * 7 * cos(i);
    float y = i * 7 * sin(i);
    stroke(255);
    point(x, y);
  }
}


 
