
size(800,800);
background(255);
noStroke();
smooth();
strokeWeight(0.15);

for(int i =0;i<1000;i+=50){
for(int j=0;j<800;j+=30){
  for(int k=50;k<850;k+=150){
    
  stroke(100,i*.25,205,100);
line(i,800,j,0);
}
}
}                
                
