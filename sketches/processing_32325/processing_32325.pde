
void setup(){
size(510,510);
smooth();
frameRate(7.5);
}
void draw(){
for(int i=510; i>=0; i-=30){
  fill(random (0,255),random(0,255),random(0,255));
  ellipse(255,255,i-5,i-5);
//saveframe("i.jpg");
}
}

