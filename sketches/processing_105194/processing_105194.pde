
//random and noise motion
float my_num = 0;

void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  float n = noise(my_num)*width;
  float r = random(0, width);
  
  stroke(200);
  
  //with noise
  line (n, 0, n, height);
  
  //with random
  line(r, 0, r, height);
  my_num = my_num + 0.01;
  println("My r value: " + r);
}
