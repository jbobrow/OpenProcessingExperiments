


 
int timeOff = 300;
int timeOn = 500;
int lastTime;
boolean dotsOn = true;
 
void setup() {
  smooth();
  size(400, 400);

  lastTime = millis();
  println(lastTime);
  
  
  
}

  
void draw() {
 background(33,33,33);




      drawDots(int(width * .5), int(height * .5));
      drawDots(int(width * .10), int(height * .10));
      drawDots(int(width * .30), int(height * .30));
      drawDots(int(width * .70), int(height * .70));
      drawDots(int(width * .90), int(height * .90));
             
          
   
}

  




void drawDots(int center_x, int center_y) {
  
  
     if(dotsOn == true){
     fill(196,58,4);
     noStroke();
     ellipse(center_x, center_y, 50, 50);
      
     if(timeOn < millis() - lastTime){
       dotsOn = false;
       lastTime = millis();
       println("dot is blue");
     }
    
   }else{
     fill(50,129,224);
     ellipse(center_x, center_y, 100, 100);
      
     if(timeOff < millis() - lastTime){
       dotsOn = true;
       lastTime = millis();
       println("dot is orange");
     }
   }
    
    
   
  
   
  // draw fillament
  noFill();
  beginShape();
  vertex(center_x - 10, center_y + 50);
  for (int i = center_x - 20; i <= center_x + 20; i+=5) {


  }

  endShape();
  
  
}






