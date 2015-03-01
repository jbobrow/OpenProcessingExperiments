
int eSize = 30;

size(400, 400);
colorMode(RGB, 400);
background(400);

//noStroke();


  for (int a = 0; a <=400; a += 35){
for (int b = 0; b <=400; b += 35)  {

 
  fill(a, a, b, 150);
  rect(a, b,  eSize, eSize);  
 fill(a, a, b, 200);
  rect(a, b, eSize , eSize );  
 fill(a, a, b, 250);
  rect(a, b,  eSize,  eSize);  
 }
 }
 

fill(0,100,255,100);  
ellipse(75, 75, 115, 115); 

fill(0, 130, 255,90); 
ellipse(130, 130, 80, 80); 

fill(190,0,255,80); 
ellipse(370, 120, 100, 100); 

fill(0, 190, 255,80); 
ellipse(100, 380, 220, 220); 

fill(190,0,255,70); 
ellipse(210,40, 30, 30); 

fill(0,170,255,60); 
ellipse(20, 250, 40, 40); 

fill(0,170,255,50); 
ellipse(60, 220, 60, 60); 

fill(0,170,255,50); 
ellipse(320, 270, 100, 100); 
 

 
 
 
 
 
 
 


