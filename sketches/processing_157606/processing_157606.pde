
void setup(){
  size(700,700);
  colorMode(HSB,360,1,1);
  noStroke();
}
float t=0;
float coef = 100;
int div=3;
int count;
void draw(){
  count = int((height-mouseY)/float(height)*100);
   fill(0,100);
  rect(0,0,width,height);
  translate(width/2,height/2);
  fill(0,100);
  t+=mouseX/float(width)*4;
   for(float i=0;i<=360;i+=360/float(count)){
    thing(i);
  }
}
float f(float x,int div){
  return sin(radians(div*x));
}
void thing(float offset){
  pushMatrix();
  rotate(radians(offset));
  fill(offset,1,1);
  ellipse(0,coef*f(t+offset,div)+coef*3/2,10,10);
  popMatrix();
}
void keyPressed(){
  switch(key){
    case '1': div = 1; break;
    case '2': div = 2; break;
    case '3': div = 3; break;
    case '4': div = 4; break;
    case '5': div = 5; break;
    case '6': div = 6; break;
    case '7': div = 7; break;
    case '8': div = 8; break;
    case '9': div = 9; break;
  }
}



