
float ball1X = 5;
float ball1Y = 5;
float ball1Size = 10;
float ball1Speed = 10;
boolean ball1_IsActive = true;
color ball1Color = color(255, 0, 24);  

float ball2X = 15;
float ball2Y = 5;
float ball2Size = 20;
float ball2Speed = 5;
boolean ball2_IsActive = true;
color ball2Color = color(255, 24, 50);  

float ball3X = 15;
float ball3Y = 5;
float ball3Size = 20;
float ball3Speed = 5;
boolean ball3_IsActive = true;
color ball3Color = color(255, 204, 0);  


boolean begin = false;

void setup(){
  size(600, 400);
  background(0);
  textSize(20);
  textAlign(CENTER);
  text("Press Enter to make it rain", 300, 100);
}

void draw(){
  
   if(begin){
     background (0);// clear the background
     if(ball1_IsActive){ // draw ball 1
       ball1Y += ball1Speed;
       
       ellipse(ball1X, ball1Y, ball1Size, ball1Size); 
       fill(ball1Color);
     }
     if(ball1Y >400){
        ball1Y = 0; 
        ball1X = random(0, 550);
        ball1Size = random(3,15);
        ball1Speed = random(5,10);
        ball1Color = color(random(0,255), random(0,255), random(0,255));
     }
     
      if(ball2_IsActive){ // draw ball 1
       ball2Y += ball2Speed;
       
       ellipse(ball2X, ball2Y, ball2Size, ball2Size); 
       fill(ball2Color);
     }
     if(ball2Y >400){
        ball2Y = 0; 
        ball2X = random(0, 550);
        ball2Size = random(3,15);
        ball2Speed = random(5,10);
        ball2Color = color(random(0,255), random(0,255), random(0,255));
     }
     
     
      if(ball3_IsActive){ // draw ball 1
       ball3Y += ball3Speed;
       
       ellipse(ball3X, ball3Y, ball3Size, ball3Size); 
       fill(ball3Color);
     }
     if(ball3Y >400){
        ball3Y = 0; 
        ball3X = random(0, 550);
        ball3Size = random(3,10);
        ball3Speed = random(5,10);
        ball3Color = color(random(0,255), random(0,255), random(0,255));
     }
     
   }
 if(keyPressed ){
    if(key == ENTER){
      begin = true; 
     }
 }    
 
}




