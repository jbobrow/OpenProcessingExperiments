

/*Konkuk University 
Department of Dynamic Media 
SOS iDesign 
Name:Park Seeun
ID:201420078
*/ 



float xW = 30; 
float direction =9; 
float angle=50; 


void setup() { 
size (600, 600); 
smooth(); 
background(random(255), random(255), random(255));
} 


void draw() { 
  
//basic elements 
translate(width/2, height/2); 
for (int j=200; j<width; j+=200) { 
for (int c=10; c<height; c+=10) { 
rotate(angle); 
scale(0.7); 



//ellipses
noStroke();
fill(random(225), random(225), random(225), random(225)); 
ellipse(j, c, xW, xW); 
fill(random(225), random(225), random(225), random(225)); 
ellipse(j+80, c+80, xW, xW); 
fill(255, 255, 255, 50); 
ellipse(j+100, c+100, xW, xW); 
fill(0, 0, 0, 80); 
ellipse(j+80, c+80, xW, xW); 
ellipse(j+120, c+120, xW, xW);
fill(0, 0, 0, 40); 
ellipse(j-70, c-70, xW/5, xW/5); 
ellipse(j+50, c+50, xW/2, xW/2); 
 } 


  //other  
  scale(1); 
  angle += 0.008; 
  } 


  //change 
xW = xW + (1*direction); 
if ((xW <0)||(xW>150)) { 
   direction*=-1; 
  } 
} 


void mousePressed() { 
noLoop(); 
} 

void mouseReleased() { 
loop(); 
} 

