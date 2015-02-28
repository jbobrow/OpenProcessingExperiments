
//Variables:
int col = 0;
float xpos = 0;
float ypos = 0;

void setup(){
  
  size(700,400);
  background(col);
  smooth();
}


void draw(){
  background(col);
  translate(xpos,ypos);
  
//Tan atan2 reference on processing.org
  float theta = atan2(mouseY-ypos, mouseX-xpos);
  rotate(theta);
  


  if(mousePressed == true)
   {
   noCursor();
   }
    else 
    {
    cursor(ARROW);
    }




//Colours:
//fill(16,151,13);  // green
//fill(255,0,0);    // red
  fill(23,12,232);  // blue
// fill(255,220,12); // yellow

//Shape:
  ellipse(0,0,50,50);
  
  fill(0);
  ellipse(10,0,8,8);
  
  fill(col);
  noStroke();
  triangle(15, 37, 0, 10, 30, 10);
  

  xpos = xpos + (mouseX - xpos)/10.0;
  ypos = ypos + (mouseY - ypos)/10.0;
  
  
}



