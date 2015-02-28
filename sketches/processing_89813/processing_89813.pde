
PImage img_01, img_02, img_03, img_04, img_05;
int count;  
float angle;
float rad = 160;
float cx, cy;

void setup() {
  smooth();
  size(600, 600);
  colorMode(HSB, 360, 100, 100);

  imageMode(CENTER);
  // change this vaule to change the speed of animation
  frameRate(60);
  img_01 = loadImage("cat1.png");
  img_02 = loadImage("cat2.png");
  img_03 = loadImage("cat3.png");
  img_04 = loadImage("cat4.png");
  img_05 = loadImage("cat5.png");
}

void draw() {
  background(255);


  /*
  A conditional statement to keep track of time
   Think of this as the timeline and keyframe in
   Aftereffects, now the count is updating itself
   by adding one everyframe, the speed of animation
   can be adjusted by changing the frameRate in setup() 
   */
  float angle = frameCount/40.0;

  float x =cx + cos(angle)*rad;
  float y =cy + sin(angle)*rad;



  //image(img_04, tan(y), x);
  //image(img_03, x+y, cos(y));

  //---------------------------------------------------FRAMERATE

  if (count > frameRate && count < frameRate*2) {      // this line of code is saying between second 1 and 2, I want to display this image
    image(img_01, width/2, y+300);
    pushMatrix();
    translate(100, 100);
    image(img_02, (x+y)*2, cos(x)+440, 100, 100);
    popMatrix();
    
    pushMatrix();
    translate(300, 100);
    image(img_04, x+200, y, 200, 200);
    popMatrix();
  }
  else if (count > frameRate*2 && count < frameRate*3) {    
    image(img_02, width/2, height/2);
    image(img_01, x+200, y+300);
  }
  else if (count > frameRate*3 && count < frameRate*4) {
    image(img_03, width/2, height/2);  
    image(img_02, x+80, y+400);
    image(img_05, x+300, y+300);
  }
  else if (count > frameRate*4 && count < frameRate*5) {
    image(img_04, width/2, height/2);

    pushMatrix();
    translate(0, 100);
    image(img_03, x, y, 300, 300);
    popMatrix();

    pushMatrix();
    translate(0, 100);
    image(img_05, (x+y)*2, cos(y)+440, 100, 100);
    popMatrix();
  }
  else if (count > frameRate*5 && count < frameRate*6) {
    image(img_05, width/2, height/2);

    pushMatrix();
    translate(50, 300);
    image(img_02, x, y, 300, 300);
    popMatrix();

    pushMatrix();
    translate(400, 50);
    image(img_04, (x+y)*2, cos(x)+250, 400, 400);
    popMatrix();
  }
  
  
  



  //---------------------------------------------------NOTES
  /*
  
   
   if( count > frameRate*4 && count < frameRate*5){
   // display a different image
   }
   
   */



  // a variable that will update itself by adding one every frame
  count++;
  //---------------------------------------------------END
}



