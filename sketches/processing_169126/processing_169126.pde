
int eSize = 50;
size(400, 400);
colorMode(RGB,250);
smooth();
background(0);
noStroke();
for(int y=0; y<=400; y +=10 ){
for(int x=0; x<=400; x +=10){
  fill(x,y,300,300);
  rect(x, y, eSize, eSize);
  }
} 
stroke(150);
strokeWeight(1); 
ellipse(390, 390, 50, 50); 
noFill();  
ellipse(350, 350, 100, 100); 
noFill(); 
ellipse(250, 250, 150, 150); 
noFill(); 
ellipse(100, 100, 200, 200); 
noFill(); 




