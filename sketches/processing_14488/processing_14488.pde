


void setup() {
 size(600, 600);
  noStroke();
  smooth();
}

void draw() 
{
  background(217, 255, 95);
    for (int y=0; y <= height ; y +=60){
  for (int x=0; x <= width ; x +=60) {
    fill(255, 194,129);
  noStroke();
    ellipse(x,y,60,60);
}
  }
  { if ((mouseX > 200) && (mouseX < 200+300) &&
  (mouseY >200)&& (mouseY < 200+180)){
    fill(255,0,0);
  }else{ 
      fill(0);}
  ellipse(300, 180, 200, 200);}
  
  fill(255);
  ellipse(275, 155,70,70);
  ellipse(325, 155,70,70);
  fill(0);
  ellipse(325, 155,20,20);
  ellipse(275, 155,20,20);

  noStroke();
  fill(155, 37, 67);
  triangle(175, 300, 425, 300, 300, 500);
  triangle(300, 475, 425, 650, 175, 650);
   fill(0);
  ellipse(175,300,50,50);
  ellipse(425,300,50,50);
  fill(0);
stroke(5);

  if (mousePressed) {
    if (mouseButton == LEFT)
    {
      strokeWeight(3);
      line(50, 100, 175, 300);
      line(425, 300, 425, 550);
    }
    if(mouseButton == RIGHT)
    {
     strokeWeight(3);
      line(175, 300, 175, 550);
      line(425, 300, 550, 100);
    }
  }
  else {
    strokeWeight(3);
    line(175, 300, 175, 550);
    line(425, 300, 425, 550);
   
  }
  
}



