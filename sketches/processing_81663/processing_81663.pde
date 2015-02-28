
float a, b, x, y, r, theta, rr, thetas, ground;

void setup(){
  size(333,333);
  
  r = 155;
  theta = 0;
  
  rr = 50;
  thetas = 0;
  
  ground = 0;
}


void draw(){
  
background(ground++);
if(ground > 300){
  ground = 0;
}

 
  
  float x = r * cos(theta/2);
  float y = r * sin(theta/6);
  fill(random(100,200));
  rect(x + 150, y + 154, 24, 24);
  theta += 3;
  
  float a = rr * cos(thetas/7);
  float b = rr * sin(thetas/4);
  fill(random(0,100));
  rect(a + 140, b + 160, 40, 40);
   thetas += 2; 
  
 
  
  
  
}
  

