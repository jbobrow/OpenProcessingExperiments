
size(800,800);
background(255);
noStroke();
smooth();
strokeWeight(0.1);

for(int i =0;i<800;i+=30){
for(int j=0;j<800;j+=30){
  for(int k=50;k<850;k+=150){
    
  stroke(100,i*.25,205);
line(i,j,k,k);
}
}
}                
                
