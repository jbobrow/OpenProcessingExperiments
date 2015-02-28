
//variable element 1
float x = 25;
float y = 25;

//variable element 2
float x2 = 25;
float y2 = 25;

//variable element 3
float x3 = 25;
float y3 = 25;

//speed element 1
float speedX = 0.5;
float speedY = 1.2;

//speed elent 2
float speedX2 = 1.2;
float speedY2 = 1.2;

//speed elent 3
float speedX3 = 1.2;
float speedY3 = 0.5;


void setup(){
  size(400, 400);
  smooth();
  background(255);
}

void draw(){
  noStroke();
  //tranparency
  fill(0, 6);
  rect(0, 0, width, height);
  
  //speed element 1
  if(x >= 375 || x < 25){
  speedX = speedX * -1;
  }
  
   if (y >= 375 || y < 25) {
   speedY = speedY * -1;
   }
   
  //speed elemt 2
     if(x2 >= 388 || x2 < 12){
  speedX2 = speedX2 * -1;
  }
  
   if (y2 >= 388 || y2 < 12) {
   speedY2 = speedY2 * -1;
   }
   
  //speed elemt 3
     if(x3 >= 393 || x3 < 7){
  speedX3 = speedX3 * -1;
  }
  
   if (y3 >= 393 || y3 < 7) {
   speedY3 = speedY3 * -1;
   }

  
  //element 1
  fill(0);
  noStroke();
  ellipse(x, y, 50, 50);
  x = x + speedX;
  y = y + speedY;
 
  
  fill(255, 0, 0);
  noStroke();
  ellipse(x, y, 50, 50);
  x = x + speedX;
  y = y + speedY;
  
      //element 2
    fill(0);
    noStroke();
    ellipse(x2, y2, 24, 24);
    x2 = x2 + speedX2;
    y2 = y2 + speedY2;
    
    fill(0, 0, 255);
    noStroke();
    ellipse(x2, y2, 24, 24);
    x2 = x2 + speedX2;
    y2 = y2 + speedY2;
    
          //element 3 
      fill(0);
      noStroke();
      ellipse(x3, y3, 14, 14);
      x3 = x3 + speedX3;
      y3 = y3 + speedY3;
    
      fill(0, 255, 0);
      noStroke();
      ellipse(x3, y3, 14, 14);
      x3 = x3 + speedX3;
      y3 = y3 + speedY3;
  

  if(mousePressed){

  speedY = speedY + 0.04 * - 1 ;
   speedX2 = speedX2 + 0.04 * -1;
    speedX3 = speedX3 + 0.04 * -1;
  
  }

}

