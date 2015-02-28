
float circle_x = 0;
float circle_y = 25; //circle is 50 pixels (25 to bring on to stage)
float direction = 0;

void setup() {
  size(800,450); 
  background(154,0,0); // changes the background colour.
  frameRate(50);
  stroke(255,0,0);
}

void draw() {
// background(154,0,0);    //so that background will be redrawn, not addative.
// stroke(154,87,0);
// strokeWeight(8);
// line(0,0,mouseX,mouseY);  //follows curser movement.
  
// reacts to mouse press
// if(mousePressed){
// strokeWeight(mouseY/10);         
// stroke(random(255),random(255),random(255),mouseX/3);
// line(random(width),random(height),random(width),random(height));       //generates number between given range, 100 and 200
// }

   noFill();
//   stroke(255,0,0);
   ellipse(circle_x,circle_y, 50, 50);
   
//   circle_x +=10;
   
   
//    if (circle_x > 800){
//     circle_y +=50;
//     circle_x = 0;
//   }
   
   
  
     
      if (direction == 0){
     circle_x +=10;
   }
   
   if (direction == 1){
     circle_x -=10;
   }
     
     
   if (circle_x > 800){
     direction = 1;
     circle_y +=50;
   }
   
   if (circle_x < 0){
     direction = 0;
     circle_y +=50;
   }
   
   if (circle_x > 800 && circle_y >450){
     direction = 0;
     circle_x = 0;
     circle_y = 25;
     stroke(0,0,225);
   }
 
if(mousePressed){
   stroke(0,0,255); 
}
else{
  stroke(255,0,0); 
}

}
