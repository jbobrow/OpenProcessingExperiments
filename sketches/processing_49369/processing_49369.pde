
 Harry harry1;
 Harry harry2;
 
 void setup () {
  size (640,480);
  background (255);
  smooth();
  harry1 = new Harry (100,120,0.01);
  harry2 = new Harry (500,340,0.02);
}

void draw () {
  background (0);
  
  //Hit test
  harry2.hitTest(harry1);
  
  harry1.display();
  harry1.floatAround();
  
  harry2.display();
  harry2.floatAround();
 
}
 


