
//Aly Weir
//Get the ball to the other side of the bars

//set variables
int w;
int tH1,tH2,tH3;
int bH1,bH2,bH3;

int tX1,tX2,tX3;
int tY1,tY2,tY3;

int bX1,bX2,bX3;
int bY1,bY2,bY3;

void setup(){
  size(600,400);
  background(255);
  
  w = 50;
  //top bars
  tX1 = 140;
  tX2 = 290;
  tX3 = 440;
  tY1 = tY2 = tY3 = 0;
  
  //bottom bars
  bX1 = 140;
  bX2 = 290;
  bX3 = 440;
  
  bH1 = 200;
  bH2 = 300;
  bH3 = 150; 
}

void draw(){
  //When the mouse is clicked
  if(mousePressed){
    //Bars position when clicked
    bY1 = 225;
    bY2 = 125;
    bY3 = 275;
    
    tH1 = 175;
    tH2 = 75;
    tH3 = 225; 
    background(255);
    
    noStroke();
    fill(100,0,200);
     
   } else {
    //Bars when not clicked 
    bY1 = 200;
    bY2 = 100;
    bY3 = 250;
    
    tH1 = 200;
    tH2 = 100;
    tH3 = 250; 
    background(255); 
  }
  
  //color of ball
  noStroke();
  fill(0,75,200);
  
  //is the ball inside the top bars?
  if( isInside(tX1, tY1, w, tH1) ){
     ellipse(127, mouseY, 25,25);   
  } 
  if( isInside(tX2, tY2, w, tH2) ){
     ellipse(277, mouseY, 25,25); 
  } 
  if( isInside(tX3, tY3, w, tH3) ){
     ellipse(427, mouseY, 25,25); 
  } else {
     ellipse(mouseX, mouseY, 25,25);
  }
  
  //is the ball inside the bottom bars?
  if( isInside(bX1, bY1, w, bH1) ){
     ellipse(127, mouseY, 25,25); 
  } 
  if( isInside(bX2, bY2, w, bH2) ){
     ellipse(277, mouseY, 25,25); 
  } 
  if( isInside(bX3, bY3, w, bH3) ){
     ellipse(427, mouseY, 25,25); 
  } 
   
     
  //Draw top bars
  fill(0,200,100);
  rect(tX1,tY1, w,tH1);
  rect(tX2,tY2, w,tH2);
  rect(tX3,tY3, w,tH3);
  
  //Draw bottom bars
  fill(0,100,225);
  rect(bX1,bY1, w,bH1);
  rect(bX2,bY2, w,bH2);
  rect(bX3,bY3, w,bH3);
  
}

//Method for checking whether mouse is inside object 
boolean isInside(int topLeftX, int topLeftY, int w, int h ){
  if(mouseX >= topLeftX && mouseX < topLeftX + w && 
     mouseY >= topLeftY && mouseY < topLeftY + h){
      return true;  
     } else{
      return false; 
     }
}



