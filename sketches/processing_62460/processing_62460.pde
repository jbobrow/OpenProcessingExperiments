
void setup(){
size(400,400,P3D);
}
void draw(){
  float x=mouseX;
  for(float y=5; y<1000; y+=10){
    box(100);
    translate(x,y,-70);
    fill(2*x,70,70);
    }
}



