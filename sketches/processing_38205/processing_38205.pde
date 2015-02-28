
void setup() {
  size(400, 400);
  background(0);
  stroke(30, 120, 250, 50);
  strokeWeight(1);
  noStroke();
  smooth();
}


//primary rotation
int i = 100; 
//rotation at the radius
int j = 1; 

void draw() {


  //centers the drawing
  translate(width/6, height/1);  
  // rotation from center
  rotate(radians(i));  
  //radius    
  translate(100, 0);             

  //ellipse
  line(0, 0, 160, 100);       


  //increment the rotation
  j+=5;
  i++;
  fill(random(0, 100), random(0, 255), 200, 50);
  stroke(255);

  //center the drawing
  translate(width/2, height/2);  
  //rotation
  rotate(radians(i/2));   
  //radius    
  translate(20, 0);             
  rotate(radians(i));     
  // ellipse
  rect(0, 0, 160, 100);
}



