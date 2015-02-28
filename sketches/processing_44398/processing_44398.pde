
void setup(){
  smooth();
  size(600,600);
  noCursor();
 
  
}

void draw(){
  background(255);
   fill(0);
   strokeWeight(1);
  rect(50,300,200,150);
  rect(0,450,600,300);
  ellipse(150,300,200,150);
 fill(255);
ellipse(100,300,50,50); 
ellipse(200,300,50,50);

  
  float mx = constrain(mouseX,85,115);
  float my = constrain(mouseY, 285,325);
  float lax = constrain(mouseX,0,50);
 float rax = constrain(mouseX, 250, 300);
float ay = constrain(mouseY, 300, 450); 
  //float px = constrain(mouseX,175,225);
  //float py = constrain(mouseY,275,325);
  
  fill(0);
  strokeWeight(1);
  ellipse(mx,my,10,50);
  //fill(255,0,0);
 
  ellipse(mx+100,my,10,50);  
  
  ellipse(mouseX,mouseY, 25,25);
  fill(255);
  ellipse(mouseX,mouseY,23,23);
  fill(0);
  ellipse(mouseX,mouseY, 20,20);
  fill(255);
  ellipse(mouseX,mouseY,17,17);
  fill(0);
  ellipse(mouseX,mouseY,14,14);
  fill(255);
  ellipse(mouseX,mouseY,11,11);
  fill(0);
  ellipse(mouseX,mouseY,8,8);
  fill(255);
  ellipse(mouseX,mouseY,5,5);
  
  stroke(0);
  strokeWeight(20);
  line(50,375, lax, ay);
  line(250, 375, rax,ay);
  
  
}

