
int myState = 0 ;
int counter = 0 ;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;


void setup() {
  one = loadImage("scene1.jpeg");
  two = loadImage("scene2.jpeg");
  three = loadImage("scene3.jpeg");
  four = loadImage("scene4.jpeg");
  five = loadImage("scene5.jpeg");
size(600, 500);

}




void draw() {
 
  background(0) ;
  println(myState) ;
 
  counter = counter + 1 ;
  if (counter > 10*frameRate) {
   myState = myState + 1 ;
   if (myState > 5) {
    myState = 0 ;
   }
  counter = 0 ;
  }
 
 
switch(myState) {
  
  case 0: 
  
  image(one, 0, 0, width, height);
  fill(155, 110);
  rect(20, 20, 250, 180, 6);
  fill(255);
  
  text("Hello World! Let's make this quick.", 35, 45);
text("Since I made the other projects", 35, 60);
text("ridiculously long, I'm going to", 35, 75);
text("have this done in a jiffy...", 35, 90);

break;


  case 1:
  image(two, 0, 0, width, height);
  fill(155, 110);
  rect(20, 20, 250, 100, 6);
  fill(255);
  text("...because sometimes time sucks.", 35, 45);
  text("I'm always trying to do several things", 35, 60);
  text("at once, which sucks even more.", 35, 75);
  
  break;
  
  case 2:
  image(three, 0, 0, width, height);
  fill(155, 110);
  rect(20, 20, 280, 150, 6);
  fill(255);
  text("And then I start thinking, 'You know what?", 35, 45);
  text("'I'll just pretend I have absolutely", 35, 60);
  text("nothing to do. Nope. Not busy at all. Ever.'", 35, 75);
  
  break;
  
  case 3:
  image(four, 0, 0, width, height);
  fill(155, 110);
  rect(20, 20, 250, 45, 6);
  fill(255);
  text("...IT'S NOT WORKING!!!", 35, 45);
  break;
  
  case 4:
  image(five, 0, 0, width, height);
  fill(155, 110);
  rect(20, 20, 260, 250, 6);
  fill(255);
  text("It's at this point, ladies and gentlemen,", 35, 45);
  text("that I must realize something important...", 35, 60);
  text("This is college. And I'm going to bed.", 35, 75);
  
  break;
}
}


