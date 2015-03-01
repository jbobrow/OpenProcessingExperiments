

float angle;
float a=0;
void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){



// rotation origine moves diagonaly
  translate(a, a);
a=a+1;
//spesifies a predefined float
  rotate(angle);
//increasing the rotation by 1 every time
  angle=angle+1; 
//size of object
  rect(0, 0, 50, 50);   




}


