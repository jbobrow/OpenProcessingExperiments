
size(600,600);
for (int i=0; i<600; i+=5) {
  for(int j=0; j<600; j+=5){
    float r=random(400);
    float m=random(400);
    float k=random(400);
    if (j<=200) {fill(r,m,k);}
    else {if(j>200) {fill(r+90,m+90,k+90);}}
    if (j>400) {fill(r+200,m+200,k+200);}
    triangle(i+m,j,i-3,j+r,i+7,j+2);
  }
}

