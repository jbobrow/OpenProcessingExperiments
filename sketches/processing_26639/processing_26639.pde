
// Borrowed parts from Learning Processing Example 14-17 and Kelsey Falter

float theta = 0;  // Global angle for rotation

float theta1 = 0.09;  // Controls the noise in alpha 


//Start classes
//Sun sun;  
Squishy squishy;

int frame = 0;


//////////SETUP////////////////

void setup() {
  
  //size(2048, 2048);
  size(500, 500);
  frameRate(30);
  smooth();


  //Initialize squishy object in setup() by call constructor
  //sun = new Sun();
  squishy = new Squishy(); 

}



///////DRAW/////////////////

void draw() {
  
  background(0);
  
  
  //Control for alternating alpha value
  float colorO = (sin(theta1) +1)*100; // The bigger the last number, the more variance in color
  //theta1 += 0.09; // color
  theta1 += 0.1; // color
  
  stroke(255, 85, 0, colorO);  //Color for the stroke lines
  
  translate(width/2,height/1.6);  // Translate to sweet spot
  
  
  // Loop from 0 to 360 degrees (2*PI radians)
  for(float i = 0; i < TWO_PI; i += 0.35) {
    
    // Push, rotate and draw a line!
    // Push #1 for the speed of circles, I think
    pushMatrix(); 
    rotate((1.7*theta) + i);
    line(0,15,500,50);
    //bezier(0, 15, theta, theta, theta, theta, 500, 50);
    //strokeWeight(5);
    
    
    // Loop from 0 to 360 degrees (2*PI radians)
    //Controls the amount of rings on the inside
    for(float j = 0; j < TWO_PI; j += 0.05) {
      
      // Push, translate, rotate and draw a line!
      // Push #2
      pushMatrix();
      
      translate(100,30);  //Controls the inside circle too
      rotate(-theta-j);
      //last part controls how big/small the inside ring is
      line(8,30,50,0);
      //bezier(8, 30, j, j, -j, -j, 50, 0);
      // We're done with the inside loop, pop!
      
      
       ///*
      // Push, translate, rotate and draw an ellipse!
      // Push #3
      //Asymetrical rings
      pushMatrix();
      translate(100, 30);
      rotate((theta) + (1));
      ellipse(width/2,height/1.5,20,20);
     
      //Coloring the inside of circles
      fill(255, 85, 0, colorO);
      
      
      /*
      // Push, translate, rotate and draw an ellipse!
      // Push #4
      
      pushMatrix();
      
      rotate(-theta-j);
      translate(350,height/1.5);
      ellipse(width/5,height/5,25,25);
     
      //Coloring the inside of circles
      fill(255, 85, 0, 30);
      
      //Close #4
      popMatrix();//*/
      
      //Close #3
      popMatrix();
      
      //Close #2
      popMatrix();
    }
    
    // We're done with the outside loop, pop!
    //Close #1
    popMatrix();
 
 
  squishy.moveInCrq(); 

  }
  
  
  // Increment theta
  theta += 0.01;



/*//Save frame code
  saveFrame("jromano-#####.jpg");
  frame = frame + 1;
  
  if (frame > 1800){
    exit();
  }*/

  //void mousePressed(){
  //  saveFrame("screenshot.jpg");


}


class Squishy { 
 
  //Variables
  int size;
  float xpos, ypos;
  float xspeed, yspeed;
  int xdirection, ydirection;
  
  Squishy() {
  
  size = 150;
  //xpos = width/2;
  //ypos = height/1.5;
  //xpos = 0;
  //ypos = 0;
  
  xspeed = 1.8;
  yspeed = 1.2;
  
  xdirection = 1;
  ydirection = 1;
 
  }  
  
  void moveInCrq() {
   
    
    
    // Update the position of the shape
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    
    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (xpos > width-size || xpos < 0) {
      xdirection *= -1;
    }
    if (ypos > height-size || ypos < 0) {
      ydirection *= -1;
    }
  
    
    // Draw the shape
    fill(0);
    //noStroke();
    ellipse(xpos+size, ypos+size, size, size);
    
  
  }

   

}

