
void setup(){
  size(500,550);

}

void draw(){
  //loading the background
  PImage bg;
  bg = loadImage("mixing bowl.jpg");
  background(bg); 
 
  //loading the arm and spoon
  PImage spoon;
  spoon = loadImage("snowman's hand and spoonlong.png");
  
  //limits the range of movement of the spoon and hand to the mixing bowl
  float mx = constrain(mouseX, 190,400);//value, min, max) for x-coordinates
  float my = constrain(mouseY, 100,210);//(value, min, max) for y-coordinates

  image(spoon, mx-100, my-100); 
       
  //loading the front of the bowl
  PImage bowlfront;
  bowlfront = loadImage("mixing-bowl-front3.png");
  image(bowlfront,0,0);
  
  }
  void mouseDragged(){
  
  //loading the word "mix" and make it seem like it's being mixed
  float mixX = constrain(random(290),150, 440);
  float mixY = constrain(random(320),270, 590);

  PImage mix;
  mix = loadImage("mix2.png");
  image(mix, mixX, mixY);
  
    PImage bowlfront;
  bowlfront = loadImage("mixing-bowl-front3.png");
  image(bowlfront,0,0);

 
}

  

