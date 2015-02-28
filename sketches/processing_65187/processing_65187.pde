
void setup(){
size(500,500);
background(0);
}

void draw(){
background(0);
for(int i =0;i<500;i+=5){
  for(int j=0;j<500;j+=5){
float distance = abs(mouseX - i);
float distance2=abs(mouseY-j);
fill(distance,distance2,100);
noStroke();
ellipse(i,j,20,20);
}
}
}
