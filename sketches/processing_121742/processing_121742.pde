
//Adan Bachir
void setup(){ 

 size (600, 600); 
  smooth(); 
  noStroke(); 

} 

void draw(){ 


  background (249,13,210); 

  float xPos; 
  float yPos; 
  
  
  float insideColor; 
  
//bucle1
for (int x = 0; x <= width; x += 30) { 
//bucle2
for (int y = 0; y <= height; y+=30) { 

   xPos = x + random(mouseX/50); 


  yPos = y + random(mouseX/50); 
 
   insideColor = map(mouseX, 0, 250, 250, 0); 
   
textSize(80); 


 fill (random(insideColor, 255), random(insideColor, 255), random(insideColor, 255), 200); 

//espero que no tengas epilepsia
 text ("epilepsy",240,400); 

   
    fill(random(insideColor, 255), random(insideColor, 255), random(insideColor, 255), 200); 


    rect(x, y, 50, 50); 

    noFill(); 

     fill(y, x, 250); 


 rect(x, y, 25, 25); 

  fill (y, x, 244); 

  rect(xPos, yPos, 10, 10); 

  fill(x, y, 56); 


  rect(xPos, yPos, 5, 5); 



     } 
  

  } 


} 



