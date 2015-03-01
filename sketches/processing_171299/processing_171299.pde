
int eSize = 30;

size(400, 400);
colorMode(RGB, 400);
background(400);

//noStroke();


  for (int a = 0; a <=400; a += 35){
for (int b = 0; b <=400; b += 35)  {

  
   if(a > 200 && a < 400 && b > -30 && b < 200) {
    rect(a+4, b+4,  eSize,eSize);  
   }
   else {
    rect(a, b,  eSize-2,  eSize-2);  
  }
 
  if(a > -30 && a < 200 && b > 200 && b < 400) {
    rect(a+4, b+4,  eSize,eSize);  
   }
  else {
    rect(a, b,  eSize-2,  eSize-2);  
  }
 
  
  fill(a, a, b, 200);
  rect(a, b,  eSize, eSize);  
 fill(a, a, b, 250);
  rect(a, b, eSize , eSize );  
 fill(a, a, b, 300);
  rect(a, b,  eSize,  eSize);  
 
 

    
 
 
}
  
}
  




fill(0,100,255,100);  
ellipse(45, 35, 105, 105); 

fill(0, 130, 255,90); 
ellipse(130, 130, 80, 80); 

fill(190,0,255,80); 
ellipse(350, 100, 80, 80); 

fill(0, 190, 255,80); 
ellipse(100, 360, 220, 220); 

fill(190,0,255,70); 
ellipse(180,30, 20, 20); 

fill(0,170,255,60); 
ellipse(20, 250, 40, 40); 

fill(0,170,255,50); 
ellipse(70, 200, 70, 70); 

fill(0,170,255,50); 
ellipse(320, 270, 100, 100); 
 


 



 
 
 
 





