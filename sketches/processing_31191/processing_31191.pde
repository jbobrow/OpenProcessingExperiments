
size(800,800);
background(255);
noStroke();
smooth();
strokeWeight(0.235);

for(int i =0;i<900;i+=30){
for(int j=0;j<900;j+=30){
  for(int k=100;k<850;k+=150){
    
  stroke(i*.345,200,i*.985,160);
line(i,k,k,j);
}
}
}
                
                
