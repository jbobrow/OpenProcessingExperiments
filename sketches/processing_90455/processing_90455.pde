
float shapespeed = 0;
float shapespeedA = 0;
float shapespeedB = 0;
float shapespeedC = 0;
float shapespeedD = 0;
float time = 0;
int i = 0;
void setup() {
  size(800,500);
  
}
void draw() {
  
  
  time += 0.0167;
//rect(20,0,200,10);
  background(0);
 fill(255,255,255);

 ellipse(mouseX, 485, 30,30); 
 if (time < 5) {
   text( "5...4...3...2...1...GO!", 350, 250, 700, 700);
 }
 
 if (time > 5) {
 fill(255,0,0);
 rect(635, shapespeedD, 200, 5);
 shapespeedD = shapespeedD + 3;
 if(shapespeedD > 600) { 
    shapespeedD = 0;}
 if (mouseX < (635 + 200) && mouseX > 635 && 485 < (shapespeedD +
  5) && 485 > shapespeedD)
    {
     text("GAME OVER", 300,250,700,700);
    }
  

  rect(30, shapespeedD, 160, 5);
   shapespeedD = shapespeedD + 3;
  if(shapespeedD > 600) { 
    shapespeedD = 0;}
 if (mouseX < (30 + 160) && mouseX > 30 && 485 < (shapespeedD +
    5) && 485 > shapespeedD)
    {
 text("GAME OVER", 300,250,700,700);
    }     
 ellipse(280, shapespeed,120,120 );
    shapespeed = shapespeed + 5;
 if(shapespeed > 800) { 
    shapespeed = 0;}
 if(mouseX < (280 + 60) && mouseX > (280 - 60) && 485 < 
    (shapespeed + 60) && 485 > (shapespeed - 60))
    {
 text("GAME OVER", 300,250,700,700);
    }
    
 ellipse(553, shapespeedA,120,120 );
    shapespeedA = shapespeedA + 7;
   
 if(shapespeedA > 600) { 
     shapespeedA = 0;}
 if(mouseX < (553 + 60) && mouseX > (553 - 60) && 485 < 
    (shapespeed + 60) && 485 > (shapespeed - 60))
    { 
     text( "GAME OVER", 300, 250, 700,700);
    }
 rect(340, shapespeedB, 150, 5);
   shapespeedB = shapespeedB + 3;
 if(shapespeedB > 600) { 
    shapespeedB = 0;}
 if (mouseX < (340 + 75) && mouseX > 340 && 485 < (shapespeedD +
    5) && 485 > shapespeedD)
    {
    text("GAME OVER", 300,250,700,700);
    }        
     
 rect(200, shapespeedC, 15,150);
   shapespeedC = shapespeedC + 7;
 if(shapespeedC > 600) { 
   shapespeedC = 0;}
 if (mouseX < (200 + 15) && mouseX > 200 && 485 < (shapespeedD +
    150) && 485 > shapespeedD)
    {
    text("GAME OVER", 300,250,700,700);
    }        
     
 rect(613, shapespeedC, 15,150);
   shapespeedC = shapespeedC + 7;
 if(shapespeedC > 600) { 
   shapespeedC = 0;}
 if (mouseX < (613 + 15) && mouseX > 613 && 485 < (shapespeedC +
    150) && 485 > shapespeedC)
    {
    text("GAME OVER", 300,250,700,700);
    }       
     
  fill(255,255,255);
  if (mouseX > 750) {
  text("YOU WIN", 400,250,700,700);
 }
 }
 
 }
   




