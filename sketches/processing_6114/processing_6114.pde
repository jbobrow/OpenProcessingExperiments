


  Robot rb, rb2; //declare the object
  PImage img, man, man_2, up_arm;
  
 void setup() {
  size (640,480);
  smooth();
  img = loadImage ("alley_final.png");//background
  man = loadImage ("mustache1edit.png");// man
  up_arm = loadImage("man_up_arm_2.png");// man with arm up
  man_2 = loadImage("man_2.png");//man 2

  rb = new Robot(true); //construct the object
  rb2 = new Robot (false);
  
}
  
  void draw() {
  rb.display();
  rb2.display();
  
  //image(up_arm, 20, 20); // man with arm up
  image(man, 220, 170); // man
  
  }

 void mouseMoved( )  {

   if (mouseX < pmouseX) { //mouth shrink
    rb.mouth = rb.mouth2;
    man = man_2;
  }
  if (mouseX > 500) { //mustache contact with man
    rb.mouth = rb.mouth3;
    man = up_arm;
  }
  
  if (mouseY < pmouseY) { //eyes
  rb.eyes = rb.eyes2;
  }
  if(mouseY >pmouseY) {
  rb.eyes = rb.eyes3;
  }
    }
  


    
    

