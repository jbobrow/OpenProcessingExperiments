
float x = 0.0;
float y = 0.0;
 
void setup(){
  size(400, 400);
  smooth();
  background(255);
}
 
void draw(){
  //click mouse to clear
   if(mousePressed){
   background(255);
   }
  frameRate(60);
  x += 5;
  y = -x + 400;
  //changed colour and put white square around using y
  stroke(#6FA062, y);
  noFill();
  rect(50, 50, x, x);
  
  stroke(#FF6AB5, y);
  noFill();
  ellipse(150, 150, x, x);
  
  stroke(#F5E672, y);
  noFill();
  ellipse(350, 350, x, x);
  //changes the size
  if (x > 300){
    x = 0;
   
  

   
  }
}


