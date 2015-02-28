
int x = 50;
int y = 100;
int direction = 2;
void setup (){
  size(700, 700);
  background(100);
  smooth();
  strokeWeight(4);
  stroke(0, 102);
  
}

      
void draw(){
     
   //Halftone
     noStroke();
   for (int y = -500; y <= height; y += 20){
    for(int x = -20; x <= width; x += 25){
      
      fill(random(0), random(100), random(160), 40);
      ellipse(x*2 + y/10, y,  10 - y/10.0, 10 - y/10.0);
  }
   }
   
   
  //middle
  fill(0);
  ellipse(290,180,310,310);
  
  noStroke();
  fill(77, 115, 6);
  ellipse(290, 200, 300, 300);
  
  fill(66, 155, 6);
  ellipse(280,210, 200, 200);
  
  fill(215, 168, 86);
  ellipse(285, 220, 150, 160);
  
  fill(156, 226, 255);
  ellipse(285, 240, 105, 105);
  
  fill(40, 56, 236);
  ellipse(295, 255, 60, 60);
  

  //right
  noStroke();
  
  fill(0);
  ellipse(590, 185, 310,310);
  fill(77, 115, 6);
  ellipse(590, 200, 300, 300);
  
  fill(66, 155, 6);
  ellipse(580,210, 200, 200);
  
  fill(215, 168, 86);
  ellipse(585, 220, 150, 160);
  
  fill(156, 226, 255);
  ellipse(585, 240, 105, 105);
  
  fill(40, 56, 236);
  ellipse(595, 255, 60, 60);

  //left
  noStroke();
  
  fill(0);
  ellipse(0,280, 310,310);
  fill(77, 115, 6);
  ellipse(10, 300, 300, 300);
  
  fill(66, 155, 6);
  ellipse(10,310, 200, 200);
  
  fill(215, 168, 86);
  ellipse(10, 320, 150, 160);
  
  fill(156, 226, 255);
  ellipse(10, 340, 105, 105);
  
  fill(40, 56, 236);
  ellipse(10, 355, 60, 60);
      
     
     //Head
     noStroke();
     fill(255);
     ellipse(100,90, 100,100);
     ellipse(440,30, 100,100);
     
     for(int x = 0; x < width; x++){
     fill(random(77), 115, 6);
     rect(170, 480, 280, 300);
     fill(random(66),156,6);
     ellipse(300, 500, 300,300);
     }
     
     
     //Eyes Interactive
     strokeWeight(10);
     stroke(0);
     noFill();
     arc(200, 500, 70, 70, radians(-160),radians(-20));
     arc(390, 500, 70, 70, radians(-160),radians(-20));
     noStroke();
     if(mouseX < 180|| mouseX > 480) {
       direction = -direction;
       fill(0);
     ellipse(390,480, 80,100);
     ellipse(200,480, 80,100);
     fill(255);
     ellipse(190, 470, 50, 50);
     ellipse(400, 470, 50, 50);
     }
     
     //Beak
     fill(215, 168, 86);
     triangle(200, 550, 400, 550, 300, 700);
    
}




