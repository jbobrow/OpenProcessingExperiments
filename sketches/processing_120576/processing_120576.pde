
int eSize = 10;
 
size(400, 565);
background(0);
smooth();
rectMode(CENTER);


//undertriangle
stroke(0); 
fill(#e00000); 
triangle(20,430,196,551,400,407); 


//line
for (int y = 0; y <= height; y += 3) {
  for (int x = 0; x <= width; x += 77) {
     if (x<350 && y>80) {
    fill(246);
  }else{
    fill(55);
  }
   rect(x, y, eSize, eSize);
}}


//rightmaru
stroke(255); 
fill(#e00000); 
noStroke(); 
ellipse(350, 100, 100, 100); 


//bigtriangle2
 fill(#e00000); 
triangle(55,300,96,401,400,307); 
  quad(225, 285, 25, 250, 28, 250, 125, 0); 


//undermaru2
fill(#e00000); 
ellipse(45, 530, 40, 40); 
ellipse(389, 510, 231, 271); 


//triangleBIG
  noFill(); 
  strokeWeight(30);
  stroke(255, 255, 255); 
  triangle(20, 22, 500, width/2, height/2, 500); 



