

void setup() {
  size(640, 640);
  
}
void draw() {
  
  
  background(21, 232, 156);
  
  



  fill(#FFFFFF); 
  for (int i = 0 ; i < 10 ; i++){
for (int j = 0 ; j < 10 ; j++)
  {
   
  ellipse(70*i,70*j,10,10);
  }
}
   fill(9, 129, 86);
   ellipse(300, 300, 200, 200);
  fill(252, 252, 252);
  ellipse(300, 270, 100, 100);

  fill(3, 3, 3);
  ellipse(300, 270, 30, 30);


  text(mouseX + ", " +mouseY, 20, 20);

  fill(9, 129, 86);
  rect(385, 280, 75, 50);

  fill(9, 129, 86);
  rect(150, 280, 75, 50);

  fill(9, 129, 86);
  ellipse(151, 304, 30, 20);

  fill(9, 129, 86);
  ellipse(461, 306, 30, 20);

  fill(9, 129, 86);
  rect(255, 390, 30, 100);
  
  fill(9, 129, 86);
  rect(315, 390, 30, 100);
  
  fill(9, 129, 86);
  triangle(257,489,284,489,271,511);
  
  fill(9, 129, 86);
  triangle(318,490,344,490,331,511);
  
  fill(#FFFFFF);
  ellipse(302,359,20,20);
  
  fill(188,9,51);
  ellipse(302,365,10,10);
  
  strokeWeight(2);
  line(3,514,634,514);
 
}




