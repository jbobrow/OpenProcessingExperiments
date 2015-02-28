

float eyeR;
float eyeG;
float eyeB;
 
void setup(){
  size(500,500);
  smooth();
}
 
void draw(){
   
  background(255);
  
  // Draw head
stroke(0);
fill(239,210,164);
ellipse(250,250,400,450);
   
  // Draw left eye
  fill(255);
  ellipse(130,280,170,200);
   
  //left eye move with mouse
   if(mouseX > 150 && mouseX < 250 ){
    fill(0);
    
    ellipse(mouseX-80,280,50,70);
  }else {
    fill(eyeR,eyeG,eyeB);
    eyeR = random(255);
    eyeG = random(255);
    eyeB = random(255);
    ellipse(130,280,50,70);
  }
   
  
 
  //right eye
  fill(255);
  ellipse(370,280,170,200);
   
  //right eye move with mouse
  if(mouseX >150 && mouseX < 250 ){
    
    fill(0);
    ellipse(mouseX+160,280,50,70);
  }else{
    
    fill(eyeR,eyeG,eyeB);
    eyeR = random(255);
    eyeG = random(255);
    eyeB = random(255);
    ellipse(370,280,50,70);
  }
   
   //Draw mouth
  stroke(190,0,0);
  line(200,450, 300,450);

   
   
 
  
}



