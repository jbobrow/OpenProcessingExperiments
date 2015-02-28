
float bob;
 
  
void setup(){
size(400,400);


}  

void draw() {
  background(255);
  bob = map(second(), 0,59, 0, 59);//set up the clock
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  fill(255,0,0,50);
  ellipse(second(), 50, 300, 300);//second 
  fill(0,255,0,30);
  rect(minute(), 50, 60, 600,50);//minute
  fill(0,0,255,20);  
  rect(hour(), 10, 10,500,50 );//hour
}
