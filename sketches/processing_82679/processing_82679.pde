
int xPos; 
int yPos; 
int i; 
int j; 

void setup(){


size (300, 300);
xPos = width/2;
yPos = height/2; 
i = width;
j= height; 
}


void draw() {

  background (241, 203, 122);
 
  
  for (int i= 0 ; i < width ; i = i+10){
    for (int j= 0; j < height ; j= j+10) {
    
    fill (255, 143, 23);
    ellipse(i, j , 8,8) ;
    
    
    }
  
  }
  
  // Gesicht 
   fill (255);
  noStroke();
  ellipse(xPos, yPos, xPos/2, yPos/2);
  
  // Ohren 
  ellipse(xPos-xPos/9, yPos- yPos/4, 30,90);
  ellipse(xPos+ xPos/9, yPos- yPos/4, 30, 90);
  
  // Ohren Inneres
  fill(255,222,226); 
  ellipse(xPos-xPos/9, yPos- yPos/3, 30/2,90/2);
  ellipse(xPos+ xPos/9, yPos- yPos/3, 30/2, 90/2);
  
  // augen 
  fill (0);
  ellipse (xPos - xPos/9 ,  yPos , 10,22 );
  ellipse (xPos + xPos/9 ,  yPos , 10,22 );
  
  // augen Reflexe 
  fill (255);
  ellipse (xPos - xPos/8 ,  yPos - 5 ,9,9 );
  ellipse (xPos + xPos/11 ,  yPos -5 ,9,9 );
  
  // Mund
  
  fill(0); 
  ellipse (xPos, yPos + yPos/18, 15,34); 
  fill (255); 
  ellipse (xPos, yPos + yPos/20, 17,33); 

}


