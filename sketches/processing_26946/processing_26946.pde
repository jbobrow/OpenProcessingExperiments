

Windmill myWindmill1;
Windmill myWindmill2;
Windmill myWindmill3;
Windmill myWindmill4;
Windmill myWindmill5;

void setup () {
  size (1200,800);
  smooth ();
  
  myWindmill1 = new Windmill (100, 300); //(width/3,height/3);//locations
  myWindmill2 = new Windmill (300, 400); // width*2,height*2); //(width/3*2,height/3*3);
  myWindmill3 = new Windmill (500, 100); //(width/3*3,height/3*3);
  myWindmill4 = new Windmill (700, 300);
  myWindmill5 = new Windmill (900, 200);
}

void draw () {
  background (0);
  myWindmill1.display();
  myWindmill2.display();
  myWindmill3.display();
  myWindmill4.display();
  myWindmill5.display();
  myWindmill1.move();
  myWindmill2.move();
  myWindmill3.move();
  myWindmill4.move();
  myWindmill5.move();

}

void mousePressed () {
  //windmill rotates

  
}

  


  

