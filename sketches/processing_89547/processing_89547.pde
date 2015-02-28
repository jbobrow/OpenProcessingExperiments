
//winter snowman 
//fill(247,0,0) good for Christmas Green 
//ellipses used to create rounded hat 
void setup(){
size(500,500);
background(160);
}
void draw(){
//snowman body bottom 
fill(255);
ellipse(250,400, 150,150); 
//body middle 
ellipse(250,300,110,110); 
//head 
ellipse(250,230,80,80); 
//hat 
fill(247,0,0); 
ellipse(250,200,80,20); 
fill(15,250,28); 
rect(220,130,60,70); 
fill(15,250,28); 
ellipse(250,130,60,20); 
noStroke(); 
fill(15,250,28); 
ellipse(250,200,60,10); 
//eyes 
fill(0); 
ellipse(230,230,10,10); 
ellipse(270,230,10,10); 
//nose 
fill(250,200,15); 
triangle(250,235,220,255,250,245); 
//buttons 
fill(0); 
ellipse(250,280,10,10); 
ellipse(250,310,10,10); 
ellipse(250,340,10,10); 
//arms 
stroke(2); 
line(195,300,100,340); 
line(300,300,345,210); 
//snowball
fill(220,240,242);
ellipse(345,210,30,30);
}
