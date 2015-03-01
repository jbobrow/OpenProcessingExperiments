
int pixel = 25;
size(400,400);
for (int i = 0; i < 400; i = i+pixel) {
  for (int j = 0; j < 400; j = j+pixel) {
    if(((i%2)==0)&&(j%2==0)){
    fill(255,255,255);
    rect(j, i, pixel, pixel);
    }
    if(((i%2)==1)&&(j%2==0)){
    fill(150,150,150);
    rect(j, i, pixel, pixel);
    }
    if(((i%2)==0)&&(j%2==1)){
    fill(150,150,150);
    rect(j, i, pixel, pixel);
    }
    if(((i%2)==1)&&(j%2==1)){
    fill(255,255,255);
    rect(j, i, pixel, pixel);
    }
}
}
