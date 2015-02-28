
void setup(){
size(400,400);
background(0);
}

void draw(){
for(int i=0;i<width;i+=5){
for(int j=0;j<height;j+=5){
  rect(i,j,5,5);
  fill(random(255),random(255),random(255));  
  stroke(255);
}
}
}
