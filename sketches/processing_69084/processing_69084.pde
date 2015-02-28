
size(400,400);
noSmooth();
background(0);


for(int i= 20; i<=width; i =i+20) {
  for(int j=20; j<=380; j=j + 20){
    fill(255,5,150);
    triangle(i,j,i+10,j+20,i+20,j);
  }
}
