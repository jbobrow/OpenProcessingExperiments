
void setup(){

size(200, 200);
background(0);
}

void draw(){
for (int i=35; i<170; i=i+25) {
  fill(i*i/70,90,40);
  noStroke();
  ellipse(i,60,40,40);
}
for(int i=-95; i<150; i=i+10){
stroke(255);
fill(255);
ellipse(i+100, i*i/120+100, 5, 5);
}
}
