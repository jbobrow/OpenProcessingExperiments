
//valentina pherson
//creative computing
//April 12,2013
//new clock
float blue;


void setup(){
  size(500,500);
}

void draw() {
  println(hour() + " : " +minute() + ": " + second());
  background(255);
   //these are color hours

  
  //float b= map(hour(), 0,12,0,height);
 // fill(0,0,blue);
  //rect(width,height,150,b);
 //incrementor +=.05;
  float b= map(hour(), 0,23,0,255);
  fill(b);
  rect(0,0,500,500);
  
  
  //these are horizontal seconds
  float w= map(second(), 0, 59,0,height);
  fill(0,0,0,90);
  ellipse(width/2,width/2,w,10);
  //these are vertical minutes
  float h= map(minute(), 0, 59,0,height);
  fill(255,255,255,90);
  ellipse(width/2,width/2,20,h);
 
  
}
