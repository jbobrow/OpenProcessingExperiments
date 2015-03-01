
float theta1 = 0;
float theta2 = 0;
float theta3 = 0;
float theta4 = 0;


void setup() {
  size(750,750,P3D);
}

void draw() {
  background(0);
  stroke(0);
  fill(255);
  rectMode(CENTER);
  
  // Save the current transformation matrix. 
  // This is where we started, with (0,0) in the top left corner of the window and no rotation.
  pushMatrix(); 
  
  // Translate and rotate the first rectangle.
  translate(50,50); 
  rotateZ(theta1);
  // Display the first rectangle.
  rect(300,300,150,150); 
  // Restore matrix from Step 1 so that it isn't affected by Steps 2 and 3!
  popMatrix(); 
 
  pushMatrix(); 
  
 // Translate and rotate the first rectangle.
  translate(50,50); 
  rotateZ(theta2);
  // Display the first rectangle.
  rect(100,300,150,150); 
  // Restore matrix from Step 1 so that it isn't affected by Steps 2 and 3!
  popMatrix(); 


  pushMatrix(); 
  
  // Translate and rotate the first rectangle.
  translate(200,200); 
  rotateZ(theta3);
  // Display the first rectangle.
  rect(150,150,60,60); 
  // Restore matrix from Step 1 so that it isn't affected by Steps 2 and 3!
  popMatrix(); 
  
 
  
  theta1 += 20;
  theta2 += 30;
  theta3 += 40;
 

}


