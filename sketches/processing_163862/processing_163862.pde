
//sets size
void setup(){
  size(700,700);
}

void draw(){
  //determines background color based on mouse position
  background(mouseX,mouseY,105);
  
  //draws an ellipse
  fill(250,249,197);
  noStroke();
  ellipse(350,350,600,600);
  
  /*draws the outline of a rectangle
    stroke color is determined by mouse position */
  stroke(mouseY,mouseX,105);
  rect(200,200,300,300);
  
  //sets stroke weight to 50 
  strokeWeight(50);
  stroke(250,249,197);
  
  //prints two lines
  line(350,100,350,600);
  line(100,350,600,350);
  
}


