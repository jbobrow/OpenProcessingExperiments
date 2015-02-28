
/* 

  its alive
  making a circle that "breatheres" using variables and for loops.
  */
  
 int xPos = 1;
 int xC = 5;
 int yPos = 1;
 int yC = 3;
  
void setup (){
  frameRate(20);
  size(600,600);
  smooth();
}
  
void draw(){ 
  
    background(0);
    noFill(); 
    stroke(255);
    strokeWeight(20);
    ellipse(xPos,yPos,30,30);
    xPos = xPos+xC; //index x pos by 1
    if(xPos >= 600 || xPos <= 0){
      xC = -xC; // reverse when you hit edge
    }
   yPos = yPos+round(yC*1.2); //index y pos by 1
    if(yPos >= 600 || yPos <= 0){
      yC = -yC; // reverse when you hit edge
    }
  
}
