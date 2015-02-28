
size(500,500);
smooth();
background(255);
noFill();
colorMode(RGB,500);

for (int i = 0; i <=width; i=i+50) {
  for (int j = 0; j <=height; j=j+50) {
    for(int k=0; k<=width; k=k+70){
      stroke(i,j,300);
      quad(i+k/2,j+k,30,50, 20,40, 50,30);
    }
  }
}



