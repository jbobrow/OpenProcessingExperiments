
int monstertjeX;
int monstertjeY;


void setup() {
  size(200, 200);
  monstertjeY = height+100;

}

void draw() {
  //lijf
  background(255);
  stroke(0);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(monstertjeX, monstertjeY, 100, 100);

  //binnenkant lijf
  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(monstertjeX,monstertjeY, 40, 40);

  //oog links
  fill(255, 255, 255);
  ellipse(monstertjeX-15,monstertjeY-33, 20, 20);
  fill(0);
  ellipse(monstertjeX-15,monstertjeY-30, 10, 10);

  //oog rechts
  fill(255, 255, 255);
  ellipse(monstertjeX+15, monstertjeY-33, 20, 20);
  fill(0);
  ellipse(monstertjeX+15,monstertjeY-30, 10, 10);

  //benen
  line(monstertjeX-20, monstertjeY+45, monstertjeX-20, monstertjeY+65);
  line(monstertjeX+20, monstertjeY+45, monstertjeX+20, monstertjeY+65);
  strokeWeight(3);

  //armen
  line(monstertjeX-70, monstertjeY-10, monstertjeX-40, monstertjeY);
  line(monstertjeX+40, monstertjeY, monstertjeX+70, monstertjeY-10);

  //voeten
  fill(0, 0, 255, 150);
  rect(monstertjeX-35, monstertjeY+65, 15, 10);
  fill(0, 0, 255, 150);
  rect(monstertjeX+20, monstertjeY+65, 15, 10);
  
  //tanden
  fill(255);
  rect(monstertjeX,monstertjeY-17,7,10);
  rect(monstertjeX-10,monstertjeY-17,7,10);
  rect(monstertjeX,monstertjeY+7,7,10);
  rect(monstertjeX-10,monstertjeY+7,7,10);
  
  //strik
  fill(35,180,40);
  ellipse(monstertjeX-20,monstertjeY+33,30,30);
  ellipse(monstertjeX+20,monstertjeY+33,30,30);
  ellipse(monstertjeX,monstertjeY+35,25,25);
  
   monstertjeY = monstertjeY-1;
   monstertjeX = mouseX;

}

