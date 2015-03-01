
float a = 1;
float b = 1;

void setup() {
  size(400, 400);
  background(0);

}


void draw() {
 
a= a+1;
b = b +50;
  ellipse(200, 200, a, a);
  
  //chsnge colour
  fill(b,a,1);
 if (a > 300) {  // When 'a' is more than 300
    a = 1;   //reset
 

}
if (b > 255) {  // When 'b' is more than 255
    b = 1;   //reset
}

}


