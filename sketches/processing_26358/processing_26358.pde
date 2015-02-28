


void setup() {
  size(500,500);
  smooth();
}

void draw() {
  star(200,300,100);
  star(200,30,10);
  star(100,150,40);
  

}


void star(int x, int y, float radius){
  beginShape();
  for(int i = 0; i <= 20; i++){
    fill(200,100,100);
    stroke(200,100,100);
    float yStar = sin(radians(i*135)) * radius + y;
    float xStar = cos(radians(i*135)) * radius + x;
    vertex(xStar, yStar);
    
   }
   endShape();
  
}

