
//Image credits: "Queen Elizabeth II", 2006. ©Jane Bown
// "HAL9000", Cryteria, 2010. CC License
//

Scene1 myScene1;
Scene2 myScene2;
Scene3 myScene3;
Scene4 myScene4;
Scene5 myScene5;

public void setup() {
  background(0);//do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);
  myScene1 = new Scene1();
  myScene2 = new Scene2();
  myScene3 = new Scene3();
  myScene4 = new Scene4();
  myScene5 = new Scene5();
  background(0);
}

void draw() {

   //keep background black (LEDs are brightness based)
  stroke(255, 0, 0); //LEDs are on the scale of red
  fill(255, 0, 0);   //LEDs are on the scale of red
  tint(255, 0, 0);
  if(frameCount<=30){
  myScene1.queen();
  }
  myScene2.hal();
  myScene3.cctv();
  myScene4.bills();
  myScene5.closing();
 
  println(frameCount);

}


