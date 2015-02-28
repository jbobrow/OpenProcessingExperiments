
PFont f;

void setup() {
   size(450,400); 
    f = createFont("helvetica",16,true); 
   frameRate(1);
}

void draw() {
   // set background to black
  background(0);
  
  // get my current time values
  int mySecond = second();  // Values from 0 - 59
  int myMinute = minute();  // Values from 0 - 59
  int myHour = hour();    // Values from 0 - 23
  
  // set drawing color to white
  // if (7 % 2)
  
   if(mySecond >.2) { 
 fill(#000000); 
  rect(0, 0, 550, 400);
  } else {
   fill(#ffffff);
   rect(0, 0, 550, 400);
  }
  
    // draw the hours line
  fill( random(255), random(255), random(255), random(255)); 
  rect(0, 00, myHour * 17.5, 480);
  
  
  
    // draw the minutes line 
  fill( random(255), random(255), random(255), random(255)); 
  rect(0, 100, myMinute * 7, 300);
  
  
  // draw the seconds line 
  fill( random(255), random(255), random(255), random(255)); 
  rect(0, 200, mySecond * 7 , 200);
  


  
  

  
 
  
  
  

  
  
  
  // useful function
  // lerp
  // lerpColor
  // map


}





