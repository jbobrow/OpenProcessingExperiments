
size(800,800);
for (int i=0; i<800; i+=5) {
  for(int j=0; j<800; j+=5){
    float r=random(400);
    float m=random(400);
    float k=random(400);
    if(j>=400) {fill(r-200,m-200,k-200);}
    else {fill(r,m,k);}
    triangle(i+m,j,i-3,j+r,i+7,j+2);
  }
}
