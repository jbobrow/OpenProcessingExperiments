
size(400,400);
noSmooth();
background(0);


for(int i= 20; i<=width; i =i+30) {
  for(int j=60; j<=380; j=j + 30){
    for(int h=40; h<=380; h=h+30){
    fill(100,255,250);
    triangle(i,j,i+20,h,i,j+20);
  }
  }
}
