
void setup()
{
  size(500,500);
  background(0);
}

void draw()



{
  fill(255);
  
  pushMatrix();
  stroke(0);
  translate(150,80);
  rotate(2.3);
  rect(0,0,100,100);
  popMatrix();
  resetMatrix();
  pushMatrix();
  translate(150,190);
  rotate(2.3);
  stroke(106,250,205);
  rect(0,0,100,100);
  popMatrix();
  resetMatrix();
  pushMatrix();
  translate(150,300);
  stroke(0);
  rotate(2.3);
  rect(0,0,100,100);
  popMatrix();
  resetMatrix();
  pushMatrix();
  translate(150,410);
  stroke(106,250,205);
  rotate(2.3);
  rect(0,0,100,100);
  popMatrix();
  resetMatrix();
  
  noFill();
  stroke(255);
  ellipse(390,390,200,200);
  pushMatrix();
  translate(390,390);
  rotate(mouseX/10);
  stroke(106,250,205);
  noFill();
  rect(0,0,70,70);
  popMatrix();
  resetMatrix();
  
  ellipse(480,20,20,20);
  ellipse(440,20,20,20);
  ellipse(400,20,20,20);
  ellipse(360,20,20,20);
  ellipse(320,20,20,20);
  ellipse(280,20,20,20);
  ellipse(240,20,20,20);
  ellipse(200,20,20,20);
  
  fill(255);
  
  ellipse(500,60,20,20);
  ellipse(460,60,20,20);
  ellipse(420,60,20,20);
  ellipse(380,60,20,20);
  ellipse(340,60,20,20);
  ellipse(300,60,20,20);
  ellipse(260,60,20,20);
  ellipse(220,60,20,20);
  noFill();
  ellipse(480,100,20,20);
  ellipse(440,100,20,20);
  ellipse(400,100,20,20);
  ellipse(360,100,20,20);
  ellipse(320,100,20,20);
  ellipse(280,100,20,20);
  ellipse(240,100,20,20);
  
  fill(255);
  ellipse(500,140,20,20);
  ellipse(460,140,20,20);
  ellipse(420,140,20,20);
  ellipse(380,140,20,20);
  ellipse(340,140,20,20);
  ellipse(300,140,20,20);
  ellipse(260,140,20,20);
  
  noFill();
   ellipse(480,180,20,20);
  ellipse(440,180,20,20);
  ellipse(400,180,20,20);
  ellipse(360,180,20,20);
  ellipse(320,180,20,20);
  ellipse(280,180,20,20);
  fill(255);
  ellipse(500,220,20,20);
  ellipse(460,220,20,20);
  ellipse(420,220,20,20);
  ellipse(380,220,20,20);
  ellipse(340,220,20,20);
  ellipse(300,220,20,20);
  
  noFill();
  ellipse(480,260,20,20);
  ellipse(440,260,20,20);
  ellipse(400,260,20,20);
  ellipse(360,260,20,20);
  ellipse(320,260,20,20);
  fill(255);
  ellipse(500,300,20,20);
  ellipse(460,300,20,20);
  
 
 }
