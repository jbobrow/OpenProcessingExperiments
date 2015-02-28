
//midterm//

float x;
float y;
float directionX;
float directionY;
 
 
void setup(){
  size(600,600);
   background(0);
   smooth();
   
  x = 433;
  y = 419;
  directionX = 2;
  directionY = 1;  
   
   
    
   noStroke();
    
 
    
     
}
 
void draw(){
  
    if (mousePressed == true) {
   //click to draw 

  {
  fill(70, 9, 82, 4);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
  
  
  text(".", mouseX, mouseY);

  fill(189, 21, 80, 100);
  
  }
}
  
  
 
  frameRate (100);
   
    ellipse(x, y, 5, 5);
    ellipse(y, x, 5, 5);
    
    
   
    x += directionX;
    y += directionY;

    if(y > height){
      directionY = -1;
    }
    
    if(y < 400){
    directionY = 8;
     
}

if(x > width){
  directionX = -1;
}

if(x < 0){
  directionX = 1;
  
  
}

}
     void keyReleased(){
  if (key=='r') setup();
}
  
  

