
int eSize=8;

size(600,300);
background(255);


for(int y=-10; y<=height; y+=8){
for(int x=-10; x<=width/2; x+=8){

rect(x,y,eSize,eSize);
noStroke();
fill(y,157,x,x);

ellipse(x,y,eSize,eSize);
noStroke();



stroke(255,145,145,100);
line(x,0,0,300); 

stroke(255,224,145,100);
line(x,0,300,300); 

stroke(145,197,255,100); 
line(x,300,0,0);

stroke(145,255,158); 
line(x,300,300,0);



















stroke(20,x,100,10); 
noFill(); 
rect(300,x,80,80); 
noStroke(); 

stroke(120,x,25,10); 
noFill(); 
rect(380,x,30,30); 
noStroke(); 

stroke(100,x,30,45); 
noFill(); 
rect(410,x,80,80); 
noStroke(); 

stroke(2,x,10,35); 
noFill(); 
rect(490,x,60,60); 
noStroke(); 

stroke(40,x,255,10); 
noFill(); 
rect(550,x,50,50); 
noStroke(); 




stroke(40,x,255,10); 
noFill(); 
rect(300,x,50,50); 
noStroke(); 

stroke(2,x,10,35); 
noFill(); 
rect(350,x,60,60); 
noStroke(); 

stroke(100,x,30,45); 
noFill(); 
rect(410,x,80,80); 
noStroke();

stroke(120,x,25,10); 
noFill(); 
rect(490,x,30,30); 
noStroke(); 

stroke(20,x,100,10); 
noFill(); 
rect(520,x,80,80); 
noStroke(); 





}}



//コメント


