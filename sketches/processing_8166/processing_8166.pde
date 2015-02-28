
PFont font; 
int sizeCircle = 10; 
float squareAngle = random(0,PI); 
float squareSpeed = 1; 
float squareX = 140; 
float squareY = 120; 
float squareH = random(101,200); 
float squareW = random(101,200); 
 
float squareAngleT = random(0,PI); 
float squareSpeedT = 1; 
 
float squareHT = 0; 
float squareWT = 0; 
float squareXT = 0; 
float squareYT = 0; 
 
 
 
float score; 
float start; 
boolean startGame = false; 
boolean gameOver = false; 
 
boolean square=true; 
boolean squareTwo = false; 
boolean move=true; 
boolean moveT=false; 
 
void setup(){ 
 size(480,320); 
 
 noStroke(); 
 smooth(); 
 font = loadFont("console.vlw"); 
 textFont(font); 
} 
 
void draw(){ 
 background(255); 
 if(!gameOver){ 
   noCursor(); 
 } 
 else{ 
   cursor(); 
 } 
 
//startgame 
 if(!gameOver){ 
   if(!startGame){ 
     if (rectCircleIntersect(squareX, squareY, squareW, squareH,mouseX, mouseY, -sizeCircle/2)) { 
       startGame=true; 
       start=millis(); 
        
     } 
 
   }else{ 
     if (!rectCircleIntersect(squareX, squareY, squareW, squareH,mouseX, mouseY, -sizeCircle/2)) { 
       if (!rectCircleIntersect(squareXT, squareYT, squareWT,squareHT, mouseX, mouseY, -sizeCircle/2)) { 
         gameOver=true; 
       } 
     } 
   } 
 
 
   //first square, blue 
   fill(#00ffff); 
 
   if((squareW<60 && squareW > 0) || (squareH <60 && squareH>0)){ 
     if(square){ 
      squareHT=random(101,200); 
      squareWT=random(101,200); 
      squareXT=random(0,width-squareWT); 
      squareYT=random(0,height-squareHT); 
      square=false; 
      squareSpeedT +=0.1; 
     } 
   } 
   if(move){ 
     if(rectCircleIntersect(squareXT, squareYT, squareWT, squareHT,mouseX, mouseY, -sizeCircle/2)){ 
         squareW=0; 
         squareH=0; 
         squareTwo=true; 
         move=false; 
         moveT=true; 
       } 
   } 
 
 
     rect(squareX,squareY,squareW,squareH); 
     if(startGame){ 
       squareAngle+=random(-0.3,0.3); 
       squareX+= (squareSpeed*cos(squareAngle)); 
       squareY+= (squareSpeed*sin(squareAngle)); 
       if(squareX<0){ 
         squareAngle+=PI; 
       } 
       else if(squareX>width-squareW){ 
         squareAngle-=PI; 
       } 
       else if(squareY<0){ 
         squareAngle+=PI; 
       } 
       else if(squareY>height-squareH){ 
         squareAngle-=PI; 
       } 
        if(rectCircleIntersect(squareX, squareY, squareW, squareH,mouseX, mouseY, -sizeCircle/2)){ 
          if(squareW>60)   squareW-=0.001*squareW; 
          if(squareH>60)   squareH-=0.001*squareH; 
        } 
     } 
 
 
 
 
   //second square, green 
 
  if((squareWT<60 && squareWT>0) || (squareHT <60 && squareHT>0 )){ 
       if(squareTwo){ 
        squareH=random(101,200); 
        squareW=random(101,200); 
        squareX=random(0,width-squareW); 
        squareY=random(0,height-squareH); 
        squareTwo=false; 
        squareSpeed+=0.1; 
       } 
     } 
 
     if(moveT){ 
       if(rectCircleIntersect(squareX, squareY, squareW, squareH,mouseX, mouseY, -sizeCircle/2)){ 
         squareWT=0; 
         squareHT=0; 
         square=true; 
         move=true; 
         moveT=false; 
       } 
     } 
 
 
 
     squareAngleT+=random(-0.3,0.3); 
     squareXT+= (squareSpeedT*cos(squareAngleT)); 
     squareYT+= (squareSpeedT*sin(squareAngleT)); 
     if(squareXT<0){ 
       squareAngleT+=PI; 
     } 
     else if(squareXT>width-squareWT){ 
       squareAngleT-=PI; 
     } 
     else if(squareYT<0){ 
       squareAngleT+=PI; 
     } 
     else if(squareYT>height-squareHT){ 
       squareAngleT-=PI; 
     } 
 
 
     if (rectCircleIntersect(squareXT, squareYT, squareWT,squareHT,mouseX, mouseY, -sizeCircle/2)) { 
       if(squareWT>60)   squareWT-=0.001*squareWT; 
       if(squareHT>60)   squareHT-=0.001*squareHT; 
     } 
 
     fill(#00ff00); 
     rect(squareXT,squareYT,squareWT,squareHT); 
 
 
 
 
 
 
   fill(0); 
   ellipse(mouseX,mouseY,sizeCircle,sizeCircle); 
   textAlign(LEFT); 
 
   if(startGame){ 
     score=(millis()-start)/1000; 
     text("SCORE: " + nf(score,0,2) ,5,20); 
   } 
   else{ 
     //text("SCORE: 0",5,20); 
     textAlign(CENTER); 
     text("HOVER OVER THE SQUARE TO START.",width/2,20); 
     text("THE GAME IS OVER WHEN YOU GO",width/2,40); 
     text("OUTSIDE THE SQUARE!",width/2,60); 
     textAlign(LEFT); 
   } 
 } 
 else{ 
   textAlign(CENTER); 
   text("GAME OVER",width/2,130); 
   text("SCORE: " + nf(score,0,2), width/2,160); 
   text("CLICK TO RESTART",width/2,190); 
 } 
 
 
} 
void mouseClicked(){ 
 if(gameOver){ 
 
   squareH = random(101,200); 
   squareW = random(101,200); 
   squareX = 140; 
   squareY = 120; 
   squareHT = 0; 
   squareWT = 0; 
   squareXT = 0; 
   squareYT = 0; 
   square=true; 
   squareTwo=false; 
   startGame = false; 
   gameOver = false; 
 
 
 
 } 
} 
 
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, 
float cx, float cy, float cr) { 
 
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


