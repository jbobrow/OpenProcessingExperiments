
void setup () {
  size(800,800);
  background(224,225,100);
}

void draw () {
  
  stroke(60,151,206);
  strokeWeight(1);
  point(mouseX,mouseY);
  
  strokeWeight(1);
  line(mouseX,mouseY,450,50);
  
  strokeWeight(1);
  point(450,50);
  
  strokeWeight(1);
  line(450,50,450,450);
  
  strokeWeight(1);
  point(450,450);
  
  strokeWeight(1);
  line(450,450,50,450);
  
  strokeWeight(1);
  point(50,450);
  
  strokeWeight(1);
  line(50,450,mouseX,mouseY);

  

  
  strokeWeight(1.5);
  point(mouseX,mouseY);
  
  strokeWeight(1.5);
  line(mouseX,mouseY,450,650);
  
  strokeWeight(1.5);
  point(450,50);
  
  strokeWeight(1.5);
  line(450,650,450,450);
  
  strokeWeight(1.5);
  point(450,450);
  
  strokeWeight(1.5);
  line(450,450,650,450);
  
  strokeWeight(1.5);
  point(650,450);
  
  strokeWeight(1.5);
  line(650,450,mouseX,mouseY);
}
  
                
                
