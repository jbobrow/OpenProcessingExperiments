
float x = 0;
float y = 0;

float c = 200;

float mag = 5;

void setup() {
  size(400, 400);
  background(0);
  stroke(c);

}

void draw() {

 stroke(c);
  
  if(x!=width)
  {
   x += mag;
   y += mag;   
   line(0,y,x,height);  
    c-= 2;
  }
  

  
}
