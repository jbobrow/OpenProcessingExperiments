
import processing.video.*;

void setup() {
  size(400, 300);
  //smooth(2); to make antialiasing
  
  noCursor();
  
}     

void draw() {
  //background(200);
  noStroke();
  // if you put 30 after the fill color you have the scia;
  fill(200, 30);
  rect(0, 0, width, height);
  
  fill(255);
  stroke(3);
  //ellipse(width/2, height/2, 100, 100);
  
  //layer Start;
  pushMatrix();
  
  //layer Movement;
  //translate(x,y);
  
  translate(mouseX-width/2, mouseY-height/2);
  
  if(mouseX < width/2){
   if(mouseY < height/2){
      fill(255, 100, 50);
   }else{
     fill(255,200,100);
   }
  } else {
   if(mouseY < height/2){
      fill(50, 100, 250);
   }else{
     fill(0,255,100);
   }
  }
  
  if(mouseX < width/2 && mouseY < height/2){
  fill(255);
  }
  

  ellipse(width/2, height/2, 100, 100);
  ellipse(185, 135, 20, 20);
  ellipse(220, 135, 20, 20);
  
    if(mousePressed){
  
  ellipse(200, 175, 60, 20);
  textSize(32);
  text("ciao!", 100, 250);
    }else{
 
    line(175, 175, 230, 175);
  
    }
  
 
  ellipse(187, 137, 3, 3);
  ellipse(222, 137, 3, 3);
  strokeWeight(3);
  
  
  //layer End;
  popMatrix();
}
