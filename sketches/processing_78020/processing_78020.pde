
float count = 0;
 
void setup() {
  size(400, 400);
  background(255);
  stroke(0);
}
 
void draw() {
  background(255);
  count = count + 0.5;
  if (mousePressed){
    fill(150);
  rect(0,count,400,400-count);
  fill(0,200,255);
  rect(0,count,400,-count);
  }
  line(0, count, 400, count); 
  line(160,count,-count, 400);
  line(240,count,count + 400, 400);
  
  
  
 
  if (count == 400) {
    count = 0;
  }
}
