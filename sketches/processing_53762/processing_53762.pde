
size(200,200);
background(255);
noStroke();
fill(0);
int grid = 39;
smooth();
for (int i=3; i<width; i+=grid){
  for (int j=3; j<height; j+=grid){
//    float r = map(i,0,width,45,10);
    float r = random(0,45);
    ellipse(i+grid/2,j+grid/2,r,r);
  }
}    
save("random.png");
