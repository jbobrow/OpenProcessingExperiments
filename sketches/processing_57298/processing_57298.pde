
//Curvas Bezier

void setup(){
noFill();
smooth();
size(500,400);
//bezier(0,0,width,0,width,height,0,height);
}
void draw(){
  //frameRate(1);
  float bla=frameCount/1000.0;

  background(0);
  stroke(random(200),random(201),random(202));
for(int i=1; i<20; i++){
bezier(width/2,height,noise(1,i,bla)*width,noise(5,i,bla)*height/2, noise(2,i,bla)*width, noise(3,i,bla)*height/2, noise(6,i,bla)*width, noise(8,i,bla)*height);

}
}
