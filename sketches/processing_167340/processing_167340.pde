

float angle;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){



//translate specifies theamout that the rectangle is going to be displaced wihin the window
  translate(100, 100);
//spesifies a predefined float
  rotate(angle);
//increasing the rotation by 1 every time
  angle=angle+1; 
//size of object
  rect(0, 0, 50, 50);   




}


