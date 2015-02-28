
size(250,250); 
background(180, 173, 153);
smooth(); 
strokeWeight(2); 

for(int y=0; y<=height; y+=40){ 
for (int x=0; x<=width; x+=40){ 
noStroke();
fill(255,140, 130, 100); 
rect(x,y,50,50);}} 

for(int i=0; i<250; i+=8){ 
stroke(0, 0, 0, 175);
line(i,250,i+i/2,0); 
line(i+i/2,250,i*1.2,0);} 

for(int i=0; i<250; i+=8){ 
line(i*1.2, 250, i+i/2, 0);
}















