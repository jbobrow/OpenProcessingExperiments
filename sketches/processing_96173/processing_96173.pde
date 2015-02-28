

void setup(){
  size(500,500);
}

void draw(){
  fill(0);
  stroke(0);
  strokeWeight(1);
  
  rect(0,0,width,height);
  fill(255);
  stroke(0);
  
  ellipse(250,250,width,height);
  ellipse(250,250,width-50,height-50);
  fill(0);
  ellipse(250,250,width-100,height-100);
  stroke(255);
  ellipse(250,250,width-150,height-150);
  fill(57,189,247);
  stroke(0);
  ellipse(250,250,width-200,height-200);
  ellipse(250,250,width-250,height-250);
  fill(245,15,42);
  ellipse(250,250,width-300,height-300);
  ellipse(250,250,width-350,height-350);
  fill(250,242,5);
  ellipse(250,250,width-400,height-400);
  ellipse(250,250,width-450,height-450);
  fill(0);
  ellipse(250,250,width-498,height-498);

  noFill();
  stroke(14,201,43);
  strokeWeight(3);
  
  ellipse(mouseX,mouseY,40,40);
  
  // Agafat de la pràctica "bola02" del 2n seminari.
  line(0,0,mouseX,mouseY);
  line(width,height,mouseX,mouseY);
  line(width,0,mouseX,mouseY);
  line(0,height,mouseX,mouseY);
  
  line(250,0,mouseX,mouseY);
  line(250,500,mouseX,mouseY);
  line(0,250,mouseX,mouseY);
  line(500,250,mouseX,mouseY);
  
  noCursor();
}


