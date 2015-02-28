
  //Amanda Chung 2014 Creative Computing Benjamin Bacon
 //click to change color
 
 float c;
 float c1;
 float c2;
 float c3;
 float c4;
 float easing = 0.5;

  void setup() {
    size(1000,600);
    background(0);
    smooth();
  }

  void draw() {
    
    c = random(0,255);
    c1 = random(0,255);
    c2 = random(0,255);
    c3 = random(0,255);
    c4= random(0,255);
    
    strokeWeight(5);
    stroke(c,c,c);
    line(mouseX,0,mouseX,mouseY);
    stroke(c,c,c);
    line(mouseX,1000,mouseX,mouseY);
    stroke(c3,c4,c2);
    line(500,300,mouseX,mouseY);
    stroke(c3,c1,c2);
    line(0,0,mouseX,mouseY);
    stroke(c3,c,c2);
    line(1000,600,mouseX,mouseY);

    if (mousePressed == true) {
      background(c4,c3,c);
    }
    
  }


