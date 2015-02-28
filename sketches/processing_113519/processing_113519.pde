

int eSize = 7;

size(800,800);

background(255);
noStroke();
smooth();

for(int y=0; y<=height; y+=10){
for(int x=0; x<=width; x+=10){

if(x < width/2 && y < height/2){ 
fill(x,y,0); 
}
if(x >= width/2 && y < height/2){ 
fill(0,x,y); 
}
if(x < width/2 && y >= height/2){ 
fill(x,0,y); 
}
if(x >= width/2 && y >= height/2){ 
fill(y,x,0); 
}

rect(x, y, eSize, eSize);
}}

fill(250,200,0,80);
rect(300,300, 300,300);

fill(0,200,250,80);
rect(200,200, 300,300);

fill(250,0,250,100);
rect(400,400,250,250);

fill(255,100);
rect(500,500,250,250);

fill(255,100);
rect(100,100,250,250);

fill(255,0,0,50);
rect(0,650,250,250);

fill(0,255,0,50);
rect(650,650,250,250);

fill(0,0,250,20);
rect(650,0,250,250);

fill(255,100);
rect(550,100,250,250);

fill(0,0,255,20);
rect(450,250,300,300);

fill(0,255,0,60);
rect(120,550,250,250);







