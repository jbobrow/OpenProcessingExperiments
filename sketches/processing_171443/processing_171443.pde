
int eSize = 25;

size(600, 300);
colorMode(RGB, 400);
background(400);

//安定
  for (int a = 0; a <=300; a += 30){
  for (int b = 0; b <=300; b += 30)  {

    strokeWeight(3); 
  
  fill(a,b,a,a);
  rect(a+2, b+2,  eSize, eSize);  
      
}}

//変動
fill(0);
rect(300, 0, 300, 300);
  for (int a = 0; a <=300; a += 35){
  for (int b = 0; b <=300; b += 35){   

//奇数行の四角
  strokeWeight(3);
  
  fill(a, 0, a, 400);
  rect(300, b,  eSize-3, eSize-3);  
  fill(a, 0, a, 250);
  rect(320, b, eSize-5 , eSize-5);  
  fill(a, 0, a, 200);
  rect(340, b,  eSize-7,  eSize-7);     
  fill(a, 0, a, 150);
  rect(360, b,  eSize-9, eSize-9);  
  fill(a, 0, a, 100);
  rect(380, b, eSize-11 , eSize-11);  
  fill(a, 0, a, 100);
  rect(400, b,  eSize-13,  eSize-13);     
  fill(a, 0, a, 50);
  rect(420, b,  eSize-15, eSize-15);  
  fill(a, 0, a, 50);
  rect(440, b, eSize-17 , eSize-17);  
  fill(a, 0, a, 100);
  rect(460, b,  eSize-15,  eSize-15);     
  fill(a, 0, a, 150);
  rect(480, b,  eSize-13, eSize-13);  
  fill(a, 0, a, 200);
  rect(500, b, eSize-11 , eSize-11);  
  fill(a, 0, a, 250);
  rect(520, b,  eSize-9,  eSize-9);     
  fill(a, 0, a, 300);
  rect(540, b,  eSize-7, eSize-7);  
  fill(a, 0, a, 350);
  rect(560, b, eSize-5 , eSize-5);  
  fill(a, 0, a, 400);
  rect(580, b,  eSize-3,  eSize-3); 
  fill(a, 0, a, 400);
  rect(600, b,  eSize-1, eSize-1);  

//偶数行の四角
   strokeWeight(5);   

  fill(400,400,400, 80);
  rect(300, b+25,  eSize-15, eSize-15);  
  fill(400,400,400, 80);
  rect(320, b+23, eSize-14 , eSize-14);  
  fill(400,400,400, 130);
  rect(340, b+21,  eSize-12,  eSize-12);    
  fill(400,400,400, 180);
  rect(360, b+19,  eSize-10, eSize-10);  
  fill(400,400,400, 230);
  rect(380, b+17, eSize-8 , eSize-8);  
  fill(400,400,400, 230);
  rect(400, b+15,  eSize-6,  eSize-6);    
  fill(400,400,400, 280);
  rect(420, b+13,  eSize-4, eSize-4);  
  fill(400,400,4007, 300);
  rect(460, b+13,  eSize-4,  eSize-4);   
  fill(400,400,400, 350);
  rect(440, b+11, eSize-1 , eSize-1);  
  fill(400,400,400, 300);
  rect(480, b+15,  eSize-6, eSize-6);  
  fill(400,400,400, 280);
  rect(500, b+17, eSize-8 , eSize-8);  
  fill(400,400,400, 230);
  rect(520, b+19,  eSize-10,  eSize-10);     
  fill(400,400,400, 180);
  rect(540, b+21,  eSize-12, eSize-12);  
  fill(400,400,400, 130);
  rect(560, b+23, eSize-14 , eSize-14);  
  fill(400,400,400, 80);
  rect(580, b+25,  eSize-16,  eSize-16); 
  fill(400,400,400, 30);
  rect(600, b+27,  eSize-18, eSize-18);  




}}
  
  
  
 
  
  
  






