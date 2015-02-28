


void setup() {  
  size(250, 250);
  background(255);  
  
}

void draw() {  
  noStroke();
  fill(random(200), random(40), random(255), random(200));
  
  if(mousePressed == true) { 
    rect(2.5, 2.5, 2.5, 2.5);
    rect(10, 10, 10, 10);
    rect(30, 30, 30, 30);
    rect(50, 50, 50, 50);
    rect(70, 70, 70, 70);
    rect(90, 90, 90, 90);
    rect(110, 110, 110, 110);
    rect(130, 130, 130, 130);;
   
  }
  else {
     rect(5, 5, 5, 5);
     rect(20, 20, 20, 20);
     rect(40, 40, 40, 40);
     rect(60, 60, 60, 60);
     rect(80, 80, 80, 80);
     rect(100, 100, 100, 100);
     rect(120, 120, 120, 120);
  }
}
