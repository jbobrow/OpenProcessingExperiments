
int rectW;
int rectH;

void setup(){
  size(800,800);
  rectMode(CENTER);

rectW = 60;
rectH = 60;

}

void draw(){
  background(0,0,0);
  noStroke();
for(int i=1; i<7; i++){
  rect(width/7*i, height/7, rectW, rectH);
}
for(int i=1; i<6; i++){
  rect(width/6*i, height/6, rectW, rectH);
}
for(int i=1; i<5; i++){
  rect(width/5*i, height/5, rectW, rectH);
}
for(int i=1; i<4; i++){
  rect(width/4*i, height/4, rectW, rectH);
}
for(int i=1; i<3; i++){
  rect(width/3*i, height/3, rectW, rectH);
}
for(int i=1; i<2; i++){
  rect(width/2*i, height/2, rectW, rectH);
}
if (mousePressed){
  rectW=90;
}
else{
  rectW=60;
}
if (mousePressed){
  rectH=90;
}
else{
  rectH=60;
}

}

