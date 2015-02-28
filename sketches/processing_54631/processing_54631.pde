
float posX = 300;
float posY = 50;

//spin
//velocity and acceleration


float deg = 0;          //starting degree of square
float degDelta = 0;     //min speed is 0
float degDeltaMax = 24; //max speed is 24
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
    if(key=='b'){
      posX -=5;
      posY-=5;
    }
  }

  
  pushMatrix();
  translate(320,240);
  rotate(radians(deg));
  noStroke();
  rectMode(CENTER);
  rect(0,0,posX,posY); //long
  rect(0,0,posY,posX);
    rect(100,100,10,10); //tiny
    rect(-100,-100,10,10);
    rect(-100,100,10,10);
    rect(100,-100,10,10);
    rect(70,70,10,10);
    rect(-70,-70,10,10);
    rect(-70,70,10,10);
    rect(70,-70,10,10);
    
    
  //quad(206,172,315,382,387,140,348,63);
  fill(0,163,136);
  popMatrix();
 
  //CLICK
  if(mousePressed){
    if(degDelta<degDeltaMax){   //if speed is less than the max (10)
      degDelta += 0.1;          //then speed increases by 1
    }
    else if(degDelta>degDeltaMax){ //and when speed reaches the max (10) it'll remain the max
      degDelta=degDeltaMax;
      fill(255,172,51);      
    }   
     //red
      if(degDelta>degDelta5){ 
      fill(255,172,51);
      }
     //red
      if(degDelta<degDelta5){ 
      fill(255,172,51);
    }
     //yellow
      if(degDelta<degDelta4){ 
      fill(255,255,157);
    } 
     //lightgreen
      if(degDelta<degDelta3){ 
      fill(190,235,159);
    } 
     //darkgreen
      if(degDelta<degDelta2){ 
      fill(121,189,143);
    }  
        //turquoise
      if(degDelta<degDelta1){ 
      fill(0,163,136);
    } 
  } 
    
    
  
  
  
  
  
  
  //NO CLICK
  else{
    if(degDelta>0){     //when speed is greater than 0 (this wont be realized til the mouse has stopped pressing)
      degDelta -= 0.1;  //then decrease speed by 1
    }
    else if (degDelta<0){ //and when speed reaches 0, stay at 0
      degDelta=0;
    }
      //darkgreen
      if(degDelta>degDelta2){ 
      fill(121,189,143);
    }  
       //lightgreen
      if(degDelta>degDelta3){ 
      fill(190,235,159);
    } 
      //yellow
      if(degDelta>degDelta4){ 
      fill(255,255,157);
    } 
   
   
     

   
  }
  
  

 
  deg += degDelta;
  println(degDelta);
}

