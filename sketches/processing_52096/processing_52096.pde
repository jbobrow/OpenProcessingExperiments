
size(500,500);
smooth();
noFill();
stroke(0,0,50,90);
background(255);
 
strokeWeight(1.7);
for(int n=0;n<height;n+=20){
for(int z=0;z<width;z+=20){
line(z,n,50,500);
}
}
 
strokeWeight(1.7);
for(int n=0;n<height;n+=20){
for(int z=0;z<width;z+=20){
line(z,n,width,50);
}
}
stroke(0,60,0,20);

 
strokeWeight(0.1);
for(int n=0;n<height;n+=20){
for(int m=0;m<width;m+=20){
line(m,n,50,height);
}
}
 
strokeWeight(0.1);
for(int n=50;n<height;n+=20){
for(int m=50;m<width;m+=60){
line(m,n,500,60);
}
}
 

                
                
