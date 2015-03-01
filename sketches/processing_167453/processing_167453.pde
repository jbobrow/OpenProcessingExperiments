


float num = 10;
 
void setup(){
  size(600, 600);
  background(255);
  stroke(0, 0, 0, 20);

}
 
void draw(){
  translate(width/2, height/2);
  rotate(radians(num));
  for(int i = 0; i < 360; i+=10){
    
    float x = sin(radians(i+num)) * (num+80);
    float y = cos(radians(x)) * (num-60);
    point(x, y);
    point(y, x);
    point(-x, -y);
    point(-y, -x);
  }
  
  if(num < 800) num += 0.2;
}


