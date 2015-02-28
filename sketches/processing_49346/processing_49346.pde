
Iggy iggy1;
Iggy iggy2;

 
 
void setup() {
  size(640, 480);
   
  iggy1 = new Iggy(color(20, 250, 80),random(20,600), random(30,400));
  iggy2 = new Iggy(color(200, 250, 80),random(20,100), random(30,400));
  
  smooth();
}
 
void draw() {
  background(0);
   
  float x1 = iggy1.x;
  float y1 = iggy1.y;
  float x2 = iggy2.x;
  float y2 = iggy2.y;
   
  iggy2.hitTest(iggy1);
   
  iggy1.display();
  iggy1.groove();
  iggy1.moveArms1();
 
  iggy2.display();
  iggy2.groove();
  iggy2.moveArms1();

 
 
}

