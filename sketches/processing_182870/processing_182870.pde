
size(300,300);
background(65,20,69);

for (int i=0; i<=300; i+=30){
  for (int j=0; j<=300; j+=30){
    fill(34,i,j,5);
    noStroke();
    rectMode(CORNER);
    rect(0,0,i,j);
  }
}
for (int i=0; i<300; i+=30){
  for (int j=0; j<300; j+=30){
    float r=random(300);
    float m=random(500);
    float b=random(300);
    float l=random(500);
    float q=random(150);
    float e=random(255);
    float w=random(255);
    stroke(255,w,e,q);
    line(150,0,i,j);
    line(150,300,i,j);
    line(0,150,i,j);
    line(300,150,i,j);
    line(0,0,i,j);
    line(300,0,i,j);
    line(0,300,i,j);
    line(300,300,i,j);
  }
}
