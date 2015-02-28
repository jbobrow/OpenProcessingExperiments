
void setup()

{
  size (500,500);
    background(202);
  
  
}

void draw()

{

  float pos = map(millis(), 10, 59, 0, 200);
  float gelb= map(millis(),0, 59, 0, 150);
    float gelb2= map(millis(),0, 59, 0, 150);
  
   // translate(width/2, height/2);
 // fill(140,140,140);
  //noStroke();
  //rect(0,0, 30,30);
  //rotate(gelb);
  //
  
 translate (width/2, height/2);
 rotate(gelb);
  rotateX(radians(90));
  fill(127, 0, 0);
 stroke(127,0,0);
 // rect(0, 30, 70, 70);
 triangle(30, 30, 58, 40, 30, 30);
  
  
    pushMatrix();

 translate (pos, height/2);
 // rotate(gelb2);
 rotateX(PI/3.0);
  fill(116, 116, 116);
  stroke(127,0,0);
  rect(0, 100, 20, 20);
  
  popMatrix();

  translate (width/2, height/2);
  rotate(pos);
  fill (116, 116, 116);
  line (30,20,85,250);
  
  pushMatrix();
  
 translate (mouseX, mouseY);
  //rotate(gelb);
  fill(255, 255, 255);
  stroke(127,0,0);
  noStroke();
  ellipse(0, 100, 10, 10);
  
    popMatrix();
    

  
  
  
}
