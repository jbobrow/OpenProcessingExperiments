
/* Done by Keya Vadgama
YSDN
Winter 2012
Reference: http://www.youtube.com/watch?v=O6QrY_DeBDs&context=C45b8c5eADvjVQa1PpcFNAy0bKrfNL4d8oz572tMxblJUPPJ8qIvg=
*/
  
  
  
 float xPos;
 float yPos;
  
 float xVel = 5;
 float yVel = 6;
 
 float kPos;
 float vPos;
  
 float kVel = 5;
 float vVel = 6;
  
void setup() {
   size(500,500);
   smooth();
   xPos = width/2;
   yPos = height/2;
   kPos = width/2;
   vPos = height/2;
}
 
void draw() {
  background (0);
  xPos = xPos + xVel;
  yPos = yPos + yVel;
   
  if (yPos + 30 > height || yPos - 30 < 0 ){
      yVel = yVel * -1;}
       
   if (xPos + 30 > width || xPos - 30 < 0 ){
      xVel = xVel * -1;}
 
  fill(0, 122, 255);
  noStroke(); 
  ellipse(xPos/4,yPos/4,15,15);

   fill(255, 0, 116);
  noStroke(); 
  ellipse(xPos/3,yPos/3,22,22);
  
   fill(255, 0, 116);
  noStroke(); 
  ellipse(xPos/2,yPos/2,30,30);
  
   fill(255, 242, 0);
  noStroke(); 
  ellipse(xPos/1.5,yPos/1.5,45,45);
     
   fill(255, 242, 0);
  noStroke(); 
  ellipse(xPos,yPos,60,60);
  
  
    kPos = kPos - kVel;
  vPos = vPos - vVel;
   
  if (vPos + 30 > height || vPos - 30 < 0 ){
      vVel = vVel * -1;}
       
   if (kPos + 30 > width || kPos - 30 < 0 ){
      kVel = kVel * -1;}
 
  fill(0, 122, 255);
  noStroke(); 
  ellipse(kPos/4,vPos/4,15,15);

   fill(255, 0, 116);
  noStroke(); 
  ellipse(kPos/3,vPos/3,22,22);
  
   fill(255, 0, 116);
  noStroke(); 
  ellipse(kPos/2,vPos/2,30,30);
  
   fill(255, 242, 0);
  noStroke(); 
  ellipse(kPos/1.5,vPos/1.5,45,45);
     
   fill(255, 242, 0);
  noStroke(); 
  ellipse(kPos,vPos,60,60);  
   
}

