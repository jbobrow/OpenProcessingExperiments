
size(500,500); 
colorMode(RGB,100); 
background(99); 
noFill(); 
smooth(); 

int x=width/2; 
int y=height/2; 
println("x="+x+"/y="+y); 

for(int r=0;r<500;r++){ 
strokeWeight(2); 
stroke(random(100),random(100),random(100)); 
ellipse(x,y,r,r); 
strokeWeight(1); 
for(int l=0;l<50;l++){ 
line(random(width),random(height),random(width),random(height)); 
} 
} 
