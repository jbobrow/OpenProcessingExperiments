
size(800,800);
noFill();
smooth();
for(int i=0; i<width; i+=28){
  for(int j=0; j<height; j+=28){
    ellipse(i,j,random(40),random(40));
  }
}
