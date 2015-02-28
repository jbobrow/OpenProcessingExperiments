

Snake s0;
Snake s1;
Snake s2;
Snake s3;
Snake s4;

void setup() {
  size(500,500);
  smooth();

  s0 = new Snake(50);
  s1 = new Snake(25);
  s2 = new Snake(5);
  s3 = new Snake(5);
  s4 = new Snake(5);
}

void draw() {

   fill(mouseX,mouseY,100,50);

  s0.update(mouseX-30,mouseY);
  s0.display();


  s1.update(mouseX+30,mouseY);
  s1.display();  
  

  s2.update(mouseX+30,mouseY+50);
  s2.display();  
  

  s3.update(mouseX+50,mouseY+50);
  s3.display();  
  

  s4.update(mouseX+70,mouseY+50);
  s4.display();  
}

void mousePressed ()  {
  background (mouseX+170,mouseY+40,50,100);
  //fill(mouseX,mouseY,50,100);
}

