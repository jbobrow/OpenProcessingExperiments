
size(500,500);
smooth();
noFill();

strokeWeight(0.1);
for(int n=0;n<height;n+=20){
for(int m=0;m<width;m+=20){
line(m,n,0,0);
}
}

strokeWeight(0.1);
for(int n=0;n<height;n+=20){
for(int m=0;m<width;m+=20){
line(m,n,width,0);
}
}

strokeWeight(0.1);
for(int n=0;n<height;n+=20){
for(int m=0;m<width;m+=20){
line(m,n,0,height);
}
}

strokeWeight(0.1);
for(int n=0;n<height;n+=20){
for(int m=0;m<width;m+=20){
line(m,n,width,height);
}
}

stroke(0);
strokeWeight(0.2);
for(int j=10;j<height;j+=20){
for(int i=5;i<width;i+=10){
  ellipse(width/2,height/2,i,j);
}
}

