
size(400,400);
/*for(i400nt i=10;i<=1000;i+=50){
  for (int j=10;j<=1000;j+=50){
    float r=random(400);
    float m=random(400);
    float n=random(1000);
    fill(m,r,j,n);
    stroke(m,j,r,i);
    ellipse(i,r,j,m);
  }
}*/
/*background(0,0,0);*/
void draw(){
for(int i=10;i<=1000;i+=10){
  for (int j=10;j<=1000;j+=10){
    float r=random(400);
    float m=random(400);
    float n=random(0,255);
    fill(m,r,j,n);
    stroke(m,j,r,i);
    triangle(i,r,j,m,i,j);
  }
}
}
