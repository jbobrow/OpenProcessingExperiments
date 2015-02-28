
class Creature{
  //variables needed to draw creature
  
    float localX = 440;
    float localY = 400; 
    color c;
    float xspeed;
  
  //creature colors in useful variable form 
int r1=0;   int g1=178; int b1=233; 
int r2=255; int g2=233; int b2=95;
            int g3=255; int b3=255; 
            int g4=0;   int b4=0;
            int g5=103; int b5=56;
int r3=127; int g6=195; int b6=87; 
int r4=200; int g7=35;  int b7=34; 

  //stroke weights
int wei1=10; int wei2=3; int wei3=1;
int wei4=7;  int wei5=5;
  
  //constructor 
  Creature(color tempC, float tempPosX, float tempPosY, float tempXspeed){
    c = tempC;
    localX = tempPosX;
    localY = tempPosY;
    xspeed = tempXspeed;
    
  }
    
    //draws the creature
 void display() {
 rectMode(CORNERS); 
  ellipseMode(CORNERS); 
  
  //draw arms
  strokeWeight(wei1); 
  stroke(c); 
  line(localX-134,localY-120,localX-254,localY-30);
  line(localX-254,localY-30,localX-194,localY+30);
  line(localX+136,localY-120,localX+256,localY-30);
  line(localX+256,localY-30,localX+196,localY+30);
  
  //draw eye holder stems
  strokeWeight(wei1);
  stroke(c);
  line(localX-74,localY-240,localX-14,localY-150);
  line(localX+76,localY-240,localX+16,localY-150);
  
  //draw frills
  strokeWeight(wei2);
  stroke(r2,g2,b2);
  fill(r2,g2,b2);
  ellipse(localX-194,localY-150,localX-44,localY-120); 
  ellipse(localX-194,localY-90,localX-44,localY-60);
  ellipse(localX+46,localY-150,localX+196,localY-120);
  ellipse(localX+46,localY-90,localX+196,localY-60);
  
  //draw eyes
  strokeWeight(wei1);
  stroke(c);
  fill(r2,g3,b3);
  ellipse(localX-104,localY-300,localX-14,localY-210); 
  ellipse(localX+16,localY-300,localX+106,localY-210);
  
  //draw eyebrows
  strokeWeight(wei3);
  stroke(r1,g4,b4); 
  fill(r1,g4,b4);
  rect(localX-104,localY-330,localX-14,localY-300);
  rect(localX+16,localY-330,localX+106,localY-300);
  
  //draw body
  strokeWeight(wei3);
  stroke(c);
  fill(c);
  ellipse(localX-134,localY-180,localX+136,localY);
  
  //draw pupils
  strokeWeight(wei4);
  stroke(r1,g5,b5);
  fill(r3,g6,b6);
  rect(localX-74,localY-270,localX-44,localY-240);
  rect(localX+46,localY-270,localX+76,localY-240);
  
  //draw tummy
  strokeWeight(wei3);
  stroke(r2,g2,b2);
  fill (r2,g2,b2);
  ellipse(localX-74,localY-120,localX+76,localY); 
  
  //draw mouth
  strokeWeight(wei5);
  stroke(r1,g4,b4);
  line(localX-14,localY-150,localX+16,localY-150);
  
  //draw punching bags
  strokeWeight(wei3);
  stroke(r4,g7,b7);
  fill(r4,g7,b7);
  rect(localX-194,localY,localX-134,localY+60);
  rect(localX+136,localY,localX+196,localY+60);
  ellipse(localX-164,localY-60,localX-14,localY+90);
  ellipse(localX+16,localY-60,localX+166,localY+90); 
}

  //man these crabs sure are annoying when they move
void move() {
    localX = localX + xspeed;
    if (localX > width) {
      localX = 0;
    }
}

//punch out pete sure is annoyed by these crabs 
void jiggle (float speed){
  localX = localX + random(-1,1)*speed;
  localY = localY + random(-1,1)*speed;
  localX = constrain (localX,0,width-300);
  localY = constrain (localY,0,height-300);
}

}


