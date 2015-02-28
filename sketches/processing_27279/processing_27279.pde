
void setup () {
  size(800,800);
  background(181,225,50);
}

void draw () {
  
  stroke(60,151,206);
  strokeWeight(1.5);
  point(mouseX,mouseY);
  
  strokeWeight(1);
  line(mouseX,mouseY,450,50);
  
  stroke(random(360),random(360),random(360));
  strokeWeight(1);
  point(450,50);
  
  stroke(random(0,100));
  strokeWeight(1);
  line(450,50,450,450);
  
  
  stroke(108,16,201);
  strokeWeight(1);
  point(450,450);
  
  strokeWeight(1);
  line(450,450,50,450);
  
  strokeWeight(1);
  point(50,450);
  
  strokeWeight(1);
  line(50,450,mouseX,mouseY);

  

  
  strokeWeight(10);
  point(mouseX,mouseY);
  
  stroke(random(0,255));
  strokeWeight(1);
  line(mouseX,mouseY,450,650);
  
  strokeWeight(10);
  point(450,50);
  
  strokeWeight(1);
  line(450,650,450,450);
  
  strokeWeight(10);
  point(450,450);
  
  strokeWeight(1);
  line(450,450,650,450);
  
  strokeWeight(10);
  point(650,450);
  
  strokeWeight(1);
  line(650,450,mouseX,mouseY);
}
          
                
