
float x=0;
float y=0;

void setup(){
  
size(600,600);
background(14,15,15);
smooth();
noStroke();


for(x = 0; x < width; x+=20){
for (y = 0; y < height; y+=20){
float r= random(255);
float b= random(255);
float g= random(255);
fill(r,g,b);
rect(x,y,40,40); 
}
}
}


