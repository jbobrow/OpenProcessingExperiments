
/* Credit: Prof. Nick Foxgieg class
Gina Kim
Interactivity in Design 
Project 2D
*/

float posX = 100;
float posY = 100;

 

 
 
float deg = 0;          //beginning degree of square
float degDelta = 0;     //min speed is 0
float degDeltaMax = 45; //max speed is 45
float degDelta1 = 4;
float degDelta2 = 8;
float degDelta3 = 12;
float degDelta4 = 16;
float degDelta5 = 20;
  
void setup(){
  size(640,480);
}
  
void draw(){
  background(255);
   
   
  //KEYPRESS ' '
  if(keyPressed){
    if(key==' '){
    posX += 5;
    posY += 5;
    }
    if(key=='c'){
      posX -=5;
      posY-=5;
    }
  }
 
   
  pushMatrix();
  translate(320,240);
  rotate(radians(deg));
  noStroke();
  rectMode(CENTER);
  smooth();
  rect(0,0,posX,posY); //long
  rect(0,0,posY,posX);
    ellipse(100,100,100,10); //oval shapes
    ellipse(-100,-100,100,10);
    ellipse(-100,100,100,10);
    ellipse(100,-100,100,10);
    ellipse(70,70,100,10);
    ellipse(-70,-70,100,10);
      rect (-180,-180,30,30);
       rect (-200,-200,50,50);
    ellipse(-70,70,100,10);
     rect (200,200,50,50); 
    ellipse(70,-70,100,10);
    rect (180,180,30,30);
   
     
  //quad(206,172,315,382,387,140,348,63);
  fill(#B72A6F);
  popMatrix();
  
  //CLICK
  if(mousePressed){
    if(degDelta<degDeltaMax){   //if speed is less than the max (10)
      degDelta += 0.1;          //then speed increases by 1
    }
    else if(degDelta>degDeltaMax){ //when speed reaches max of 10, it will remain the max
      degDelta=degDeltaMax;
      fill(200,399,10);     
    }  
     //red
      if(degDelta>degDelta5){
      fill(206,69,69);
      }
     //purple
      if(degDelta<degDelta5){
      fill(206,200,210);
    }
     //darker yellow
      if(degDelta<degDelta4){
      fill(214,81,19);
    }
      //turquoise
      if(degDelta<degDelta1){
      fill(10,163,136);
    }
     //darkgreen
      if(degDelta<degDelta2){
      fill(121,189,143);
    } 
    
  }
     
     
   
   
   
   
   
   
//After Click


  else{
    if(degDelta>0){     //when speed is greater than 0 (this wont be realized til the mouse has stopped pressing)
      degDelta -= 0.1;  //then decrease speed by 1
    }
    else if (degDelta<0){ //and when speed reaches 0, stay at 0
      degDelta=0;
    }
       
     
      if(degDelta>degDelta2){
      fill(10,299,29); //darkgreen
    } 
       
      if(degDelta>degDelta3){
      fill(200,140,100);//lightgreen
    }
      

      if(degDelta>degDelta4){
      fill(214,81,19);  //orange
    }
    
  }
   
   
 
  
  deg += degDelta;
  println(degDelta);
}


