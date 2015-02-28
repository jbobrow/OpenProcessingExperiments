
Eye myEye1;
Eye myEye2;
Eye myEye3;
PImage eyepic1;

void setup() {
  size(600, 600);
  myEye1= new Eye(6,8,67,8);
  myEye2= new Eye(4,10,10,3); 
  myEye3= new Eye(10,14,16,30);
  
  eyepic1 = loadImage("eyeball1.png");
}

void draw() {
  background(150,150,0);
  myEye1.move();
  myEye2.move();
  myEye3.move();
  myEye1.bounce();  
  myEye2.bounce(); 
  myEye3.bounce();
  myEye1.display();
  myEye2.display();
  myEye3.display();
}


