

float x, y,GS,deg,degScale;

int progress, timeLimit, counter, seconds,rotations;

double inc;

void setup(){
  
  size(500,500);
  
  progress = millis();
  
  timeLimit = 1000;
  
  rotations = 1;
  
  degScale=0;
  
  counter=0;
  
  inc = .004166666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666*240;
  
  deg=270;
  
  GS=0;
  
  
  x = cos(radians(deg)) * 285;
  
  y = sin(radians(deg)) * 220;
  
  
  
  
  
  
}

void draw(){
  
  background(0);
  fill(GS);
  noStroke();
  rect(0,0,width,height/2);
  
  stroke(255);
  line(0,250,500,250);
  
  translate(250,250);
  
  
  stroke(255,0,0);
  noFill();
  
  
  
  
  
  //seconds=second();
  
  ellipse(x,y,50,50);
  
  fill(255,0,0);
  stroke(255,0,0);
  translate(-250,-250);
  ellipse(250,250,5,5);
  
  int passedTime = millis() -progress;
  
  //if(passedTime>timeLimit){
    
    x = cos(radians(deg)) * 285;
  
    y = sin(radians(deg)) * 220;
    counter++;
    
    println(counter+" seconds have passed.");
    
    if(deg>180 && deg<=270){
    
    degScale = map(deg,180,270,0,255);
    
    GS = degScale;
    
    println(degScale);
    
  } else if(deg>270&&deg<360){
    
    degScale = map(deg,270,360,255,0);
    
    GS = degScale;
    
    println(degScale);
    
  } else{
   GS = 0; 
  }
    
    progress = millis();
  
    deg+=inc;
  //}
  println("pure: "+deg);
  //println("alter: "+deg/rotations);
  
  if(deg>=360){
    deg=0;
    
    
  }
  
  
  
  
  
  
}


