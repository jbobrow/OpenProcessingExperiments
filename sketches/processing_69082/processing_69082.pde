
size(400,400);
noSmooth();
background(0);

for(int i= 20; i<=380; i=i + 20) {
  for(int j=20; j<=380; j=j + 20){
    fill(255,255,0);
    quad(i,j,25,25,30,30,35,35);
  }    
}
