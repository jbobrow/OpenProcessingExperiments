

float spaceX = 300;
float spaceY = 300;
float speed = 10;
boolean noInput = true;
void setup(){
   size(600, 400);
   frameRate(60);
   smooth();
  
   background(0);
   textSize(24);
   textAlign(CENTER);
   text("Press arrow buttons to move the spaceship", 300, 50);
   // setup spaceship
  beginShape(); //Spaceship
   fill(255);
   noStroke();
   triangle(spaceX, spaceY, spaceX+22, spaceY-50,spaceX+44, spaceY); // noses
   //rect(spaceX, spaceY, 44,70);  // body
   quad(spaceX, spaceY, spaceX+44, spaceY, spaceX+34, spaceY+60, spaceX+8, spaceY+60);
   triangle(spaceX-40, spaceY+50, spaceX+22, spaceY-10, spaceX+80, spaceY+50); // wing
  
      
   endShape();
   fill(0);
   rect(spaceX+11, spaceY-25, 22,10);  // winshield
}
void draw(){
 
  // hard coding bounds for the spaceship
  if(spaceX > 510 ){
   spaceX = 510;
   return; 
  }
  else if (spaceX < 50){
   spaceX = 50;
   return; 
  }
  if(spaceY > 330 ){
   spaceY = 330;
   return; 
  }
  else if (spaceY < 60){
   spaceY = 60;
   return; 
  }
  // handle movement input
  if(keyPressed && key == CODED){
     noInput = false;
     if(keyCode == LEFT){
        //spaceX += spaceX;
        spaceX -= speed;
     } 
     else if(keyCode == RIGHT){
        //spaceX -= spaceX;
        spaceX+= speed;
     }
     else if(keyCode == UP){
       spaceY-= speed; 
     }
     else if (keyCode == DOWN){
        spaceY+=speed;
     }
 if(noInput==false){ // if no input detected then we do not clear the screen
    background(0); // clear the screen
  }
   beginShape(); //Spaceship
   fill(255);
   triangle(spaceX, spaceY, spaceX+22, spaceY-50,spaceX+44, spaceY); // noses
   //rect(spaceX, spaceY, 44,70);  // body
   quad(spaceX, spaceY, spaceX+44, spaceY, spaceX+34, spaceY+60, spaceX+8, spaceY+60);
   triangle(spaceX-40, spaceY+50, spaceX+22, spaceY-10, spaceX+80, spaceY+50); // wing
   noStroke();
      
   endShape();
   fill(0);
   rect(spaceX+11, spaceY-25, 22,10);  // winshield
   
 }
 else{
   noInput = true;
 }
 
 
  
}



