



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



PFont font; 
int crusor = 2; 
float squareAngle = random(-PI,PI); 
float SquareSpeed = 1.7; 


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////square paramters////////////////////////////////////////////////////////////////////////////////////
float squareX = 200; 
float squareY = 100; 
float squareH = 80; 
float squareW = 80; 
 
float squareAngleT = random(0,PI); 

 
float squareHT = 0; 
float squareWT = 0; 
float squareXT = 0; 
float squareYT = 0; 


///////////////////////
float score; 
////time since beginning of running app//////////////////////////////////////////////////////////////////////
float start; 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



boolean startGame = false; 
boolean gameOver = false; 
boolean square=true; 
boolean squareTwo = false; 
boolean move=true; 
boolean moveT=false; 





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup(){ 
 size(480,420); 
 smooth(); 
 cursor(CROSS);
 font = loadFont("font.vlw"); 
 textFont(font); 
} 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw(){ 
 background(255); 
 
 
 if(!gameOver){ 
   if(!startGame){ 
     if (COLLISION(squareX, squareY, squareW, squareH,mouseX, mouseY, 0)) { 
       startGame=true; 
       start=millis(); 
        
     } 
 
   }else{ 
     if (!COLLISION(squareX, squareY, squareW, squareH,mouseX, mouseY, 0)) { 
       if (!COLLISION(squareXT, squareYT, squareWT,squareHT, mouseX, mouseY, 0)) { 
         gameOver=true; 
       } 
     } 
   } 
 
 
//////////////////////////////////////////////////////////////////////////////////////
   fill(0); 
 
  
   if(move){ 
     if(!COLLISION(squareX, squareY, squareW, squareH,mouseX, mouseY, -crusor/2)&& COLLISION(squareXT, squareYT, squareWT, squareHT,mouseX, mouseY, -crusor/2)){ 
         squareW=0; 
         squareH=0; 
         
         move=false; 
         moveT=true; 
       } 
   } 
 
 
     rect(squareX,squareY,squareW,squareH); 
     if(startGame){ 
       squareAngle+=random(-1,1); 
       squareX+= (SquareSpeed*cos(squareAngle)); 
       squareY+= (SquareSpeed*sin(squareAngle)); 
       if(squareX<0){
         squareX=0; 
         squareAngle+=PI; 
       } 
       else if(squareX>width-squareW){
         squareX=width-squareW; 
         squareAngle-=PI; 
       } 
       else if(squareY<0){
        squareY=0; 
         squareAngle+=PI; 
       } 
       else if(squareY>height-squareH){
         squareY=height-squareH; 
         squareAngle-=PI; 
       } 
        if(COLLISION(squareX, squareY, squareW, squareH,mouseX, mouseY, -crusor/2)){ 
          if(squareW>60)   squareW-=0.001*squareW; 
          if(squareH>60)   squareH-=0.001*squareH; 
        } 
     } 
 
 
 
 
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   

  
 /////////////////////////////score board 
  
   if(startGame){ 
     score=(millis()-start)/111; 
     text("" + nf(score,1, 1) , 410, 30); 
   } 
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
   else{ 
 
  
     text("Objective: keep cursor inside black box",5,50); 


     textAlign(LEFT); 
   } 
 } 
 else{ 
   
   text("GAME OVER!", 170 , 140); 
   text("SCORE: " + nf(score,1,1), 170, 170); 
   
   text("click to try again", 120, 400); 
 } 
 
 
} 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mouseClicked(){ 
 if(gameOver){ 

   startGame = false; 
   gameOver = false; 

float squareX = 200; 
float squareY = 100; 
float squareH = 80; 
float squareW = 80; 
 
 } 
} 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
boolean COLLISION(float rx, float ry, float rw, float rh, float cx, float cy, float cr) { 
 
 float circleDistanceX = abs(cx - rx - rw/2); 
 float circleDistanceY = abs(cy - ry - rh/2); 
 
 if (circleDistanceX > (rw/2 + cr)) { 
   return false; 
 } 
 if (circleDistanceY > (rh/2 + cr)) { 
   return false; 
 } 
 if (circleDistanceX <= rw/2) { 
   return true; 
 } 
 if (circleDistanceY <= rh/2) { 
   return true; 
   
 } 
 
 float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2); 
 return cornerDistance <= pow(cr, 2); 
 
} 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

