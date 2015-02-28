
void setup() {
  size(400,400);
  smooth();
}

void draw() {
      background(255);
    
  //set all shpes to CENTER mode
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  //stroke weight
  strokeWeight(2);

//background
noStroke();
fill(252,209,252);
rect(200,200,400,400);
fill(234,242,mouseX,160);
ellipse(200,200,400,400);
fill(152,mouseX,mouseY,100);
ellipse(200,200,300,300);
fill(mouseX,5,mouseY,40);
ellipse(200,200,200,200);

  //apple body
  fill(245,22,93);
  stroke(0);
  rect(mouseX,mouseY,40,40);
  
  //apple legs
  line(mouseX-10,mouseY+20,mouseX-10,mouseY+30);
  line(mouseX+10,mouseY+20,mouseX+10,mouseY+30);
  fill(46,34,185);
  ellipse(mouseX-15,mouseY+35,20,10);
  ellipse(mouseX+15,mouseY+35,20,10);

  //apple outer hair
  fill(245,22,93);
  stroke(0);
  ellipse(mouseX,mouseY-70,120,120);
  
  //hair bon-bons
  stroke(0);
  line(mouseX,mouseY-150,mouseX,mouseY-130);
  fill(31,191,61);
  rect(mouseX,mouseY-155,40,20);
  

  //apple face
  fill(255,216,167);
  stroke(0);
  ellipse(mouseX,mouseY-60,100,100);

  //apple eyes
  fill(0);
  ellipse(mouseX-20,mouseY-60,20,40);
  ellipse(mouseX+20,mouseY-60,20,40);
  
  //apple nose
  stroke(0);
  line(mouseX-10,mouseY-30,mouseX+10,mouseY-20);
  line(mouseX+10,mouseY-30,mouseX-10,mouseY-20);

}









