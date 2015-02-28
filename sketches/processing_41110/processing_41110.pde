
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 9-12: 200 Zoog objects in an array

class frog{
  // Frog's variables
  float x,y,s;

  // Frog constructor
  frog(float tempX, float tempY,float tempS) {
    x = tempX;
    y = tempY;
    s = tempS;
 
  }
  
  // Move Frog
  void move() { // For simplicity we have also removed the “speed” argument from the jiggle() function. Try adding it back in as an exercise.
    // Change the location
  float speed =5;
    float gravity = 10;
    x = x + random(-10,10);
    y = y + speed;
    speed=speed+gravity;
if(y>height-90) {
    y=height-90;
  
   x = x + random(-10,10);
    y = y -speed;
    speed=speed+gravity;
  
    
    // Constrain Zoog to window
    x = constrain(x,50,width);
    y = constrain(y,0,height-90);
  }
  }
  // Display Frog
  void display() {
    
    ellipseMode(CENTER);
    float r =random(255);
    
    

 stroke(110);
 strokeWeight(10);
 line(x-20,y+30,x-20,y+80);
 line(x+20,y+30,x+20,y+80);
 

 //Draw Frog's body
 noStroke();
 fill(y,x,r);
 ellipse(x,y,100,110);
 fill(255);
 ellipse(x,y-20,70,120);
 
 
 
 //Draw Frog's head
  noStroke();
  fill(y,x,r);
 ellipse(x,y-75,200,100);
 
 //Draw Frog's eyes
  noStroke();
   fill(y,x,r);
 ellipse(x-100,y-100,70,70);
 ellipse(x+100,y-100,70,70);
 
 //Draw Frog's eyes' ball
  stroke(110);
  strokeWeight(1.5);
  fill(255);
 ellipse(x-100,y-100,50,50);
 ellipse(x+100,y-100,50,50);
 fill(110);
 ellipse(x-90,y-90,20,20);
 ellipse(x+90,y-90,20,20);
 
 //Draw Frog's highlight
  noStroke();
  fill(255);
 ellipse(x,y-100,40,20);
 
 //Draw Frog's mouth
 stroke(110);
 strokeWeight(3);
 noFill();
 arc(x,y-80,100,50,0,PI);

 

  }
}

