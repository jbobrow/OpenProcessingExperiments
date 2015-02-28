
void setup() {
  size(900, 500);
  smooth();
}
 
void draw() {
  background(0);
 
  for (int i = 20; i < 380; i+=20)  {
  for(int j = 40; j < 400; j+=40){
    rect(i, j, j,i);
    fill(921,942,72);
    ellipse(10,i,20,j);
    fill(200,300,32);
    translate(20,0);
    triangle(300,75,i,20,j,i);
    fill(633,243,20);
    
}
  }
}
