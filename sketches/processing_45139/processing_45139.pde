
//Homework, make a creative clock
//11,5,11
//Denali Schmidt

float miliA,secondsA,minutesA,hoursA;
float mili,seconds,minutes,hours;
float angle,ellsizes,ellsizem,ellsizeh,anglem,angleh;
float ellsizesA,ellsizemA,ellsizehA;
int mode = 0;
int modeA = 0;

void setup(){
  size(600,600);
  noStroke();
  textMode(CENTER); 
}

void draw(){
  
  background(0);
  fill(255);
 
  
  switch(mode){
    
    // initial screen
    case 0:
    text("This is a strange clock, or rather time device, that grows as time goes on, " ,50,200);
    text("the arms getting faster"  ,50,222);
    text("click to start the clock" ,50,342);
    text("click again to toggle between a sped-up version and back" ,50,362);
    break;

 //first clock, grows in normal time
 case 1:
  seconds = 0;
  minutes = 0;
  hours = 0;
  
    
  noStroke();
  background(0);
  
  mili = millis();
  seconds = mili/1000;
  minutes = mili/60000;
  hours = mili/3600000;
  
  //all ellispes are sped up so you can see their progress
  
  //milisecond ellipse
  fill(0,0,300,80);
  ellipse(300,300,mili,mili);
  //second ellipse
  fill(240,230,40,90); 
  ellipse(300,300,(seconds),(seconds));
  //minute ellipse
  fill(300,0,0,80);
  ellipse(300,300,(minutes),(minutes));
  //hour ellipse
  fill(0);
  ellipse(300,300,(hours),(hours));
 
  //second hand, rotation according to amount of seconds
  fill(255);
  float lineA = sin(radians(angle)) * ellsizes + width/2 ;
  float lineB = cos(radians(angle)) * ellsizes + height/2;
  stroke(255);
  strokeWeight(2);
  line(300,300,lineA,lineB);
  
  //minute hand, rotation according to amount to minutes
  float lineC = sin(radians(anglem)) * ellsizem + width/2 ;
  float lineD = cos(radians(anglem)) * ellsizem + height/2;
  strokeWeight(1);
  line(300,300,lineC,lineD);
  
  //hour hand, rotation according to amount of hours
  float lineE = sin(radians(angleh)) * ellsizeh + width/2 ;
  float lineF = cos(radians(angleh)) * ellsizeh + height/2;
  strokeWeight(.5);
  line(300,300,lineE,lineF);
  
  //digital dispay of ellapsed time
  text("second: " + int(seconds),10,10);
  text("minutes: " + int(minutes),250,10);
  text("hours: " + int(hours),510,10);
 
  angle -= seconds;
  ellsizes = seconds;
  ellsizem = minutes;
  ellsizeh = hours;
  anglem -= minutes;
  angleh -= hours;
  break;


    //second screen, sped up clock, grows 1000 times faster
    case 2: 
      secondsA = 0;
      minutesA = 0;
      hoursA = 0;
    
      noStroke();
      background(0);
     // fill(0,(minutes));        //how do I make it change color with time?
    //  rect(0,0,width,height);
  
      miliA = millis();
      secondsA = miliA/1;
      minutesA = miliA/60;
      hoursA = miliA/3600;
  
      //all ellispes are sped up so you can see their progress
  
      //milisecond ellipse
      fill(0,0,300,70);
      ellipse(300,300,miliA,miliA);
      
      //second ellipse
      fill(240,80); 
      ellipse(300,300,secondsA,secondsA);
      
      //minute ellipse
      fill(300,0,0,80);
      ellipse(300,300,minutesA,minutesA);
      
      //hour ellipse
      fill(0,50);
      ellipse(300,300,hoursA,hoursA);
      
      //second hand, rotation according to amount of seconds
      fill(255);
      float linea = sin(radians(angle)) * ellsizesA + width/2 ;
      float lineb = cos(radians(angle)) * ellsizesA + height/2;
      stroke(255);
      strokeWeight(2);
      line(300,300,linea,lineb);
      
      //minute hand, rotation according to amount to minutes
      float linec = sin(radians(anglem)) * ellsizemA + width/2 ;
      float lined = cos(radians(anglem)) * ellsizemA + height/2;
      strokeWeight(1);
      line(300,300,linec,lined);
      
      //hour hand, rotation according to amount of hours
      float linee = sin(radians(angleh)) * ellsizehA + width/2 ;
      float linef = cos(radians(angleh)) * ellsizehA + height/2;
      strokeWeight(.5);
      line(300,300,linee,linef);
      
      //digital dispay of ellapsed time
      text("second: " + int(secondsA),10,10);
      text("minutes: " + int(minutesA),250,10);
      text("hours: " + int(hoursA),510,10);
 
      angle -= secondsA;
      ellsizesA = secondsA;
      ellsizemA = minutesA;
      ellsizehA = hoursA;
      anglem -= minutesA;
      angleh -= hoursA;
      break;

/*        //this didn't do anything, it was supposed to reset the clock!
case 3:
 angle = 0;
  anglem = 0;
  angleh = 0;
  ellsize = 0;
  miliA = 0;
  secondsA = 0;
  minutesA = 0;
  hoursA = 0;
  mili = 0;
  seconds = 0;
  minutes = 0;
  hours = 0;
  
  break;
*/
  }
}


void mouseReleased(){
  mode++;

  if(mode > 2){
    mode = 1;
  println(mode);
  }
}

/*
void keyPressed(){
  modeA ++;
  modeA = keyCode;
}*/

