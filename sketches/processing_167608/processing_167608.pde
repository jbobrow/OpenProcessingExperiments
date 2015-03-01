
float a = 400;
float b = 400;

void setup() {
  size(400, 400);
  background(255);

}

void draw() {
  //increases by .5
a=a+.5;

ellipse(200,a,a,a);



  
  b=b-.5;

ellipse(200,b,b,b);
}



