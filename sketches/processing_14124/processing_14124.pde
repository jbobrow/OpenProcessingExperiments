
void setup(){
  size(400,400);
}


void draw(){
  background(255);
  noStroke();
  for (int x=0;x<400;x=x+80){
    float y=sin(radians(x+frameCount)*4)*40+200;
    fill(40,random(255),random(255));
    ellipse(200,200,x,y);
  }
  println(frameCount);
}
                
                
