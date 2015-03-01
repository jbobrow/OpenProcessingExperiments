
float x = 0;
float y = 0;

float mag = 5;

void setup() {
  size(400, 400);
  background(0);
  stroke(200);

}

void draw() {
  
  if(x!=width)
  {
   x += mag;
   y += mag;   
   line(0,y,x,height);  
  }
  
  
}
