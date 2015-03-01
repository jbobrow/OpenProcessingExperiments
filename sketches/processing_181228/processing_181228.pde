
float x=200;
float y=200;
float w=100;
float h=100;

void setup() {
  size(400,400);
  background(40,0,0);
    
    
}

void draw() {

   
 if(mousePressed){
   
   
 background(40,0,0);
 
 if(mousePressed){
  if(mouseX >x && mouseX <x+w && mouseY >y && mouseY <y+h);
   
 noStroke();
   fill(0,0,0);
   ellipse(200,200,100,100);
   
   fill(255,0,0);
   ellipse(217,186,30,30);
   
   ellipse(230,200,13,14);
 }
   stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX -25, mouseY  , 10, 2);
  
    stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX +20, mouseY  , 10, 2);
  
   stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX , mouseY  -25, 2, 10);
  
    stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX , mouseY  +20, 2, 10);
 
  

  } else {
    
    background(40,0,0);
    
    noStroke();
      fill(0,200,150);
    ellipse(x,y,w,h);
    
    fill(0,0,0);
    ellipse(220,185,10,10);
    ellipse(180,185,10,10);
    
     stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX -20, mouseY  , 10, 2);
  
    stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX +15, mouseY  , 10, 2);
  
   stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX , mouseY  -20, 2, 10);
  
    stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(mouseX , mouseY  +15, 2, 10);

  }
 
  

  
  
}


