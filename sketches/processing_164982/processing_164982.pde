
/*@pjs preload="mno.png"; */
int i,k;
PImage img;  

size(400,400);
background(255);
img = loadImage("mono.png");  
image(img, 0, 0); 

for(k=0;k<=400;k=k+20){
for(i=0;i<=20;i++){
  fill(0);
  noStroke();
  rect(i*20, k, 10, 10); 
};
for(i=0;i<=20;i++){
  fill(0);
  noStroke();
  rect(10+(i*20), k+10, 10, 10); 
};};


stroke(255);  
strokeWeight(40);
noFill();          
ellipse(200, 200, 350, 350); 

noStroke();
fill(255,230);          
ellipse(200, 200, 200, 200); 

img = loadImage("mno.png");  
image(img, 0, 0); 




