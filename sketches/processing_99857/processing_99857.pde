
PFont f;
String message = "Adelaide Rocks!!";

void setup(){
  size(200,200);
  stroke(5);
  f = createFont("Arial",20,true);
}

void draw(){
   // define banner
  textFont(f);        
  text(message,20,25);

  //HEAD
  fill(0,255,0);
  ellipse(100,70,60,60);
  //eyes
  fill(255,255,0);
  ellipse(81,70,16,32);
  ellipse(119,70,16,32);
  //body
  rectMode(CORNERS);{
    fill(120,230,120);
  }
  rect(90,100,110,150);
  // Legs
  line(90,150,80,160);
  line(110,150,120,160); 
  //ARMS
  line(90,130,75,110);
  line(75,110,90,100); 

  line(110,100,125,110);
  line(125,110,110,130);
  
}




