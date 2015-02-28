
int petalWidth = 100;
color petalCol_a = color(34,100,255);
color petalCol_b = color(123,45,78);
color centerCol_a = color(255, 255, 0);
int centerWidth_a = 30;

void setup(){
size(400, 400);
noStroke();
}

void draw(){
  pushMatrix();
  translate(width/2,height/2);
  petals();
  popMatrix();
  
  pushMatrix();
  translate(width/3,height/2);
  petals();
  popMatrix();
}  

//FUNCTIONS FOR FLOWERS
void petals(){

  //petals rectangle
  pushMatrix();
  rotate(radians(45));
  fill(petalCol_a);
  ellipse (0, 0, 20, petalWidth);
  ellipse (0,0, petalWidth, 20);
  popMatrix();
  
  //petals rectangle
  fill(petalCol_b);
  ellipse(0, 0, 20, petalWidth);
  ellipse(0, 0, petalWidth, 20);
  
  //center of the flower
  fill(centerCol_a);
  ellipse(0,0,centerWidth_a,centerWidth_a);
  
}
