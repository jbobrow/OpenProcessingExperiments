

  float rect = 400;
  float circle = 0;
  
void setup(){
  size(400,400);
  frameRate(10);
  

}

void draw() {
  background (random(240), random(234), random(250));
  noStroke();
  //rect( 200, rect, 150, 150);
  //  rect( rect,150 , 150, 150);
 // rect( rect, 200, 150, 150);
 // rect( 150, rect, 150, 150);





 
   ellipse (200, 200, 150, circle);

  ellipse (200, 200, circle, 150);
  

  circle = circle + 5;

  rect = rect + 10;
  
  if(rect > 400) {
    rect = 0;
  }
  


}
  
 

