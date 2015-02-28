
size(900,800);
background(255);
noStroke();
smooth();
strokeWeight(0.35);

for(int i =0;i<1000;i+=50){
for(int j=0;j<800;j+=30){
  for(int k=100;k<850;k+=150){
    
  stroke(100,i*.25,205,120);
line(i,450,k,j);
}
}
}                
                
